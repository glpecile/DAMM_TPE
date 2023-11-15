import 'package:SerManos/providers/volunteering_by_id_provider.dart';
import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/cells/cards/card_map_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/volunteering_provider.dart';
import '../widgets/molecules/loading_indicator.dart';
import '../widgets/tokens/colors.dart';
import '../widgets/tokens/typography.dart';

class CardDetail extends ConsumerWidget {
  static String name = 'detail';
  static String path = '$name/:volunteeringId';
  final String id;

  CardDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var volunteeringByIdController = ref.watch(getVolunteeringByIdControllerProvider(volunteeringId: id));
    return volunteeringByIdController.when(
        data: (volunteering) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async => ref.refresh(getVolunteeringByIdControllerProvider(volunteeringId: id).future),
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
                                  stops: [
                                    0.0, 0.3555],
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
                              icon: const Icon(SerManosIcons.back,
                                color: SerManosColors.neutral_0,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "ACCIÓN SOCIAL",
                          style: SerManosTypography.overline(
                              color: SerManosColors.neutral_75),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          volunteering.title,
                          style: const SerManosTypography.headline_01(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                            volunteering.goal,
                            style: const SerManosTypography.body_01(
                                color: SerManosColors.secondary_200)
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                            "Sobre la actividad",
                            style: SerManosTypography.headline_02()
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          volunteering.description,
                          style: const SerManosTypography.body_01(
                              color: SerManosColors.neutral_100),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // CardMapDetail(volunteering: volunteering),
                      const SizedBox(height: 24),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                            "Participar del voluntariado",
                            style: SerManosTypography.headline_02()
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Requisitos",
                          style: SerManosTypography.subtitle_01(),
                        ),
                      ),
                      SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Disponibilidad",
                          style: SerManosTypography.subtitle_01(),
                        ),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ],
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

