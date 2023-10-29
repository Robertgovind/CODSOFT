import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task01_todo_app/utilities/constatns.dart';
import 'package:task01_todo_app/widgets/add_task_container.dart';

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
              AddTaskTextField(),
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
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kcardBGColor,
                          border:
                              Border.all(width: 2, color: kcustomBorderColor),
                          boxShadow: const [
                            BoxShadow(color: Colors.black, blurRadius: 4)
                          ]),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit_document),
                              SizedBox(
                                width: 18,
                              ),
                              Icon(Icons.delete),
                            ],
                          )
                        ],
                      ),
                    )
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
