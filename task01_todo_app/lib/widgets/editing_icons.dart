import 'package:flutter/material.dart';

class EditingIcons extends StatelessWidget {
  const EditingIcons({
    super.key,
    required,
    this.icon,
  });
  final icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 28,
    );
  }
}
