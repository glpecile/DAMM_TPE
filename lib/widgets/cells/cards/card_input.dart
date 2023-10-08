import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../tokens/colors.dart';

class CardInput extends StatelessWidget {
  final Widget data;
  final String text;

  const CardInput({super.key, required this.text, required this.data});

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
                  height: 35,
                  decoration: const BoxDecoration(color: SerManosColors.secondary_25),
                  child: Padding(padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                      child: Text(text,style: const SerManosTypography.subtitle_01(),)),
                ),
                Container(
                    width: 328,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(color: SerManosColors.neutral_10),
                    child:
                        data
                )
              ]),
        ),
      ),
    );
  }
}
