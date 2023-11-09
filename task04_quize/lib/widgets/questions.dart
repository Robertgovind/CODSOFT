import 'package:flutter/material.dart';

class QuestionsContainer extends StatefulWidget {
  const QuestionsContainer({
    super.key,
    required this.question,
    required this.number,
  });
  final question;
  final number;

  @override
  State<QuestionsContainer> createState() => _QuestionsContainerState();
}

class _QuestionsContainerState extends State<QuestionsContainer> {
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
      child: Column(
        children: [
          CircleAvatar(
            child: Text(widget.number.toString()),
          ),
          Text(
            widget.question,
            style: const TextStyle(
                fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
