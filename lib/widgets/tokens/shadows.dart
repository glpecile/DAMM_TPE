import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';

class SerManosShadows {
  static List<BoxShadow> shadow_1 = [
    const BoxShadow(
      color: SerManosColors.neutral_100_10,
      blurRadius: 3,
      spreadRadius: 0,
      offset: Offset(0, 1),
    ),
    const BoxShadow(
      color: SerManosColors.neutral_100_30,
      blurRadius: 2,
      spreadRadius: 0,
      offset: Offset(0, 1),
    )
  ];

  static List<BoxShadow> shadow_2 = [
    const BoxShadow(
      color: SerManosColors.neutral_100_10,
      blurRadius: 2,
      spreadRadius: 0,
      offset: Offset(0, 1),
    ),
    const BoxShadow(
      color: SerManosColors.neutral_100_30,
      blurRadius: 6,
      spreadRadius: 0,
      offset: Offset(0, 2),
    )
  ];

  static List<BoxShadow> shadow_3 = [
    const BoxShadow(
      color: SerManosColors.neutral_100_10,
      blurRadius: 4,
      spreadRadius: 0,
      offset: Offset(0, 4),
    ),
    const BoxShadow(
      color: SerManosColors.neutral_100_30,
      blurRadius: 12,
      spreadRadius: 6,
      offset: Offset(0, 8),
    )
  ];
}
