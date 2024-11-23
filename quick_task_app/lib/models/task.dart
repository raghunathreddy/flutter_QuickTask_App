class Task {
  String taskId;
  String taskTitle;
  bool taskStatus; // True = completed, False = not completed

  Task(
      {required this.taskId, required this.taskTitle, this.taskStatus = false});

  @override
  String toString() {
    return 'Task{taskId: $taskId, taskTitle: $taskTitle, taskStatus: $taskStatus}';
  }
}
