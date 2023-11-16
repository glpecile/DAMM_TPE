import 'package:SerManos/helpers/maps.dart';
import 'package:SerManos/models/volunteering.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardDetailMap extends HookConsumerWidget {
  final Volunteering volunteering;

  const CardDetailMap({
    super.key,
    required this.volunteering,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // https://github.com/flutter/packages/tree/main/packages/google_maps_flutter/google_maps_flutter
    // final Completer<GoogleMapController> completerController =
    //     Completer<GoogleMapController>();

    return InkWell(
      onTap: () => openOnGoogleMaps(
          volunteering.location.latitude, volunteering.location.latitude),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  topLeft: Radius.circular(4),
                ),
                color: SerManosColors.secondary_25,
              ),
              width: double.infinity,
              child: const Text(
                "Ubicación",
                style: SerManosTypography.subtitle_01(
                    color: SerManosColors.neutral_100),
              ),
            ),
            // SizedBox(
            //   height: 155,
            //   child: GoogleMap(
            //     initialCameraPosition: CameraPosition(
            //       target: LatLng(volunteering.location.latitude,
            //           volunteering.location.longitude),
            //       zoom: 15,
            //     ),
            //     markers: <Marker>{
            //       Marker(
            //         markerId: MarkerId(volunteering.id),
            //         onTap: () {},
            //         position: LatLng(
            //           volunteering.location.latitude,
            //           volunteering.location.longitude,
            //         ),
            //         icon: BitmapDescriptor.defaultMarker,
            //       ),
            //     },
            //     myLocationButtonEnabled: false,
            //     zoomControlsEnabled: false,
            //     onMapCreated: (GoogleMapController controller) {
            //       completerController.complete(controller);
            //     },
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4)),
                color: SerManosColors.neutral_10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "DIRECCIÓN",
                    style: SerManosTypography.overline(
                      color: SerManosColors.neutral_75,
                    ),
                  ),
                  Text(volunteering.address,
                      style: const SerManosTypography.body_01(
                        color: SerManosColors.neutral_100,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
