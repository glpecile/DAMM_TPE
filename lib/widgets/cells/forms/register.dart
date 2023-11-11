import 'package:SerManos/helpers/validation.dart';
import 'package:SerManos/models/register.dart';
import 'package:SerManos/widgets/molecules/inputs/password_input.dart';
import 'package:flutter/cupertino.dart';

import '../../molecules/inputs/text_input.dart';

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
    return Form(
        child: Column(
      children: [
        buildTextInput(
            'Nombre', 'Ej: Juan', nameValidator, nameController, 'nombre'),
        buildTextInput('Apellido', 'Ej: Barcena', nameValidator,
            lastNameController, 'apellido'),
        buildTextInput('Email', 'Ej: juanbarcena@mail.com', emailValidator,
            emailController),
        SerManosPasswordInput(
            label: 'Contraseña',
            validator: passwordValidator,
            controller: passwordController),
      ],
    ));
  }
}

Widget buildTextInput(
  String label,
  String placeholder,
  Function validator,
  TextEditingController controller, [
  String? validationArgument,
]) {
  return Column(
    children: [
      SerManosTextInput(
        label: label,
        placeholder: placeholder,
        validator: (value) {
          if (validationArgument != null) {
            validator(value, validationArgument);
          } else {
            validator(value);
          }
        },
        controller: controller,
      ),
      const SizedBox(height: 24),
    ],
  );
}
