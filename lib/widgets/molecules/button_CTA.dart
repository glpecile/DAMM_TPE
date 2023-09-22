import 'package:flutter/material.dart';

class ButtonCTA extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const ButtonCTA({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12)),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
