// import 'package:SerManos/models/volunteer.dart';
// import 'package:SerManos/widgets/cells/cards/card_detail_map.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../../../models/volunteering.dart';
// import '../../tokens/colors.dart';
// import '../../tokens/typography.dart';
//
// class CardMapDetail extends StatelessWidget {
//   final Volunteering volunteering;
//
//   const CardMapDetail({super.key, required this.volunteering});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(4),
//                 topLeft: Radius.circular(4),
//               ),
//               color: SerManosColors.secondary_25,
//             ),
//             width: double.infinity,
//             child: const Text(
//               "Ubicación",
//               style: SerManosTypography.subtitle_01(),
//             ),
//           ),
//           SizedBox(
//             height: 155,
//             child: CardDetailMap(
//               volunteering: volunteering,
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: 8,
//             ),
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(4),
//                   bottomLeft: Radius.circular(4)),
//               color: SerManosColors.neutral_10,
//             ),
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "DIRECCIÓN",
//                   style: SerManosTypography.overline(
//                     color: SerManosColors.neutral_75,
//                   ),
//                 ),
//                 Text(
//                   volunteering.address,
//                   style: const SerManosTypography.body_01(),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }