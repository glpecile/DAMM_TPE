import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../tokens/colors.dart';

class TextInput extends StatelessWidget{
  const TextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("LABEL", style: SerManosTypography.overline(),),
          Text("Content", style: SerManosTypography.body_01(color: SerManosColors.neutral_100),),
          SizedBox(height: 8,),
          Text("LABEL", style: SerManosTypography.overline(),),
          Text("Content", style: SerManosTypography.body_01(color: SerManosColors.neutral_100),),
        ],
      ),
    );
  }
}