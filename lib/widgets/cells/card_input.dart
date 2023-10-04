import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/cupertino.dart';
import '../tokens/colors.dart';

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
                  height: 112,
                  decoration: const BoxDecoration(color: SerManosColors.neutral_10),)
              ]),
        ),
      ),
    );
  }
}
