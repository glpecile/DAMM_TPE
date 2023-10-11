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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overline,
                        style: const SerManosTypography.overline(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        title,
                        style: const SerManosTypography.subtitle_01(
                          color: SerManosColors.neutral_100,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        description,
                        style: const SerManosTypography.body_02(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ButtonCTA(
                          btnColor: SerManosColors.primary_100,
                          text: "Leer Más",
                          onPressed: () {},
                          foregroundColor: SerManosColors.neutral_75,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
