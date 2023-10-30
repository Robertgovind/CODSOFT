class Task {
  String taskTitle;
  String date;
  String description;
  bool isCompleted;

  Task(
      {required this.taskTitle,
      required this.date,
      required this.description,
      this.isCompleted = false});

  void isDone() {
    isCompleted = !isCompleted;
  }
}
