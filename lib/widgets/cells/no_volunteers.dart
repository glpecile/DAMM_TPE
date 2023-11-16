import 'package:flutter/cupertino.dart';

import '../tokens/colors.dart';

class NoVolunteers extends StatelessWidget {
  final String title;

  const NoVolunteers({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          width: 328,
          decoration: BoxDecoration(
            color: SerManosColors.neutral_0,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
