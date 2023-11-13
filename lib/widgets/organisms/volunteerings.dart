import 'package:SerManos/providers/volunteering_provider.dart';
import 'package:SerManos/widgets/cells/cards/card.dart';
import 'package:SerManos/widgets/molecules/inputs/search_input.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Volunteerings extends ConsumerWidget {
  const Volunteerings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var volunteerings = ref.watch(volunteeringControllerProvider);

    return Scaffold(
      body: Column(children: [
        const SearchInput(),
        const SizedBox(
          height: 10,
        ),
        const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16, bottom: 24, top: 24, right: 16),
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
              return CardVolunteers(
                imageUrl: volunteerings[index].imageUrl,
                title: volunteerings[index].title,
                description: volunteerings[index].description,
                isFavorite: volunteerings[index].isFavorite,
                currentVacant: volunteerings[index].currentVacant,
                onPressedFav: () {},
                onPressedLocation: () {},
              );
            },
          ),
        ),
      ]),
    );
  }
}
