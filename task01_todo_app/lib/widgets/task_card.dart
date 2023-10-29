import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task01_todo_app/constatns.dart';
import 'package:task01_todo_app/widgets/editing_icons.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.date,
    this.description,
    this.isCompleted,
  });
  final title;
  final date;
  final description;
  final isCompleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
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
                title,
                style: GoogleFonts.raleway(
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                date,
                style: GoogleFonts.raleway(
                    fontSize: 17, fontWeight: FontWeight.w300),
              ),
              Text(
                description,
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
              EditingIcons(
                icon: isCompleted
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: isCompleted
                    ? const Color.fromARGB(255, 7, 242, 15)
                    : Colors.black,
              ),
              EditingIcons(
                icon: Icons.edit_document,
              ),
              EditingIcons(
                icon: Icons.delete,
              ),
            ],
          )
        ],
      ),
    );
  }
}
