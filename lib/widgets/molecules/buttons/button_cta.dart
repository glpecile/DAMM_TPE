import 'package:flutter/material.dart';

class ButtonCTA extends StatelessWidget {
  final Color btnColor;
  final String text;
  final VoidCallback onPressed;
  final Color foregroundColor;
  final Color backgroundColor;

  const ButtonCTA({
    super.key,
    required this.btnColor,
    required this.text,
    required this.onPressed,
    required this.foregroundColor,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 12)),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: btnColor,
        ),
      ),
    );
  }
}
