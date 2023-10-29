import 'package:flutter/material.dart';

class EditingIcons extends StatelessWidget {
  const EditingIcons({
    super.key,
    required,
    this.icon,
    this.color = Colors.black,
  });
  final icon;
  final color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 28,
      color: color,
    );
  }
}
