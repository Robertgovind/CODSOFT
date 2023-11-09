import 'package:flutter/material.dart';

class QuestionsContainer extends StatelessWidget {
  const QuestionsContainer({
    super.key,
    required this.question,
  });
  final question;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 80,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.purple),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        question,
        style: const TextStyle(
            fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
