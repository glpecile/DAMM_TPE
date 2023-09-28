import 'package:flutter/material.dart';

abstract interface class SerManosColors {
  /// Neutral colors
  /// Estos colores se usan para complementar los colores
  /// secundarios en backgrounds, textos, separadores, etc.

  // #FFFFFF
  static const Color  neutral_0 = Color(0xffffffff);

  // #FAFAFA
  static const Color neutral_10 = Color(0xfffafafa);

  // #E0E0E0
  static const Color neutral_25 = Color(0xffe0e0e0);

  // #9E9E9E
  static const Color neutral_50 = Color(0xff9e9e9e);

  // #666666
  static const Color neutral_75 = Color(0xff666666);

  // #191919
  static const Color neutral_100 = Color(0xff191919);

  // #0x26000000
  static const Color neutral_100_10 = Color(0x26000000);

  // #0x4D000000
  static const Color neutral_100_30 = Color(0x4D000000);

  /// Primary colors
  /// La paleta de colores primarios se usan en todos los elementos
  /// interactivos como CTAs, links, estados activos, etc.

  // #14903F
  static const Color primary_100 = Color(0xff14903f);

  // #E7F4EC
  static const Color primary_10 = Color(0xffe7f4ec);

  // #F3F9F5
  static const Color primary_5 = Color(0xfff3f9f5);

  /// Secondary colors
  /// La paleta de colores secundarios se usan en conjunto con los
  /// primarios para indicar al usuario una atención secundaria.

  // #E1ECF5
  static const Color secondary_10 = Color(0xffe1ecf5);

  // #CAE5FB
  static const Color secondary_25 = Color(0xffcae5fb);

  // #90CAF9
  static const Color secondary_50 = Color(0xff90caf9);

  // #6CB6F3
  static const Color secondary_80 = Color(0xff6cb6f3);

  // #4AA9F5
  static const Color secondary_90 = Color(0xff4aa9f5);

  // #2C98F0
  static const Color secondary_100 = Color(0xff2c98f0);

  // #0D47A1
  static const Color secondary_200 = Color(0xff0d47a1);

  /// Error colors
  /// El color de error dan sensación de negatividad. Generalmente usado en estados de error.

  // #B3261E
  static const Color error_100 = Color(0xffb3261e);
}
