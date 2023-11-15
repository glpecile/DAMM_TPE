import 'package:SerManos/pages/routes/login.dart';
import 'package:SerManos/providers/auth_provider.dart';
import 'package:SerManos/widgets/cells/forms/register.dart';
import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/register.dart';

class Register extends ConsumerStatefulWidget {
  static String name = 'register';
  static String path = '$name';

  const Register({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<ConsumerStatefulWidget> {
  bool _isFormValid = false;
  RegisterData registerData =
      RegisterData(firstName: "", lastName: "", email: "", password: "");
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 48),
                  Image.asset('assets/images/logo.png',
                      width: 150, height: 150, fit: BoxFit.contain),
                  const SizedBox(height: 16),
                  RegisterForm(
                    onValidationChanged: (isValid) {
                      setState(() {
                        _isFormValid = isValid;
                      });
                    },
                    registerInfo: registerData,
                    formKey: formKey,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Row(children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 328,
                            child: ButtonCTA(
                                onPressed: () => {
                                      if (formKey.currentState!.validate())
                                        {
                                          formKey.currentState!.save(),
                                          authController.register(registerData),
                                        },
                                    },
                                btnColor: SerManosColors.secondary_10,
                                text: 'Registrarse',
                                foregroundColor: SerManosColors.neutral_25,
                                backgroundColor: SerManosColors.primary_100),
                          ),
                        ),
                      ),
                    ]),
                    // const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                            child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 328,
                            child: ButtonCTA(
                              onPressed: () => context.goNamed(Login.name),
                              text: 'Ya tengo cuenta',
                              btnColor: SerManosColors.primary_100,
                              foregroundColor: SerManosColors.neutral_25,
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
