import 'package:flutter/cupertino.dart';

import '../../tokens/colors.dart';
import '../../tokens/typography.dart';

class CardInformation extends StatelessWidget {
  final String title;
  final String label1;
  final String content1;
  final String label2;
  final String content2;

  const CardInformation({super.key, required this.title, required this.label1, required this.content1, required this.label2, required this.content2});
  
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Column(
        children: [
          buildTopContainer(),
          buildBottomContainer(),
        ],
      ),
    );
  }
  
  Widget buildTopContainer() {
    return Container(
      width: 328,
      color: SerManosColors.secondary_25,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: const SerManosTypography.subtitle_01(),
      ),
    );
  }
  
    Widget buildBottomContainer() {
    return Container(
      width: 328,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: SerManosColors.neutral_10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label1,
            style: const SerManosTypography.overline(),
          ),
          Text(
            content1,
            style: const SerManosTypography.body_01(color: SerManosColors.neutral_100),
          ),
          const SizedBox(height: 8),
          Text(
            label2,
            style: const SerManosTypography.overline(),
          ),
          Text(
            content2,
            style: const SerManosTypography.body_01(color: SerManosColors.neutral_100),
          )
        ],
      )
    );
  }

}