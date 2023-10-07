import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color foregroundColor;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;

  const FloatingButton({
    super.key,
    required this.onPressed,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: foregroundColor,
      backgroundColor: backgroundColor,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onPressed: () {  },
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
