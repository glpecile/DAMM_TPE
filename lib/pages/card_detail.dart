import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/volunteering_provider.dart';
import '../widgets/molecules/buttons/button_cta.dart';
import '../widgets/tokens/colors.dart';
import '../widgets/tokens/grid.dart';
import '../widgets/tokens/typography.dart';

class CardDetail extends StatelessWidget {
  static String name = 'detail';
  static String path = name;

  const CardDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
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
                        Image.asset(
                          "assets/images/voluntario.jpg",
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
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(SerManosIcons.back, color: SerManosColors.neutral_0,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "ACCIÓN SOCIAL",
                        style: SerManosTypography.overline(color: SerManosColors.neutral_75),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Un Techo Para Mi País",
                        style: SerManosTypography.headline_01(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "El propósito principal de \"Un techo para mi país\" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.",
                        style: SerManosTypography.body_01(color: SerManosColors.secondary_200)
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Sobre la actividad",
                        style: SerManosTypography.headline_02()
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Te necesitamos para construir las viviendas de las personas que necesitan un techo. Estas están prefabricadas en madera y deberás ayudar en carpintería, montaje, pintura y demás actividades de la construcción.",
                        style: SerManosTypography.body_01(color: SerManosColors.neutral_100),
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Participar del voluntariado",
                        style: SerManosTypography.headline_02()
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Requisitos",
                        style: SerManosTypography.subtitle_01(),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
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
      }
}

