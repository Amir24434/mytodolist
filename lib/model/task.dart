class Task {
  String task;
  String taskCreated;

  Task({required this.task, required this.taskCreated});

  // Convert Task object to a map
  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'taskCreated': taskCreated,
    };
  }

  // Create a Task object from a map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      task: map['task'],
      taskCreated: map['taskCreated'],
    );
  }
}
