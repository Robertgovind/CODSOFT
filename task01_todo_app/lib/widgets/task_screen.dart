import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task01_todo_app/models/task_data.dart';

import 'package:task01_todo_app/widgets/task_card.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({
    super.key,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: Provider.of<TaskData>(context).taskList.length,
        itemBuilder: (context, index) {
          return TaskCard(
            taskData: Provider.of<TaskData>(context).taskList[index],
          );
        },
      ),
    );
  }
}
