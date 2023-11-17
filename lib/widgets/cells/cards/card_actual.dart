import 'package:SerManos/pages/routes/volunteerings_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../atoms/icons.dart';
import '../../tokens/colors.dart';
import '../../tokens/shadows.dart';
import '../../tokens/typography.dart';

class CardVolunteersActual extends StatelessWidget {
  final String title;
  final String id;

  const CardVolunteersActual({
    super.key,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.goNamed(VolunteeringsDetail.name, pathParameters: {'volunteeringId': id}),
      child: Column(children: [
        const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16, bottom: 24, top: 24, right: 16),
            child: Text(
              'Tu actividad',
              style: SerManosTypography.headline_01(),
            ),
          ),
        ),
        Center(
            child: Container(
                width: 328,
                height: 72,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: SerManosColors.primary_100, width: 2),
                    borderRadius: BorderRadius.circular(6),
                    color: SerManosColors.primary_5,
                    boxShadow: SerManosShadows.shadow_2),
                child: ClipRRect(
                    child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("ACCIÓN SOCIAL",
                                  style: SerManosTypography.overline()),
                              Text(
                                title,
                                style: const SerManosTypography.subtitle_01(
                                    color: SerManosColors.neutral_100),
                              ),
                            ]),
                        const Icon(
                          SerManosIcons.location,
                          color: SerManosColors.primary_100,
                        )
                      ]),
                )))),
      ]),
    );
  }
}
