import 'dart:math';

import 'package:SerManos/helpers/maps.dart';
import 'package:SerManos/providers/favorites_provider.dart';
import 'package:SerManos/providers/volunteering_provider.dart';
import 'package:SerManos/widgets/cells/cards/active_volunteering.dart';
import 'package:SerManos/widgets/cells/cards/card.dart';
import 'package:SerManos/widgets/cells/cards/card_actual.dart';
import 'package:SerManos/widgets/molecules/inputs/search_input.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/volunteering.dart';
import '../../providers/auth_provider.dart';

class Volunteerings extends ConsumerWidget {
  const Volunteerings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var volunteeringController = ref.watch(volunteeringControllerProvider);

    return volunteeringController.when(
        data: (volunteerings) {
          List<String> favorites =
              ref.watch(favoritesControllerProvider).value!;
          FavoritesController favoritesMethods =
              ref.read(favoritesControllerProvider.notifier);


          for (Volunteering volunteering in volunteerings) {
            volunteering.isFavorite = favorites.contains(volunteering.id);
          }

          // TODO: AGREGAR LOGICA CUANDO ESTO ESTA VACIO
          return Scaffold(
            backgroundColor: SerManosColors.secondary_10,
            body: RefreshIndicator(
              onRefresh: () async =>
                  ref.refresh(volunteeringControllerProvider.future),
              child: Column(children: [
                SearchInput(
                    onChanged: (value) => ref
                        .read(volunteeringControllerProvider.notifier)
                        .search(value, null)),
                const ActiveVolunteering(),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 16, bottom: 24, top: 24, right: 16),
                    child: Text(
                      'Voluntariados',
                      style: SerManosTypography.headline_01(),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: volunteerings.length,
                    itemBuilder: (context, index) {
                      var volunteering = volunteerings[index];
                      log(volunteering.location.latitude);
                      log(volunteering.location.latitude);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CardVolunteers(
                          id: volunteering.id,
                          imageUrl: volunteering.imageUrl,
                          title: volunteering.title,
                          description: volunteering.description,
                          isFavorite: volunteering.isFavorite,
                          currentVacant: volunteering.currentVacant,
                          onPressedFav: () => favoritesMethods
                              .toggleFavorite(volunteerings[index].id),
                          onPressedLocation: () => openOnGoogleMaps(
                              volunteering.location.latitude,
                              volunteering.location.longitude),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                )
              ]),
            ),
          );
        },
        error: (error, stackTrace) => const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  color: SerManosColors.secondary_10,
                ),
              ),
            ),
        loading: () => const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  color: SerManosColors.secondary_10,
                ),
              ),
            ));
    /*
    return Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: SerManosColors.secondary_10,
      body: RefreshIndicator(
        onRefresh: () async =>
            await volunteeringsMethods.getVolunteerings(null, null),
        child: Column(children: [
          // TODO: add search functionality
          const SearchInput(),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 16, bottom: 24, top: 24, right: 16),
              child: Text(
                'Voluntariados',
                style: SerManosTypography.headline_01(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: volunteerings.length,
              itemBuilder: (context, index) {
                var volunteering = volunteerings[index];
                log(volunteering.location.latitude);
                log(volunteering.location.latitude);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CardVolunteers(
                    imageUrl: volunteering.imageUrl,
                    title: volunteering.title,
                    description: volunteering.description,
                    isFavorite: volunteering.isFavorite,
                    currentVacant: volunteering.currentVacant,
                    onPressedFav: () => favoritesMethods
                        .toggleFavorite(volunteerings[index].id),
                    onPressedLocation: () => openOnGoogleMaps(
                        volunteering.location.latitude,
                        volunteering.location.longitude),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 24,
          )
        ]),
      ),
    );
     */
  }
}
