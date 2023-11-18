import 'package:SerManos/helpers/gender.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';

class GenderRadioForm extends StatefulWidget {
  final Function(Gender?) onPressed;
  final Gender? previousGender;

  const GenderRadioForm(
      {super.key, required this.onPressed, this.previousGender});

  @override
  State<GenderRadioForm> createState() => RadioGenderState();
}

class RadioGenderState extends State<GenderRadioForm> {
  Gender? _gender;

  @override
  void initState() {
    _gender = widget.previousGender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.key,
      child: Column(
        children: [
          ...Gender.values.map((e) => Container(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        padding: const EdgeInsets.all(2),
                        child: Radio<Gender>(
                          value: e,
                          groupValue: _gender,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => SerManosColors.primary_100),
                          onChanged: (Gender? gender) {
                            setState(() {
                              _gender = gender;
                            });
                            widget.onPressed(gender);
                          },
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(e.text)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
