import 'package:SerManos/helpers/gender.dart';
import 'package:flutter/material.dart';
import 'package:SerManos/widgets/cells/forms/radio_button.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import '../../tokens/colors.dart';

class CardInput extends StatelessWidget {
  final String title;

  final Function(Gender?) onPressed;

  const CardInput({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Column(
          children: [
            buildTopContainer(),
            buildBottomContainer(),
          ],
        ),
      ),
    );
  }

  Widget buildTopContainer() {
    return Container(
      width: double.infinity,
      color: SerManosColors.secondary_25,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: const SerManosTypography.subtitle_01(),
      ),
    );
  }

  Widget buildBottomContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: SerManosColors.neutral_10,
      child: GenderRadioForm(
        onPressed: onPressed,
      ),
    );
  }
}
