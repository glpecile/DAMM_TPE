import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';

class SerManosTypography extends TextStyle {
  const SerManosTypography({
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
    String fontFamily = 'Roboto',
  }) : super(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: fontFamily,
        );

  static const _headline_01 = 24.0;

  const SerManosTypography.headline_01({
    Color color = SerManosColors.neutral_100,
  }) : this(
          color: color,
          fontSize: _headline_01,
          fontWeight: FontWeight.w400,
        );

  static const _headline_02 = 20.0;

  const SerManosTypography.headline_02(
      {Color color = SerManosColors.neutral_100})
      : this(
          color: color,
          fontSize: _headline_02,
          fontWeight: FontWeight.w500,
        );

  static const _subtitle_01 = 16.0;

  const SerManosTypography.subtitle_01({
    Color color = SerManosColors.neutral_100,
  }) : this(
          color: color,
          fontSize: _subtitle_01,
          fontWeight: FontWeight.w400,
        );

  static const _body_01 = 14.0;

  const SerManosTypography.body_01({
    Color color = SerManosColors.neutral_75,
  }) : this(
          color: color,
          fontSize: _body_01,
          fontWeight: FontWeight.w400,
        );

  const SerManosTypography.button({
    Color color = SerManosColors.primary_100,
  }) : this(
          color: color,
          fontSize: _body_01,
          fontWeight: FontWeight.w500,
        );

  static const _body_02 = 12.0;

  const SerManosTypography.body_02({
    Color color = SerManosColors.neutral_75,
  }) : this(
          color: color,
          fontSize: _body_02,
          fontWeight: FontWeight.w400,
        );

  const SerManosTypography.caption({
    required Color color,
  }) : this(
          color: color,
          fontSize: _body_02,
          fontWeight: FontWeight.w500,
        );

  static const _overline = 10.0;

  const SerManosTypography.overline({
    Color color = SerManosColors.neutral_75,
  }) : this(
          color: color,
          fontSize: _overline,
          fontWeight: FontWeight.w400,
        );
}
