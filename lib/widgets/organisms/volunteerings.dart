import 'package:SerManos/helpers/maps.dart';
import 'package:SerManos/providers/favorites_provider.dart';
import 'package:SerManos/providers/user_volunteering_controller.dart';
import 'package:SerManos/providers/volunteering_provider.dart';
import 'package:SerManos/widgets/cells/cards/active_volunteering.dart';
import 'package:SerManos/widgets/cells/cards/card.dart';
import 'package:SerManos/widgets/cells/no_volunteers.dart';
import 'package:SerManos/widgets/molecules/inputs/search_input.dart';
import 'package:SerManos/widgets/molecules/loading_indicator.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/volunteering.dart';

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

          VolunteeringController volunteeringMethods =
              ref.read(volunteeringControllerProvider.notifier);

          for (Volunteering volunteering in volunteerings) {
            volunteering.isFavorite = favorites.contains(volunteering.id);
          }
          return Scaffold(
            backgroundColor: SerManosColors.secondary_10,
            body: RefreshIndicator(
              onRefresh: () async {
                ref.refresh(volunteeringControllerProvider.future);
                ref.refresh(userVolunteeringControllerProvider.future);
              },
              child: Column(children: [
                SearchInput(
                  onClear: () => volunteeringMethods.search('', null),
                  onChanged: (value) => volunteeringMethods.search(value, null),
                  onEnter: (value) => volunteeringMethods.search(value, null),
                ),
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
                volunteerings.isEmpty
                    ? const NoVolunteers(
                        title:
                            "No hay voluntariados vigentes para tu búsqueda.")
                    : Expanded(
                        child: ListView.builder(
                          itemCount: volunteerings.length,
                          itemBuilder: (context, index) {
                            var volunteering = volunteerings[index];
                            if (volunteerings.isEmpty) {
                              return const Center(
                                child: Text('No hay voluntariados disponibles'),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CardVolunteers(
                                id: volunteering.id,
                                imageUrl: volunteering.imageUrl,
                                title: volunteering.title,
                                description: volunteering.description,
                                isFavorite: volunteering.isFavorite,
                                currentVacant: volunteering.availableVacant -
                                    volunteering.currentVacant,
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
        loading: () => const LoadingIndicator());
  }
}
