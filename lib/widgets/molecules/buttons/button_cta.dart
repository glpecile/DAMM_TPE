import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';

class ButtonCTA extends StatelessWidget {
  final Color btnColor;
  final String text;
  final VoidCallback? onPressed;
  final Color foregroundColor;
  final Color? backgroundColor;

  const ButtonCTA({
    super.key,
    required this.btnColor,
    required this.text,
    required this.onPressed,
    required this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4), // <-- Radius
    ),
          ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Text(
          text,
          style: SerManosTypography.button(color: btnColor)
        ),
      ),
    );
  }

}
