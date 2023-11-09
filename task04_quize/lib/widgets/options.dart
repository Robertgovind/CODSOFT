import 'package:flutter/material.dart';

class OptionsContainer extends StatefulWidget {
  const OptionsContainer({
    super.key,
    required this.lead,
    required this.optionText,
  });
  final lead;
  final optionText;

  @override
  State<OptionsContainer> createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
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
                  widget.lead,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.optionText,
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