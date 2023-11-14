import 'package:SerManos/models/volunteering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/volunteering_service.dart';

part 'volunteering_provider.g.dart';

@Riverpod(keepAlive: true)
class VolunteeringController extends _$VolunteeringController {
  final VolunteeringService _volunteeringService = VolunteeringService();

  Future<void> getVolunteerings(
      String? textSearch, GeoPoint? userPosition) async {
    var volunteerings =
        await _volunteeringService.getVolunteerings(textSearch, userPosition);
    state = volunteerings;
  }

  @override
  List<Volunteering> build() {
    getVolunteerings(null, null);
    return state;
  }
}
