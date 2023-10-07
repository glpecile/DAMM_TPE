import 'package:SerManos/widgets/molecules/inputs/generic_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SerManosTextInput extends SerManosGenericInput {
  const SerManosTextInput({
    Key? key,
    String? placeholder,
    required String label,
    Widget? suffixIcon,
    required Function(String?) validator,
    required TextEditingController controller,
    bool obscureText = false,
    String? helperText,
    List<TextInputFormatter>? inputFormatters,
    Function(String?)? onSaved,
  }) : super(
          key: key,
          placeholder: placeholder,
          label: label,
          suffixIcon: suffixIcon,
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          helperText: helperText,
          inputFormatters: inputFormatters,
          onSaved: onSaved,
        );
}
