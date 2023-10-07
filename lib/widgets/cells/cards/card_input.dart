import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../tokens/colors.dart';

class CardInput extends StatelessWidget {
  const CardInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          width: 328,
          height: 152,
          child: Column(
              children: [
                Container(
                  width: 328,
                  height: 40,
                  decoration: const BoxDecoration(color: SerManosColors.secondary_25),
                  child: const Padding(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                      child: Text("Información de perfil",style: SerManosTypography.subtitle_01(),)),
                ),
                Container(
                    width: 328,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(color: SerManosColors.neutral_10),
                    child:
                    const GenderRadio()
                )
              ]),
        ),
      ),
    );
  }
}

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