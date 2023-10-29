import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'package:todo/widgets/model.dart';

class ToDoList extends StatelessWidget {
  const ToDoList(
      {super.key,
      required this.todo_var,
      required this.whentodoChanged,
      required this.whentodoDeleted});
  final ToDo todo_var;

  final whentodoChanged;
  final whentodoDeleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        leading: Icon(
          todo_var.isCompleted!
              ? Icons.check_box
              : Icons.check_box_outline_blank,
          color: customBlue,
        ),
        title: Text(
          todo_var.workText!,
          style: TextStyle(
              color: customBlack,
              fontSize: 17,
              decoration: todo_var.isCompleted!
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              fontWeight: FontWeight.w500),
        ),
        trailing: Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: customRed,
          ),
          height: 40,
          width: 40,
          child: IconButton(
            icon: Icon(
              Icons.delete,
            ),
            iconSize: 25,
            color: BGcolor,
            onPressed: () {
              whentodoDeleted(todo_var.id);
            },
          ),
        ),
        onTap: () {
          whentodoChanged(todo_var);
        },
      ),
    );
  }
}
