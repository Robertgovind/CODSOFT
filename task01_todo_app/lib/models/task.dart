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

  List<Task> taskList = [
    Task(
        taskTitle: "Studying",
        date: '2023/11/25',
        description: "Advanced Electronics"),
    Task(
        taskTitle: 'Watchig a movie',
        date: '2023/11/28',
        description: 'Any new si-fi movie'),
    Task(
        taskTitle: 'Playing Football',
        date: '2023/11/30',
        description: 'At evening need to play football'),
  ];
}
