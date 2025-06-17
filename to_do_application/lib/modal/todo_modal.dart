
class TodoModal {
  int? id;
  String? title, description, date, time, type;
  int? priority;

  TodoModal(
      {this.id,
      this.title,
      this.description,
      this.date,
      this.time,
      this.priority,
      this.type});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'priority': priority,
      'type': type
    };
  }

  factory TodoModal.fromMap(Map<String, dynamic> map) {
    return TodoModal(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        date: map['date'],
        time: map['time'],
        priority: map['priority'],
        type: map['type']);
  }
}
