// import 'dart:async';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// import '../../../models/volunteering.dart';
//
// class CardDetailMap extends HookConsumerWidget {
//   const CardDetailMap({Key? key, required this.volunteering,}) : super(key: key);
//
//   final Volunteering volunteering;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
//
//     return GoogleMap(
//       initialCameraPosition: CameraPosition(
//         target: LatLng(volunteering.location.latitude, volunteering.location.longitude),
//         zoom: 15,
//       ),
//       markers: <Marker>{
//         Marker(
//           markerId: MarkerId(volunteering.id),
//           onTap: () {},
//           position: LatLng(
//             volunteering.location.latitude,
//             volunteering.location.longitude,
//           ),
//           icon: BitmapDescriptor.defaultMarker,
//         ),
//       },
//       myLocationButtonEnabled: false,
//       zoomControlsEnabled: false,
//       onMapCreated: (GoogleMapController controller) {
//         _controller.complete(controller);
//       },
//     );
//   }
// }
