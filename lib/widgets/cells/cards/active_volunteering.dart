import 'package:SerManos/providers/user_volunteering_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:SerManos/widgets/cells/cards/card_actual.dart';
import 'package:flutter/material.dart';

class ActiveVolunteering extends ConsumerWidget {
  const ActiveVolunteering({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userVolunteeringController =
        ref.watch(userVolunteeringControllerProvider);

    // TODO: AGREGARLE EL TEXTO ACTIVIDAD
    return userVolunteeringController.when(
        data: (maybeVolunteering) {
          if (maybeVolunteering != null &&
              maybeVolunteering.isVolunteeringApproved!) {
            return CardVolunteersActual(title: maybeVolunteering.title);
          } else {
            return const SizedBox.shrink();
          }
        },
        error: (error, stackTrace) => SizedBox.shrink(),
        loading: () => SizedBox.shrink());
  }
}
