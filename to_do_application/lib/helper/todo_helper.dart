import 'dart:developer';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:to_do_application/modal/todo_modal.dart';

class TodoHelper {
  TodoHelper._();
  static TodoHelper todohelper = TodoHelper._();
  Database? database;

  String tName = "todoTable";
  String toid = "id";
  String title = "title";
  String description = "description";
  String date = "date";
  String time = "time";
  String priority = "priority";
  String type = "type";

  Future<void> initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "todo.db");

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        String q = '''
        CREATE TABLE $tName (
          $toid INTEGER PRIMARY KEY AUTOINCREMENT,
          $title TEXT NOT NULL,
          $description TEXT NOT NULL,
          $date TEXT NOT NULL,
          $time TEXT NOT NULL,
          $priority INTEGER NOT NULL,
          $type TEXT NOT NULL
        );''';

        await db.execute(q);
        log("todo Created");
      },
    );
  }

  Future<int?> insertTodo(TodoModal modal) async {
    await initDatabase();
    String q =
        "INSERT INTO $tName ($title,$description,$date,$time,$priority,$type) VALUES (?, ?, ?, ?, ?, ?);";

    List argument = [
      modal.title,
      modal.description,
      modal.date,
      modal.time,
      modal.priority,
      modal.type
    ];

    return await database?.rawInsert(q, argument);
  }

  Future<List<TodoModal>> fetchTodos() async {
    await initDatabase();

    String q = "SELECT * FROM $tName";

    List<Map<String, dynamic>> res = await database?.rawQuery(q) ?? [];
    return res.map((e) => TodoModal.fromMap(e)).toList();
  }

  Future<int?> updateTodos(TodoModal modal) async {
    if (database == null) await initDatabase();

    String? q =
        "UPDATE $tName SET $title = ?, $description = ?, $date = ?,$time = ?, $type = ? WHERE $toid = ${modal.toid}";
    List l = [
      modal.title,
      modal.description,
      modal.date,
      modal.time,
      modal.type
    ];

    return await database?.rawUpdate(q, l);
  }

  Future<int?> deleteTodos(int id) async {
    if (database == null) await initDatabase();
    String q = "DELETE FROM $tName WHERE $toid = $id";
    return await database?.rawDelete(q);
  }
}
