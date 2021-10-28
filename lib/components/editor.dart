import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String textLabel;
  final String textHint;
  final TextInputType keyboardType;
  final IconData? icon;

  const Editor({
    Key? key,
    required this.controller,
    required this.textLabel,
    required this.textHint,
    required this.keyboardType,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: textLabel,
            hintText: textHint,
            icon: icon != null ? Icon(icon, size: 50.0) : null),
        style: const TextStyle(fontSize: 24.0),
        keyboardType: keyboardType,
        controller: controller,
      ),
    );
  }
}
