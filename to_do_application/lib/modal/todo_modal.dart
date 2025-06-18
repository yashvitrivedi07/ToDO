
class TodoModal {
  int? toid;
  String? title, description, date, time, type;
  int? priority;

  TodoModal(
      {this.toid,
      this.title,
      this.description,
      this.date,
      this.time,
      this.priority,
      this.type});

  Map<String, dynamic> toMap() {
    return {
      'id': toid,
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
        toid: map['toid'],
        title: map['title'],
        description: map['description'],
        date: map['date'],
        time: map['time'],
        priority: map['priority'],
        type: map['type']);
  }
}
