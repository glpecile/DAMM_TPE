import 'package:SerManos/widgets/molecules/inputs/generic_input.dart';

class SerManosTextInput extends SerManosGenericInput {
  const SerManosTextInput({
    super.key,
    super.placeholder,
    required super.label,
    super.suffixIcon,
    required super.validator,
    required super.controller,
    super.obscureText,
    super.helperText,
    super.inputFormatters,
    required super.onSaved,
  });
}
