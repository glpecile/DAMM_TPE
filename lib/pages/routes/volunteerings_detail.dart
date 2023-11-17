import 'package:SerManos/models/volunteer.dart';
import 'package:SerManos/providers/user_volunteering_controller.dart';
import 'package:SerManos/providers/volunteering_by_id_provider.dart';
import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/cells/cards/card_detail_map.dart';
import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:SerManos/widgets/molecules/buttons/vacancy_button.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/volunteering.dart';
import '../../providers/auth_provider.dart';
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
          var requirements = volunteering.requirements.replaceAll('<br>', '\n');
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async{
                ref.refresh(getVolunteeringByIdControllerProvider(volunteeringId: id).future);
                ref.refresh(userVolunteeringControllerProvider.future);
              },
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: CardDetailMap(volunteering: volunteering),
                          ),
                          MarkdownBody(
                            data: requirements,
                            listItemCrossAxisAlignment:
                            MarkdownListItemCrossAxisAlignment.start,
                            styleSheet: MarkdownStyleSheet(
                              a: const SerManosTypography.body_01(),
                              h1: const SerManosTypography.headline_01(),
                              h2: const SerManosTypography.headline_02(),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              VacancyButton(currentVacant: volunteering.availableVacant - volunteering.currentVacant)
                            ],
                          ),
                          const SizedBox(height: 24),
                          PostulateButton(currentVolunteering: volunteering),
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
  final Volunteering currentVolunteering;

  const PostulateButton({super.key, required this.currentVolunteering});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userVolunteeringController =
    ref.watch(userVolunteeringControllerProvider);
    return userVolunteeringController.when(
      data: (userVolunteering) {
        if (userVolunteering == null) {
          // TODO: Agregar caso donde hay que completar perfil
          // Postularme
          var isFull = currentVolunteering.availableVacant == currentVolunteering.currentVacant;
          return Column(
            children: [
              isFull ? const Padding(
                padding: EdgeInsets.only(top: 24, bottom: 24 ),
                child: Text("No hay vacantes disponibles para postularse", style: SerManosTypography.body_01(color: SerManosColors.neutral_100), textAlign: TextAlign.center),
              ) : const SizedBox.shrink(),
              SizedBox(
                width: 328,
                child: ButtonCTA(
                    btnColor: isFull ? SerManosColors.neutral_50 : SerManosColors.neutral_0,
                    text: 'Postularme',
                    onPressed: isFull ? null : () {
                      showDialog(
                          context: context,
                          // TODO: LOGICA DE SI TENES O NO EL PERFIL COMPLETO
                          builder: (BuildContext context) => Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16, 16, 16, 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    "Te estas por postular a",
                                    style:
                                    SerManosTypography.subtitle_01(
                                        color: SerManosColors
                                            .neutral_100),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0,
                                          bottom: 8,
                                          right: 0,
                                          top: 0),
                                      child: Text(
                                          currentVolunteering.title,
                                          style:
                                          const SerManosTypography
                                              .headline_02(
                                              color: SerManosColors
                                                  .neutral_100))),
                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        ButtonCTA(
                                          btnColor: SerManosColors
                                              .primary_100,
                                          text: 'Cancelar',
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          foregroundColor:
                                          SerManosColors.neutral_75,
                                        ),
                                        ButtonCTA(
                                          btnColor: SerManosColors
                                              .primary_100,
                                          text: 'Confirmar',
                                          onPressed: () {
                                            ref
                                                .read(
                                                userVolunteeringControllerProvider
                                                    .notifier)
                                                .applyToVolunteering(
                                                currentVolunteering
                                                    .id);
                                            Navigator.pop(context);
                                          },
                                          foregroundColor:
                                          SerManosColors.neutral_75,
                                        )
                                      ])
                                ],
                              ),
                            ),
                          ));
                    },
                    foregroundColor: isFull ? SerManosColors.neutral_50 : SerManosColors.neutral_10,
                    backgroundColor: isFull ? SerManosColors.neutral_25 : SerManosColors.primary_100),
              ),
            ],
          );
        }
        if (currentVolunteering.id == userVolunteering.id) {
          if (userVolunteering.isVolunteeringApproved!) {
            // Agregar caso donde ya esta postulado y aprobado
            // Estas participando
            // La organización confirmó que ya estas participando de este voluntariado
            return PostulatedTextWidget(
                firstText: "Estas participando",
                secondText:
                "La organización confirmó que ya estas participando de este voluntariado",
                buttonText: "Abandonar voluntariado",
                dialogThirstText:
                "¿Estás seguro que querés abandonar tu voluntariado?",
                dialogSecondText: "Confirmar",
                volunteeringTitle: currentVolunteering.title,
                onPressed: () {
                  ref
                      .read(userVolunteeringControllerProvider.notifier)
                      .leaveVolunteering(userVolunteering.id);
                });
          } else {
            // Estas participando
            // La organización confirmó que ya estas participando de este voluntariado
            return PostulatedTextWidget(
                firstText: "Te has Postulado",
                secondText:
                "Pronto la organización se pondrá en contacto contigo y te inscribirá como participante.",
                dialogThirstText:
                "¿Estás seguro que querés retirar tu postulación?",
                dialogSecondText: "Confirmar",
                volunteeringTitle: currentVolunteering.title,
                buttonText: "Retirar postulación",
                onPressed: () {
                  ref
                      .read(userVolunteeringControllerProvider.notifier)
                      .leaveVolunteering(userVolunteering.id);
                });
          }
        }
        // Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.
        // Abandonar voluntariado actual
        return Column(
          children: [
            PostulatedTextWidget(
                firstText: "",
                secondText: "Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.",
                buttonText: "Abandonar voluntariado actual",
                dialogThirstText: "¿Estás seguro que querés retirar tu postulación?",
                dialogSecondText: "Confirmar",
                volunteeringTitle: userVolunteering.title,
                onPressed: (){},
                btnC: SerManosColors.neutral_50),
            const SizedBox(
                width: 328,
                child: ButtonCTA(btnColor: SerManosColors.neutral_50, text: "Postularme", onPressed: null, foregroundColor: SerManosColors.neutral_50, backgroundColor: SerManosColors.neutral_25))
          ],
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return Text(error.toString());
      },
      loading: () => const LoadingIndicator(),
    );
  }
}

class PostulatedTextWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String buttonText;
  final String dialogThirstText;
  final String dialogSecondText;
  final String volunteeringTitle;
  final VoidCallback? onPressed;
  final Color? btnC;

  PostulatedTextWidget(
      {super.key,
        required this.firstText,
        required this.secondText,
        required this.buttonText,
        required this.dialogThirstText,
        required this.dialogSecondText,
        required this.volunteeringTitle,
        this.onPressed,
        this.btnC});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                firstText,
                style: const SerManosTypography.headline_02(),
              ),
              Text(secondText,
                  style: const SerManosTypography.body_01(),
                  textAlign: TextAlign.center),
              ButtonCTA(
                  btnColor: SerManosColors.primary_100,
                  text: buttonText,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  dialogThirstText,
                                  style:
                                  const SerManosTypography.subtitle_01(
                                      color:
                                      SerManosColors.neutral_100),
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0,
                                        bottom: 8,
                                        right: 0,
                                        top: 0),
                                    child: Text(volunteeringTitle,
                                        style: const SerManosTypography
                                            .headline_02(
                                            color: SerManosColors
                                                .neutral_100))),
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      ButtonCTA(
                                        btnColor: SerManosColors.primary_100,
                                        text: 'Cancelar',
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        foregroundColor:
                                        SerManosColors.neutral_75,
                                      ),
                                      ButtonCTA(
                                        btnColor: btnC != null ? SerManosColors.neutral_50 : SerManosColors.primary_100,
                                        text: dialogSecondText,
                                        onPressed: btnC != null ? null : (){onPressed!();Navigator.pop(context);},
                                        foregroundColor:
                                        SerManosColors.neutral_75,
                                      )
                                    ])
                              ],
                            ),
                          ),
                        ));
                  },
                  foregroundColor: SerManosColors.neutral_25,
                  backgroundColor: SerManosColors.neutral_0)
            ],
          ),
        ),
      ],
    );
  }
}
