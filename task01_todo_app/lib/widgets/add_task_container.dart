import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task01_todo_app/constatns.dart';

class AddTaskTextField extends StatelessWidget {
  const AddTaskTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: kcustomBorderColor, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        hintText: 'Add a new task',
        hintStyle: GoogleFonts.raleway(
          fontSize: 17,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: kcustomBorderColor, width: 3),
        ),
        filled: true,
        fillColor: kcardBGColor,
      ),
    );
  }
}
