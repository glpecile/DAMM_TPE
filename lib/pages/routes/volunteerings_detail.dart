import 'package:SerManos/providers/user_volunteering_controller.dart';
import 'package:SerManos/providers/volunteering_by_id_provider.dart';
import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/molecules/buttons/vacancy_button.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/molecules/loading_indicator.dart';
import '../../widgets/tokens/colors.dart';
import '../../widgets/tokens/typography.dart';

class CardDetail extends ConsumerWidget {
  static String name = 'detail';
  static String path = '$name/:volunteeringId';
  final String id;

  const CardDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var volunteeringByIdController =
        ref.watch(getVolunteeringByIdControllerProvider(volunteeringId: id));

    return volunteeringByIdController.when(
        data: (volunteering) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async => ref.refresh(
                  getVolunteeringByIdControllerProvider(volunteeringId: id)
                      .future),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ColoredBox(
                      color: SerManosColors.neutral_100,
                      child: SafeArea(
                        top: true,
                        bottom: false,
                        left: false,
                        right: false,
                        child: Stack(
                          children: [
                            Image.network(
                              volunteering.imageUrl,
                              height: 243,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: SerManosColors.neutral_100,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      SerManosColors.neutral_100,
                                      Colors.transparent,
                                    ],
                                    stops: [0.0, 0.3555],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: IconButton(
                                padding: const EdgeInsets.all(16),
                                onPressed: () => context.pop(),
                                icon: const Icon(
                                  SerManosIcons.back,
                                  color: SerManosColors.neutral_0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SerManosGrid(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            volunteering.type,
                            style: const SerManosTypography.overline(
                                color: SerManosColors.neutral_75),
                          ),
                          Text(
                            volunteering.title,
                            style: const SerManosTypography.headline_01(),
                          ),
                          const SizedBox(height: 16),
                          Text(volunteering.goal,
                              style: const SerManosTypography.body_01(
                                  color: SerManosColors.secondary_200)),
                          const SizedBox(height: 24),
                          const Text("Sobre la actividad",
                              style: SerManosTypography.headline_02()),
                          const SizedBox(height: 8),
                          Text(
                            volunteering.description,
                            style: const SerManosTypography.body_01(
                                color: SerManosColors.neutral_100),
                          ),
                          const SizedBox(height: 24),
                          const Text("Participar del voluntariado",
                              style: SerManosTypography.headline_02()),
                          const SizedBox(height: 8),
                          const Text(
                            "Requisitos",
                            style: SerManosTypography.subtitle_01(),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Disponibilidad",
                            style: SerManosTypography.subtitle_01(),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              VacancyButton(
                                  currentVacant: volunteering.availableVacant),
                            ],
                          ),
                          const SizedBox(height: 24),
                          PostulateButton(volunteeringId: volunteering.id),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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

class PostulateButton extends ConsumerWidget {
  final String volunteeringId;

  const PostulateButton({super.key, required this.volunteeringId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userVolunteeringController =
        ref.watch(userVolunteeringControllerProvider);
    return userVolunteeringController.when(
      data: (volunteering) {
        if (volunteering == null) {
          // Agregar caso donde hay que completar perfil
          // Postularme
          return Container();
        }
        if (volunteeringId == volunteering.id) {
          if (volunteering.isVolunteeringApproved!) {
            // Agregar caso donde ya esta postulado y aprobado
            // Estas participando
            // La organización confirmó que ya estas participando de este voluntariado
            return Container();
          } else {
            // Estas participando
            // La organización confirmó que ya estas participando de este voluntariado
            return Container();
          }
        }
        // Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.
        // Abandonar voluntariado actual
        return Container();
      },
      error: (Object error, StackTrace stackTrace) {
        return Text(error.toString());
      },
      loading: () => const LoadingIndicator(),
    );
  }
}
