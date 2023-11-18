import 'package:SerManos/helpers/validation.dart';
import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/molecules/inputs/text_input.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SerManosDateInput extends StatefulWidget {
  final String placeholder;
  final String label;
  final TextEditingController controller;

  final Function(String?) onSaved;

  const SerManosDateInput({
    super.key,
    required this.placeholder,
    required this.label,
    required this.controller,
    required this.onSaved,
  });

  @override
  State<SerManosDateInput> createState() => _SerManosDateInputState();
}

class _SerManosDateInputState extends State<SerManosDateInput> {
  // generate mask formatter to format date dd/mm/yyyy
  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  DateTime firstDate = DateTime.now().subtract(const Duration(days: 365 * 100));
  DateTime lastDate = DateTime.now().add(const Duration(days: 365 * 16));

  @override
  Widget build(BuildContext context) {
    return SerManosTextInput(
      placeholder: widget.placeholder,
      label: widget.label,
      validator: dateValidator,
      controller: widget.controller,
      inputFormatters: [maskFormatter],
      onSaved: widget.onSaved,
      helperText: 'DD/MM/YYYY',
      suffixIcon: IconButton(
        icon: const Icon(SerManosIcons.calendar,
            color: SerManosColors.primary_100),
        onPressed: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            fieldLabelText: "Seleccionar fecha",
            helpText: "Seleccionar fecha",
            cancelText: "Cancelar".toUpperCase(),
            confirmText: "Ok".toUpperCase(),
            initialDate: DateTime.now(),
            firstDate: firstDate,
            lastDate: lastDate,
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: SerManosColors.primary_100,
                    onPrimary: SerManosColors.neutral_0,
                    surface: SerManosColors.neutral_0,
                    onSurface: SerManosColors.neutral_100,
                  ),
                  dialogBackgroundColor: SerManosColors.neutral_0,
                ),
                child: child!,
              );
            },
          );
          if (picked != null) {
            widget.controller.text =
                '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
          }
        },
      ),
    );
  }
}
