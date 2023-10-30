import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task01_todo_app/constatns.dart';
import 'package:task01_todo_app/widgets/buttom_sheet.dart';

class AddTaskTextField extends StatefulWidget {
  const AddTaskTextField({
    super.key,
  });

  @override
  State<AddTaskTextField> createState() => _AddTaskTextFieldState();
}

class _AddTaskTextFieldState extends State<AddTaskTextField> {
  String addTaskContent = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              isDismissible: true,
              context: (context),
              builder: (context) {
                return BottomSheetContent();
              });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kcardBGColor),
        ),
        child: Text(
          "Add new task",
          style: GoogleFonts.raleway(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
