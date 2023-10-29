import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task01_todo_app/models/task.dart';
import 'package:task01_todo_app/widgets/add_task_container.dart';
import 'package:task01_todo_app/widgets/task_screen.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  var task = Task().taskList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TODO App",
                style: GoogleFonts.raleway(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const AddTaskTextField(),
              TaskScreen(
                task_list: task,
              )
            ],
          ),
        ),
      ),
    );
  }
}
