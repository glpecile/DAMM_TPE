import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/shadows.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';

class CardVolunteers extends StatelessWidget {
  const CardVolunteers({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 328,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: SerManosColors.neutral_0,
            boxShadow: SerManosShadows.shadow_2,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/voluntario.jpg',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 8, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("ACCIÓN SOCIAL",
                              style: SerManosTypography.overline()),
                          const Text(
                            "Un Techo para mi País",
                            style: SerManosTypography.subtitle_01(
                                color: SerManosColors.neutral_100),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          VacantesIcons(),
                        ],
                      ),
                      gIcons()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class gIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Icon(
          SerManosIcons.likeOutlined,
          color: SerManosColors.primary_100,
          size: 24,
        ),
        SizedBox(
          width: 16,
        ),
        Icon(
          SerManosIcons.location,
          color: SerManosColors.primary_100,
          size: 24,
        ),
      ],
    );
  }
}

class Vacantes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: SerManosColors.secondary_25,
        ),
        child: const Row(
          children: [
            Text(
              "Vacantes: ",
              style: SerManosTypography.body_02(color: SerManosColors.neutral_100),
            ),
            Icon(
              Icons.person_rounded,
              color: SerManosColors.secondary_200,
              size: 20,
            ),
            Text("10",
                style: SerManosTypography.subtitle_01(
                    color: SerManosColors.secondary_200)),
          ],
        ));
  }
}

class VacantesIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Vacantes(),
        ]);
  }
}
