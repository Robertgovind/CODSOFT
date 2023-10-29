import 'package:flutter/material.dart';
import 'package:task01_todo_app/home.dart';
import 'package:task01_todo_app/pages/landing_page.dart';
import 'package:task01_todo_app/pages/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDo app",
      home: TodoPage(),
    );
  }
}
