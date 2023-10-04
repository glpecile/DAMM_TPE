import 'package:SerManos/widgets/molecules/button_CTA.dart';
import 'package:SerManos/widgets/tokens/shadows.dart';
import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/typography.dart';

class CardNews extends StatelessWidget {
  const CardNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 328,
        height: 156,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: SerManosColors.neutral_0,
            boxShadow: SerManosShadows.shadow_2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Row(children: [
            Column(children: [
              Image.asset(
                'assets/images/donante.jpg',
                width: 118,
                height: 156,
              ),
            ]),
            Expanded(
              child: Column(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("REPORTE 2820",
                              style: SerManosTypography.overline()),
                          Text(
                            "Ser donante voluntario",
                            style: SerManosTypography.subtitle_01(
                                color: SerManosColors.neutral_100),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0, bottom: 8, right: 0, top: 0),
                            child: Text(
                                "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
                                style: SerManosTypography.body_02()),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,8,0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: (
                                ButtonCTA(btnColor: SerManosColors.primary_100, text: "Leer Más", onPressed: () {  },foregroundColor: SerManosColors.neutral_75,)
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
