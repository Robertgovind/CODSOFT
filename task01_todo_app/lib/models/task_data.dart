import 'package:flutter/material.dart';
import 'package:task01_todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskList = [];

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
