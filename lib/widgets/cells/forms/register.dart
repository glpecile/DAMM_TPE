import 'package:SerManos/helpers/validation.dart';
import 'package:SerManos/models/register.dart';
import 'package:flutter/cupertino.dart';

import '../../molecules/inputs/text_input.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    // TODO: make required
    this.onValidationChanged,
    this.signUpInfo,
    this.formKey,
  });

  // TODO: remove ? and pass correct value
  final Function(bool)? onValidationChanged;
  final RegisterData? signUpInfo;
  final GlobalKey<FormState>? formKey;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isFormValid = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  void _validateForm() {
    var aux = _isFormValid;
    setState(() {
      _isFormValid = emailValidator(emailController.text) == null &&
          passwordValidator(passwordController.text) == null &&
          nameValidator(nameController.text, 'nombre') == null &&
          nameValidator(lastNameController.text, 'apellido') == null;
    });
    if (_isFormValid != aux) {
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
    nameController.addListener(() {
      _validateForm();
    });
    lastNameController.addListener(() {
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
            label: 'Nombre',
            placeholder: "Ej: Juan",
            validator: (name) {
              nameValidator(name, 'nombre');
            },
            controller: nameController),
        const SizedBox(height: 24),
        SerManosTextInput(
            label: 'Apellido',
            placeholder: "Ej: Barcena",
            validator: (lastName) {
              nameValidator(lastName, 'apellido');
            },
            controller: lastNameController),
        const SizedBox(height: 24),
        SerManosTextInput(
            label: 'Email',
            placeholder: "Ej: juanbarcena@mail.com",
            validator: emailValidator,
            controller: emailController),
        const SizedBox(height: 24),
        SerManosTextInput(
            label: 'Contraseña',
            placeholder: "Ej: ABCD1234",
            validator: passwordValidator,
            controller: passwordController),
      ],
    ));
  }
}
