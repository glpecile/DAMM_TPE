import 'dart:developer';

import 'package:SerManos/models/volunteering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/volunteering_service.dart';

part 'volunteering_provider.g.dart';

@riverpod
class VolunteeringController extends _$VolunteeringController {
  final _volunteeringService = VolunteeringService();
  bool isFetching = false;

  void getVolunteerings(String? textSearch, GeoPoint? userPosition) async {
    isFetching = true;
    var volunteerings =
        await _volunteeringService.getVolunteerings(textSearch, userPosition);
    isFetching = false;
    log(volunteerings.toString());
    state = volunteerings;
  }

  @override
  List<Volunteering> build() {
    state = [];
    getVolunteerings(null, null);
    return state;
  }
}
