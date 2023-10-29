import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task01_todo_app/models/task.dart';
import 'package:task01_todo_app/widgets/task_card.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({
    super.key,
    required this.task_list,
  });

  List<Task> task_list = [];

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              " Tasks",
              style: GoogleFonts.raleway(
                  fontSize: 23, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          for (var task in widget.task_list)
            TaskCard(
              title: task.taskTitle,
              date: task.date,
              description: task.description,
              isCompleted: task.isCompleted,
            ),
        ],
      ),
    );
  }
}
