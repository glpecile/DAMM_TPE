import 'package:flutter/material.dart';

class SerManosIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function() onPressed;
  final double size;

  const SerManosIconButton(
      {super.key,
      required this.icon,
      required this.color,
      required this.onPressed,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ));
  }
}
