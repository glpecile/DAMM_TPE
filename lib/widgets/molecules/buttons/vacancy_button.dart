import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';

class VacancyButton extends StatelessWidget {
  final int currentVacant;

  const VacancyButton({super.key, required this.currentVacant});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: currentVacant == 0 ?  SerManosColors.neutral_25 : SerManosColors.secondary_25,
        ),
        child: Row(
          children: [
            const Text(
              "Vacantes: ",
              style:
                  SerManosTypography.body_02(color: SerManosColors.neutral_100),
            ),
            Icon(
              SerManosIcons.person,
              color: currentVacant == 0 ? SerManosColors.secondary_80 : SerManosColors.secondary_200,
              size: 20,
            ),
            Text(currentVacant.toString(),
                style: SerManosTypography.subtitle_01(
                    color: currentVacant == 0 ? SerManosColors.secondary_80 : SerManosColors.secondary_200)),
          ],
        ));
  }
}
