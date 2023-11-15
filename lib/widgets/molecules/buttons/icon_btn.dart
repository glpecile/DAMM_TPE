
import 'package:flutter/material.dart';

class SerManosIconButton extends StatelessWidget {

  SerManosIconButton({super.key, required this.icon, required this.color, required this.onPressed, required this.size});

  final IconData icon;
  final Color color;
  void Function()? onPressed;
  bool toggle = false;
  final double size;

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