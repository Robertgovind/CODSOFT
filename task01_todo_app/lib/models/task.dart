class Task {
  String? taskTitle;
  String? date;
  String? description;
  bool isCompleted;

  Task({this.taskTitle, this.date, this.description, this.isCompleted = false});

  List<Task> taskList() {
    return [
      Task(
          taskTitle: "Studying",
          date: '2023/11/25',
          description: "Advanced Electronics",
          isCompleted: true),
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
}
