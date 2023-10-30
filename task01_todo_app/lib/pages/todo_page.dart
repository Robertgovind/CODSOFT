import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task01_todo_app/models/task_data.dart';
import 'package:task01_todo_app/widgets/add_task_buttom.dart';
import 'package:task01_todo_app/widgets/task_screen.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "${Provider.of<TaskData>(context).taskList.length} Tasks",
                  style: GoogleFonts.raleway(
                      fontSize: 23, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              const TaskScreen()
            ],
          ),
        ),
      ),
    );
  }
}
