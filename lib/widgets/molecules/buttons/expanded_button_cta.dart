import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:flutter/material.dart';

class ExpandedButtonCTA extends ButtonCTA {
  final Color backgroundColor;

  const ExpandedButtonCTA(
      {super.key,
      required super.btnColor,
      required super.text,
      required super.onPressed,
      required super.foregroundColor,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: ButtonCTA(
          btnColor: btnColor,
          text: text,
          onPressed: onPressed,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        ),
      ),
    ]);
  }
}
