import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task01_todo_app/constatns.dart';
import 'package:task01_todo_app/models/task.dart';
import 'package:task01_todo_app/models/task_data.dart';
import 'package:task01_todo_app/widgets/editing_icons.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.taskData,
  });
  final Task taskData;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  void tickTask() {
    setState(() {
      widget.taskData.isDone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kcardBGColor,
          border: Border.all(width: 2, color: kcustomBorderColor),
          boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 4)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.taskData.taskTitle,
                style: GoogleFonts.raleway(
                  decoration: widget.taskData.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.taskData.date,
                style: GoogleFonts.raleway(
                    fontSize: 17, fontWeight: FontWeight.w300),
              ),
              Text(
                widget.taskData.description,
                style: GoogleFonts.raleway(
                    fontSize: 21, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  tickTask();
                },
                child: EditingIcons(
                  icon: widget.taskData.isCompleted
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: widget.taskData.isCompleted
                      ? const Color.fromARGB(255, 7, 242, 15)
                      : Colors.black,
                ),
              ),
              const EditingIcons(
                icon: Icons.edit_document,
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<TaskData>(context, listen: false)
                      .deleteTask(widget.taskData);
                },
                child: const EditingIcons(
                  icon: Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
