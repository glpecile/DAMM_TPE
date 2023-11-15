import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SizedBox(
        height: 24,
      ),
      Center(
          child: CircularProgressIndicator(
        color: SerManosColors.primary_100,
      ))
    ]);
  }
}
