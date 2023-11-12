import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, this.score});
  final score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            '$score/50',
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
