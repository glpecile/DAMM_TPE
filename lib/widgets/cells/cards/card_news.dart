import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:SerManos/widgets/tokens/shadows.dart';
import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/typography.dart';

class CardNews extends StatelessWidget {
  // TODO: swap for model with news data
  final String overline;
  final String title;
  final String subtitle;
  final String imageUrl;

  final Function onPressed;

  const CardNews({
    super.key,
    required this.overline,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.onPressed,
  });

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
              Image.network(
                imageUrl,
                width: 118,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 16, bottom: 8),
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
                              subtitle,
                              style: const SerManosTypography.body_02(),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ButtonCTA(
                          btnColor: SerManosColors.primary_100,
                          text: "Leer Más",
                          onPressed: () => onPressed,
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
