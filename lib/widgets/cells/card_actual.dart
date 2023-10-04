import 'package:flutter/cupertino.dart';

import '../atoms/icons.dart';
import '../tokens/colors.dart';
import '../tokens/shadows.dart';
import '../tokens/typography.dart';

class CardVolunteersActual extends StatelessWidget {
  const CardVolunteersActual({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 328,
            height: 72,
            decoration: BoxDecoration(
                border: Border.all(
                    color: SerManosColors.primary_100,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(6),
                color: SerManosColors.primary_5,
                boxShadow: SerManosShadows.shadow_2),
            child: const ClipRRect(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ACCIÓN SOCIAL", style: SerManosTypography.overline()),
                              Text("Un Techo para mi País", style: SerManosTypography.subtitle_01(color: SerManosColors.neutral_100),
                              ),
                            ]),
                        Icon(SerManosIcons.location,color: SerManosColors.primary_100,)
                      ]
                  ),
                ))));
  }



}