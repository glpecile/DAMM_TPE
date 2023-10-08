import 'package:flutter/material.dart';
import '../../tokens/colors.dart';

class GenderRadio extends StatefulWidget {
  const GenderRadio({super.key});

  @override
  State<GenderRadio> createState() => RadioGenderState();
}

class RadioGenderState extends State<GenderRadio>{
  Gender? _gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ... Gender.values.map((e) =>
            Container(
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
                        fillColor: MaterialStateColor.resolveWith((states) => SerManosColors.primary_100),
                        onChanged:(Gender? gender){
                          setState(() {
                            _gender = gender;
                          });
                        },
                      )
                  ),
                  const SizedBox(width: 10,),
                  Text(e.text)
                ],
              ),
            )
        ).toList()
      ],
    );
  }

}



enum Gender{
  hombre("Hombre"),
  mujer("Mujer"),
  no_binario("No binario");

  const Gender(this.text);
  final String text;
}