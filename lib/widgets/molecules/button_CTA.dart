import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';

class ButtonCTA extends StatelessWidget {
  final Color btnColor;
  final String text;
  final VoidCallback onPressed;
  final Color foregroundColor;


  const ButtonCTA({
    super.key,
    required this.btnColor,
    required this.text,
    required this.onPressed,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
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
