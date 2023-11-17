import 'package:SerManos/models/login.dart';
import 'package:SerManos/providers/auth_provider.dart';
import 'package:SerManos/widgets/cells/forms/log_in.dart';
import 'package:SerManos/widgets/molecules/buttons/expanded_button_cta.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'register.dart';

class Login extends ConsumerStatefulWidget {
  static String name = 'login';
  static String path = name;

  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<ConsumerStatefulWidget> {
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
            ExpandedButtonCTA(
              text: "Iniciar Sesión",
              onPressed: () {
                if (formKey.currentState == null ||
                    !formKey.currentState!.validate()) {
                  return;
                }
                formKey.currentState!.save();
                authController.logIn(loginData, context.goNamed);
              },
              btnColor: _isFormValid
                  ? SerManosColors.neutral_0
                  : SerManosColors.neutral_50,
              foregroundColor: _isFormValid
                  ? SerManosColors.neutral_25
                  : SerManosColors.neutral_50,
              backgroundColor: _isFormValid
                  ? SerManosColors.primary_100
                  : SerManosColors.neutral_25,
            ),
            ExpandedButtonCTA(
              btnColor: SerManosColors.primary_100,
              text: "No tengo cuenta",
              onPressed: () => context.goNamed(Register.name),
              foregroundColor: SerManosColors.neutral_25,
              backgroundColor: Colors.transparent,
            ),
          ]),
        ),
      ),
    );
  }
}
