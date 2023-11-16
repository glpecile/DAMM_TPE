import 'dart:developer';

import 'package:SerManos/models/login.dart';
import 'package:SerManos/pages/routes/welcome.dart';
import 'package:SerManos/widgets/cells/forms/log_in.dart';
import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../providers/auth_provider.dart';

class Login extends ConsumerStatefulWidget {
  static String name = 'login';
  static String path = name;

  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<ConsumerStatefulWidget> {
  var logger = Logger();

  bool _isFormValid = false;
  LogInData loginData = LogInData();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var authController = ref.read(authControllerProvider.notifier);
    return Scaffold(
      backgroundColor: SerManosColors.neutral_0,
      body: SerManosGrid(
        child: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 40,
            ),
            LogInForm(
              onValidationChanged: (isValid) {
                setState(() {
                  _isFormValid = isValid;
                });
              },
              logInData: loginData,
              formKey: formKey,
            ),
            const SizedBox(height: 180),
            Column(
              children: [
                Row(children: [
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 328,
                      child: ButtonCTA(
                        btnColor: SerManosColors.neutral_0,
                        text: "Iniciar Sesión",
                        onPressed: () {
                          if (formKey.currentState == null) {
                            logger.w("_formkey.currentState is null!");
                          } else if (formKey.currentState!.validate()) {
                            logger.w("form input is valid");
                            formKey.currentState!.save();
                          }
                          log("A PUNTO DE LOGGEAR");
                          authController.logIn(
                              loginData, context.goNamed);
                        },
                        foregroundColor: SerManosColors.neutral_25,
                        backgroundColor: SerManosColors.primary_100,
                      ),
                    ),
                  )),
                ]),
              ],
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
                      text: "No tengo cuenta",
                      onPressed: () => context.go('/start/register'),
                      foregroundColor: SerManosColors.neutral_25,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ))
              ],
            )
          ]),
        ]),
      ),
    );
  }
}
