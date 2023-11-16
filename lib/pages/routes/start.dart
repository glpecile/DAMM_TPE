import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/molecules/buttons/button_cta.dart';
import '../../widgets/tokens/colors.dart';
import '../../widgets/tokens/grid.dart';
import '../../widgets/tokens/typography.dart';

class Start extends StatelessWidget {
  static String name = 'start';
  static String path = '/$name';

  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SerManosColors.neutral_0,
      body: SerManosGrid(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 150,),
                Image.asset('assets/images/logo.png',
                  width: 150,
                  height: 150,),
                const SizedBox(height: 20,),
                const SizedBox(height: 30,),
                const Text("“El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros”",
                  style: SerManosTypography.subtitle_01(),
                  textAlign: TextAlign.center,),
                const SizedBox(height: 250,),
                Row(
                    children: [
                      Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 328,
                              child: ButtonCTA(
                                btnColor: SerManosColors.neutral_0,
                                text: "Iniciar Sesión",
                                onPressed: ()=>context.go('/start/login'),
                                foregroundColor: SerManosColors.neutral_25,
                                backgroundColor: SerManosColors.primary_100,
                              ),
                            ),
                          )
                      ),
                    ]
                ),
                Row(
                  children: [
                    Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 328,
                            child: ButtonCTA(
                              btnColor: SerManosColors.primary_100,
                              text: "Registrarse",
                              onPressed: () => context.go('/start/register'),
                              foregroundColor: SerManosColors.neutral_25,
                              backgroundColor: Colors.transparent,
                    ),
                          ),
                        ))
                  ],)
              ]
          ),]
        ),
      ),
    );
  }
}