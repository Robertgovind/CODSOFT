import 'package:flutter/material.dart';
import 'package:task04_quize/quiz_screen.dart';
import 'package:task04_quize/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quize',
      home: QuizScreen(),
    );
  }
}
