import 'package:SerManos/providers/user_volunteering_controller.dart';
import 'package:SerManos/widgets/cells/cards/card_actual.dart';
import 'package:SerManos/widgets/molecules/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActiveVolunteering extends ConsumerWidget {
  const ActiveVolunteering({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userVolunteeringController =
        ref.watch(userVolunteeringControllerProvider);

    return userVolunteeringController.when(
        data: (maybeVolunteering) {
          if (maybeVolunteering != null) {
            return CardVolunteersActual(volunteering: maybeVolunteering);
          } else {
            return const SizedBox.shrink();
          }
        },
        error: (error, stackTrace) => const SizedBox.shrink(),
        loading: () => const LoadingIndicator());
  }
}
