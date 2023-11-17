import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class SerManosGenericInput extends StatefulWidget {
  const SerManosGenericInput({
    super.key,
    this.placeholder,
    required this.label,
    this.suffixIcon,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    this.helperText,
    this.inputFormatters,
    required this.onSaved,
  });

  final String? placeholder;
  final String label;
  final Widget? suffixIcon;
  final Function(String?) validator;
  final TextEditingController controller;
  final bool obscureText;
  final String? helperText;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?) onSaved;

  @override
  State<SerManosGenericInput> createState() => _SerManosGenericInputState();
}

class _SerManosGenericInputState extends State<SerManosGenericInput> {
  final FocusNode _focusNode = FocusNode();
  bool hasError = false;

  Widget? buildSuffixIcon(bool hasError) {
    if (hasError) {
      return const Icon(SerManosIcons.error, color: SerManosColors.error_100);
    } else {
      return widget.suffixIcon;
    }
  }

  Color labelColor(bool hasError) {
    if (hasError) {
      return SerManosColors.error_100;
    } else if (_focusNode.hasFocus) {
      return SerManosColors.secondary_200;
    } else {
      return SerManosColors.neutral_75;
    }
  }

  @override
  Widget build(BuildContext context) {
    InputBorder? errorBorder = hasError
        ? const OutlineInputBorder(
            borderSide: BorderSide(color: SerManosColors.error_100, width: 1))
        : null;

    InputDecoration defaultStyle = InputDecoration(
      labelText: widget.label,
      hintText: widget.placeholder,
      hintStyle: const SerManosTypography.body_01(color: SerManosColors.neutral_50),
      helperText: _focusNode.hasFocus ? widget.helperText : null,
      helperStyle:
          const SerManosTypography.caption(color: SerManosColors.neutral_75),
      suffixIcon: buildSuffixIcon(hasError),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: SerManosColors.neutral_75, width: 1)),
      errorBorder: errorBorder,
      focusColor: SerManosColors.secondary_200,
      focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: SerManosColors.secondary_200, width: 1)),
      labelStyle: SerManosTypography.subtitle_01(color: labelColor(hasError)),
      floatingLabelBehavior: widget.placeholder != null
          ? FloatingLabelBehavior.always
          : FloatingLabelBehavior.auto,
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: SerManosColors.neutral_50, width: 1),
      ),
    );

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: _focusNode,
      decoration: defaultStyle,
      controller: widget.controller,
      cursorColor:
          hasError ? SerManosColors.error_100 : SerManosColors.secondary_200,
      obscureText: widget.obscureText,
      inputFormatters: widget.inputFormatters,
      onChanged: (value) => setState(() {
        hasError = widget.validator(value) != null;
      }),
      onSaved: widget.onSaved,
      validator: (value) => widget.validator(value),
    );
  }
}
