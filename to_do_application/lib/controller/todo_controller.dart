import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_application/helper/todo_helper.dart';
import 'package:to_do_application/modal/todo_modal.dart';

class TodoController extends GetxController {
  Future<List<TodoModal>>? addedExpenses;

  Future<void> addData(TodoModal todo) async {
    int? res = await TodoHelper.todohelper.insertTodo(todo);
    if (res != 0) {
      Get.snackbar("Todo Added", "Done", backgroundColor: Colors.greenAccent);
    } else {
      Get.snackbar("Error", res.toString(), backgroundColor: Colors.redAccent);
    }
  }

  void fetchTodos() async {
    addedExpenses = TodoHelper.todohelper.fetchTodos();
    update();
  }

   void updateTOdo({required TodoModal modal}) async {
    int? res = await TodoHelper.todohelper.updateTodos(modal);
    if (res != null) {
      fetchTodos();
      Get.snackbar('todo Updated', "success");
    } else {
      Get.snackbar("error", "update failed");
    }

    update();
  }

  void deleteTodo(int id) async {
    int? res = await TodoHelper.todohelper.deleteTodos(id);
    if (res != null) {
      Get.back();
      fetchTodos();
      Get.snackbar("Deleted...", "Todo has benn deleted...");
    } else {
      Get.snackbar("Error", "Not deleted");
    }
    update();
  }
}
