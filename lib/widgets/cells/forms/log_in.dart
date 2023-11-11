import 'package:SerManos/helpers/validation.dart';
import 'package:SerManos/models/login.dart';
import 'package:SerManos/widgets/molecules/inputs/password_input.dart';
import 'package:SerManos/widgets/molecules/inputs/text_input.dart';
import 'package:flutter/material.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({
    super.key,
    this.onValidationChanged,
    this.logInData,
    this.formKey,
  });

  // TODO: remove ? and pass correct value
  final Function(bool)? onValidationChanged;
  final LogInData? logInData;
  final GlobalKey<FormState>? formKey;

  @override
  State createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isFormValid = true;

  void _validateForm() {
    bool aux = _isFormValid;
    setState(() {
      _isFormValid = emailValidator(emailController.text) == null &&
          passwordValidator(passwordController.text) == null;
    });
    if (aux != _isFormValid) {
      // TODO: remove ! once onValidationChanged is required
      widget.onValidationChanged!(_isFormValid);
    }
  }

  @override
  void initState() {
    emailController.addListener(() {
      _validateForm();
    });
    passwordController.addListener(() {
      _validateForm();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SerManosTextInput(
              label: 'Email',
              validator: emailValidator,
              controller: emailController),
          const SizedBox(height: 24),
          SerManosPasswordInput(
              label: 'Contraseña', controller: passwordController)
        ],
      ),
    );
  }
}
