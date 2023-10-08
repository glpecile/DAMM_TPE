import 'package:SerManos/helpers/validation.dart';
import 'package:SerManos/widgets/molecules/inputs/generic_input.dart';
import 'package:SerManos/widgets/molecules/inputs/text_input.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';
import 'package:SerManos/widgets/atoms/icons.dart';

// stateful widget
class SerManosPasswordInput extends SerManosGenericInput {
  const SerManosPasswordInput(
      {super.key,
      required super.label,
      super.validator = passwordValidator,
      required super.controller});

  @override
  State<SerManosPasswordInput> createState() => _SerManosPasswordInputState();
}

class _SerManosPasswordInputState extends State<SerManosPasswordInput> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SerManosTextInput(
        controller: widget.controller,
        obscureText: !_isPasswordVisible,
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible
                ? SerManosIcons.visibility
                : SerManosIcons.visibilityOff,
            color: SerManosColors.neutral_75,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        onSaved: widget.onSaved,
        label: widget.label,
        validator: widget.validator);
  }
}
