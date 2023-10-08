import 'package:flutter/material.dart';

class ShortButton extends StatelessWidget {
  final Color btnColor;
  final String text;
  final VoidCallback onPressed;
  final Color foregroundColor;
  final Color backgroundColor;
  final IconData? icon;
  final Size size;

  const ShortButton({
    super.key,
    required this.btnColor,
    required this.text,
    required this.onPressed,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.size,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          padding: btnSize(size)),
      onPressed: onPressed,
      label: Text(
        text,
        style: TextStyle(
          color: btnColor,
        ),
      ),
      icon: Icon(
        icon,
      ),
    );
  }

  EdgeInsets btnSize(Size size) {
    return (size == Size.small)
        ? const EdgeInsets.symmetric(vertical: 8, horizontal: 12)
        : const EdgeInsets.all(12);
  }
}

enum Size {
  small,
  medium;
}
