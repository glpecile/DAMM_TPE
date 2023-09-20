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
          boxShadow: const [
            BoxShadow(
              color: SerManosColors.neutral_75,
              blurRadius: 6,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Row(
              children: [
                Column(
                    children: [
                      Image.asset(
                        'assets/images/donante.jpg',width: 118,height: 156,
                      ),
                    ]),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
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
                        Text("Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
                            style: SerManosTypography.body_02()
                        ),
                      ],
                    ),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
