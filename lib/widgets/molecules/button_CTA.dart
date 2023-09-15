import 'package:flutter/material.dart';

class ButtonCTA extends StatelessWidget {

  final Color color;
  final String text;
  final VoidCallback onPress;

  const ButtonCTA({super.key, required this.color, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPress;
      },
      child: Text(text,
        style: TextStyle(
            color: color,
        ),),
    );
  }
}
