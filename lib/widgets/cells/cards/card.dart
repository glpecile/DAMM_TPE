import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/molecules/buttons/icon_btn.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/shadows.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/favorites_provider.dart';

class CardVolunteers extends ConsumerWidget {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  bool isFavorite = false;
  final int currentVacant;
  final void Function()? onPressedFav;
  final void Function()? onPressedLocation;

  CardVolunteers({super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.currentVacant,
    required this.onPressedFav,
    required this.onPressedLocation,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FavoritesController favoritesMethods = ref.read(favoritesControllerProvider.notifier);


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
                  height: 138,
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
                          VacancyIcons(currentVacant: currentVacant, isFavorite: isFavorite, onPressedFav: () => favoritesMethods.toggleFavorite(id), onPressedLocation: onPressedLocation),
                        ],
                      ),
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
  bool isFavorite;
  final void Function()? onPressedFav;
  final void Function()? onPressedLocation;

  VacancyIcons({super.key, required this.currentVacant, required this.isFavorite, required this.onPressedFav, required this.onPressedLocation});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Vacancy(currentVacant: '$currentVacant'),
          const SizedBox(
            width: 95,
          ),
          gIcons(isFavorite: isFavorite, onPressedFavorite: onPressedFav, onPressedLocation: onPressedLocation)
        ]);
  }
}
