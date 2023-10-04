import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShortButton extends StatelessWidget {
  final Color btnColor;
  final String text;
  final VoidCallback onPressed;
  final Color foregroundColor;
  final Color backgroundColor;
  final Icon? icon;

  const ShortButton({
  super.key,
  required this.btnColor,
  required this.text,
  required this.onPressed,
  required this.foregroundColor,
  required this.backgroundColor,
  // required this
  // this.icon,
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

// enum Size(
//   small,
//   medium
// )