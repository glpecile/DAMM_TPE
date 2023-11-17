import 'package:SerManos/pages/routes/login.dart';
import 'package:SerManos/pages/routes/register.dart';
import 'package:SerManos/widgets/molecules/buttons/expanded_button_cta.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Start extends StatelessWidget {
  static String name = 'start';
  static String path = '/$name';

  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SerManosColors.neutral_0,
      body: SerManosGrid(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "“El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros”",
              style: SerManosTypography.subtitle_01(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 250,
            ),
            ExpandedButtonCTA(
              btnColor: SerManosColors.neutral_0,
              text: "Iniciar Sesión",
              onPressed: () => context.goNamed(Login.name),
              foregroundColor: SerManosColors.neutral_25,
              backgroundColor: SerManosColors.primary_100,
            ),
            ExpandedButtonCTA(
              btnColor: SerManosColors.primary_100,
              text: "Registrarse",
              onPressed: () => context.goNamed(Register.name),
              foregroundColor: SerManosColors.neutral_25,
              backgroundColor: Colors.transparent,
            )
          ]),
        ),
      ),
    );
  }
}
