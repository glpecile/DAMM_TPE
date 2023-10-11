import 'package:flutter/material.dart';
import '../../../helpers/gender.dart';
import '../../tokens/colors.dart';

class GenderRadio extends StatefulWidget {
  final Function(Gender?) onPressed;

  const GenderRadio({super.key, required this.onPressed});

  @override
  State<GenderRadio> createState() => RadioGenderState();
}

class RadioGenderState extends State<GenderRadio> {
  Gender? _gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...Gender.values
            .map((e) => Container(
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
                              widget.onPressed!(gender);
                            },
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(e.text)
                    ],
                  ),
                ))
            .toList()
      ],
    );
  }
}
