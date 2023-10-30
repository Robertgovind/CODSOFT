import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task01_todo_app/constatns.dart';
import 'package:task01_todo_app/models/task_data.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({
    super.key,
  });

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final controller = TextEditingController();

  String taskTitle = '';

  String taskDate = '';

  String taskDescription = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kcardBGColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 2, color: kcustomBorderColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide:
                          BorderSide(color: kcustomBorderColor, width: 3),
                    ),
                    hintText: 'Add task title',
                    hintStyle: GoogleFonts.raleway(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onChanged: (value) {
                    taskTitle = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kcardBGColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 2, color: kcustomBorderColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide:
                          BorderSide(color: kcustomBorderColor, width: 3),
                    ),
                    hintText: 'Add task date',
                    hintStyle: GoogleFonts.raleway(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onChanged: (value) {
                    taskDate = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kcardBGColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 2, color: kcustomBorderColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide:
                          BorderSide(color: kcustomBorderColor, width: 3),
                    ),
                    hintText: 'Add task description',
                    hintStyle: GoogleFonts.raleway(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onChanged: (value) {
                    taskDescription = value;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.lightBlueAccent),
                  ),
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .addNewTask(taskTitle, taskDate, taskDescription);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 84, 104, 113)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
