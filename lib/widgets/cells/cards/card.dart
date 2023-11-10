import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/molecules/buttons/icon_btn.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/shadows.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';

class CardVolunteers extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  bool isFavorite = false;
  final int currentVacant;
  final void Function()? onPressedFav;
  final void Function()? onPressedLocation;

  CardVolunteers({super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.currentVacant,
    required this.onPressedFav,
    required this.onPressedLocation,});

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
                Image.network(
                  imageUrl,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
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
                          Text(
                            title,
                            style: const SerManosTypography.subtitle_01(
                                color: SerManosColors.neutral_100),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          VacancyIcons(currentVacant: currentVacant),
                        ],
                      ),
                      gIcons(isFavorite: isFavorite, onPressedFavorite: onPressedFav, onPressedLocation: onPressedLocation)
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
  bool isFavorite;
  final void Function()? onPressedFavorite;
  final void Function()? onPressedLocation;

  gIcons({super.key, required this.isFavorite, required this.onPressedFavorite, required this.onPressedLocation});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SerManosIconButton(
          icon: isFavorite ? SerManosIcons.like : SerManosIcons.likeOutlined,
          color: SerManosColors.primary_100,
          onPressed: onPressedFavorite,
          size: 24,
        ),
        const SizedBox(
          width: 16,
        ),
        SerManosIconButton(
          icon: SerManosIcons.locationSharp,
          color: SerManosColors.primary_100,
          onPressed: onPressedLocation,
          size: 24,
        ),
      ],
    );
  }
}

class Vacancy extends StatelessWidget {
  final String currentVacant;

  const Vacancy({super.key, required this.currentVacant});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: SerManosColors.secondary_25,
        ),
        child: Row(
          children: [
            const Text(
              "Vacantes: ",
              style:
              SerManosTypography.body_02(color: SerManosColors.neutral_100),
            ),
            const Icon(
              Icons.person_rounded,
              color: SerManosColors.secondary_200,
              size: 20,
            ),
            Text(currentVacant,
                style: const SerManosTypography.subtitle_01(
                    color: SerManosColors.secondary_200)),
          ],
        ));
  }
}

class VacancyIcons extends StatelessWidget {
  final int currentVacant;

  const VacancyIcons({super.key, required this.currentVacant});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Vacancy(currentVacant: '$currentVacant'),
        ]);
  }
}
