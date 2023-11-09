import 'package:flutter/material.dart';

class OptionsContainer extends StatelessWidget {
  const OptionsContainer({
    super.key,
    required this.lead,
    required this.optionText,
  });
  final lead;
  final optionText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.purple),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                child: Text(
                  lead,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  optionText,
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}