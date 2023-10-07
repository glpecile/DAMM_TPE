import 'package:SerManos/models/login.dart';
import 'package:SerManos/utils/validation.dart';
import 'package:SerManos/widgets/molecules/inputs/password_input.dart';
import 'package:SerManos/widgets/molecules/inputs/text_input.dart';
import 'package:flutter/material.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({
    Key? key,
    //required this.onValidationChanged,
    //required this.logInData,
    //required this.formKey,
  }) : super(key: key);

  //final Function(bool) onValidationChanged;
  //final LogInData logInData;
  //inal GlobalKey<FormState> formKey;

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
      //widget.onValidationChanged(_isFormValid);
    }
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {});
    passwordController.addListener(() {});
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
