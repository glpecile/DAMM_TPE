import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:SerManos/widgets/tokens/shadows.dart';
import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/typography.dart';

class CardNews extends StatelessWidget {
  // TODO: swap for model with news data
  final String overline;
  final String title;
  final String description;
  final String? imageUrl;

  const CardNews({
    Key? key,
    required this.overline,
    required this.title,
    required this.description,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 328,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: SerManosColors.neutral_0,
          boxShadow: SerManosShadows.shadow_2,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/donante.jpg',
                width: 118,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 16,bottom: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              overline,
                              style: const SerManosTypography.overline(),
                            ),
                            Text(
                              title,
                              style: const SerManosTypography.subtitle_01(
                                color: SerManosColors.neutral_100,
                              ),
                            ),
                            Text(
                              description,
                              style: const SerManosTypography.body_02(),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ButtonCTA(
                          btnColor: SerManosColors.primary_100,
                          text: "Leer Más",
                          onPressed: () {},
                          foregroundColor: SerManosColors.neutral_75,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
