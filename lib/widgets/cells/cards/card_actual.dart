import 'package:SerManos/helpers/maps.dart';
import 'package:SerManos/models/volunteering.dart';
import 'package:SerManos/pages/routes/volunteerings_detail.dart';
import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/shadows.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardVolunteersActual extends StatelessWidget {
  final Volunteering volunteering;

  const CardVolunteersActual({
    super.key,
    required this.volunteering,
  });

  @override
  Widget build(BuildContext context) {
    var id = volunteering.id;
    var title = volunteering.title;
    var lat = volunteering.location.latitude;
    var lng = volunteering.location.longitude;

    return InkWell(
      onTap: () => context.goNamed(VolunteeringsDetail.name,
          pathParameters: {'volunteeringId': id}),
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
                        IconButton(
                          icon: const Icon(
                            SerManosIcons.location,
                            color: SerManosColors.primary_100,
                          ),
                          onPressed: () => openOnGoogleMaps(lat, lng),
                        )
                      ]),
                )))),
      ]),
    );
  }
}
