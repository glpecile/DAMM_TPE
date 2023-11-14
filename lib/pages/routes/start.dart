import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/molecules/buttons/button_cta.dart';
import '../../widgets/tokens/colors.dart';
import '../../widgets/tokens/grid.dart';
import '../../widgets/tokens/typography.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SerManosColors.neutral_0,
      body: SerManosGrid(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150,),
              Image.asset('assets/images/logo.png',
                width: 150,
                height: 150,),
              const SizedBox(height: 20,),
              const Text("¡Bienvenido!", style: SerManosTypography.headline_01(),),
              const SizedBox(height: 30,),
              const Text("Nunca subestimes tu habilidad para mejorar la vida de alguien.",
                style: SerManosTypography.subtitle_01(),
                textAlign: TextAlign.center,),
              const SizedBox(height: 190,),
              Row(
                  children: [
                Expanded(
                    child: ButtonCTA(
                        btnColor: SerManosColors.neutral_0,
                        text: "Comenzar",
                        onPressed: () => context.go('/home'),
                        foregroundColor: SerManosColors.neutral_25,
                        backgroundColor: SerManosColors.primary_100,
                        )
                ),
              ]
              ),
            ]
        ),
      ),
    );
  }
}
