import 'package:SerManos/widgets/tokens/typography.dart';
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
    return ElevatedButton(
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          padding: btnSize(size),
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4), // <-- Radius
    )
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: btnColor,
              ),
            if (icon != null) const SizedBox(width: 8),
            Text(text, style: SerManosTypography.button(color: btnColor)),
          ],
        ));
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
