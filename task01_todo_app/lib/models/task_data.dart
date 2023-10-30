import 'package:flutter/material.dart';
import 'package:task01_todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskList = [
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

  void addNewTask(String taskTitle, String taskDate, String taskDescription) {
    final newTask = Task(
        taskTitle: taskTitle, date: taskDate, description: taskDescription);
    taskList.add(newTask);
    notifyListeners();
  }

  void deleteTask(Task delete) {
    taskList.remove(delete);
    notifyListeners();
  }
}
