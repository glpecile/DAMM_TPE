import 'package:SerManos/models/register.dart';
import 'package:SerManos/pages/routes/home.dart';
import 'package:SerManos/pages/routes/login.dart';
import 'package:SerManos/providers/auth_provider.dart';
import 'package:SerManos/widgets/cells/forms/register.dart';
import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class Register extends ConsumerStatefulWidget {
  static String name = 'register';
  static String path = '$name';

  const Register({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<ConsumerStatefulWidget> {
  var logger = Logger();

  bool _isFormValid = false;
  RegisterData registerData =
      RegisterData(email: '', password: '', lastName: '', firstName: '');
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 48),
                Image.asset('assets/images/logo.png',
                    width: 150, height: 150, fit: BoxFit.contain),
                const SizedBox(height: 16),
                RegisterForm(
                  registerInfo: registerData,
                  formKey: formKey,
                  onValidationChanged: (isValid) {
                    setState(() {
                      _isFormValid = isValid;
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                Row(children: [
                  Expanded(
                    child: ButtonCTA(
                        onPressed: () => {
                              authController.register(registerData)
                            },
                        btnColor: SerManosColors.secondary_10,
                        text: 'Registrarse',
                        foregroundColor: SerManosColors.primary_10,
                        backgroundColor: SerManosColors.primary_100),
                  ),
                ]),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        child: ButtonCTA(
                      onPressed: () => context.goNamed(Login.name),
                      text: 'Ya tengo cuenta',
                      btnColor: SerManosColors.primary_100,
                      foregroundColor: SerManosColors.primary_100,
                      backgroundColor: Colors.transparent,
                    ))
                  ],
                ),
                const SizedBox(height: 16),
              ],
            )
          ],
        ),
      ),
    );
  }
}
