import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task01_todo_app/models/task_data.dart';

import 'package:task01_todo_app/pages/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return TaskData();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ToDo app",
        home: const TodoPage(),
        theme: ThemeData(brightness: Brightness.light),
      ),
    );
  }
}
