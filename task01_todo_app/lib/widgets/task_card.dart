import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task01_todo_app/constatns.dart';
import 'package:task01_todo_app/widgets/editing_icons.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                "Coding",
                style: GoogleFonts.raleway(
                    fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Text(
                "2023/10/30",
                style: GoogleFonts.raleway(
                    fontSize: 17, fontWeight: FontWeight.w300),
              ),
              Text(
                'Complete the task given in internship',
                style: GoogleFonts.raleway(
                    fontSize: 21, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EditingIcons(
                icon: Icons.check_box,
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
