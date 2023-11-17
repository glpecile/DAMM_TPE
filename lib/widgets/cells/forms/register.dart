import 'package:SerManos/helpers/validation.dart';
import 'package:SerManos/models/register.dart';
import 'package:SerManos/widgets/molecules/inputs/password_input.dart';
import 'package:SerManos/widgets/molecules/inputs/text_input.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final Function(bool) onValidationChanged;
  final RegisterData? registerInfo;
  final GlobalKey<FormState>? formKey;

  const RegisterForm({
    super.key,
    required this.onValidationChanged,
    required this.registerInfo,
    required this.formKey,
  });

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
      widget.onValidationChanged(_isFormValid);
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
    const spaceY = 24.0;
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            SerManosTextInput(
              label: 'Nombre',
              placeholder: 'Ej: Juan',
              validator: (value) => nameValidator('Nombre', value),
              controller: nameController,
              onSaved: (String? value) {
                widget.registerInfo!.firstName = value ?? '';
              },
            ),
            const SizedBox(height: spaceY),
            SerManosTextInput(
              label: 'Apellido',
              placeholder: 'Ej: Barcena',
              validator: (String? value) => nameValidator('Apellido', value),
              controller: lastNameController,
              onSaved: (String? value) {
                widget.registerInfo!.lastName = value ?? '';
              },
            ),
            const SizedBox(height: spaceY),
            SerManosTextInput(
              label: 'Email',
              placeholder: 'Ej: juanbarcena@gmail.com',
              validator: (String? value) => emailValidator(value),
              controller: emailController,
              onSaved: (String? value) {
                widget.registerInfo!.email = value ?? '';
              },
            ),
            const SizedBox(height: spaceY),
            SerManosPasswordInput(
              label: 'Contraseña',
              placeholder: 'Ej: ABCD1234',
              validator: passwordValidator,
              controller: passwordController,
              onSaved: (String? value) {
                widget.registerInfo!.password = value ?? '';
              },
            )
          ],
        ));
  }
}
