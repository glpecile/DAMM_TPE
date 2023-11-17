import 'package:SerManos/models/register.dart';
import 'package:SerManos/pages/routes/login.dart';
import 'package:SerManos/providers/auth_provider.dart';
import 'package:SerManos/widgets/cells/forms/register.dart';
import 'package:SerManos/widgets/molecules/buttons/expanded_button_cta.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Register extends ConsumerStatefulWidget {
  static String name = 'register';
  static String path = name;

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
              const SizedBox(height: 120),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ExpandedButtonCTA(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      formKey.currentState!.save();
                      authController.register(registerData);
                    },
                    text: 'Registrarse',
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
                    onPressed: () => context.goNamed(Login.name),
                    text: 'Ya tengo cuenta',
                    btnColor: SerManosColors.primary_100,
                    foregroundColor: SerManosColors.neutral_25,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
