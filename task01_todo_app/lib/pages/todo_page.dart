import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task01_todo_app/widgets/add_task_container.dart';
import 'package:task01_todo_app/widgets/task_card.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

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
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      "Tasks",
                      style: GoogleFonts.raleway(
                          fontSize: 23, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const TaskCard()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
