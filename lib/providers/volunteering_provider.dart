import 'package:SerManos/models/volunteering.dart';
import 'package:SerManos/providers/favorites_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/volunteering_service.dart';

part 'volunteering_provider.g.dart';

@Riverpod(keepAlive: true)
class VolunteeringController extends _$VolunteeringController {
  final VolunteeringService _volunteeringService = VolunteeringService();

  Future<List<Volunteering>> _getVolunteerings(String? textSearch, GeoPoint? userPosition) async {
    var volunteerings =
        await _volunteeringService.getVolunteerings(textSearch, userPosition);
    return volunteerings;
  }

  Future<void> search(String? textSearch, GeoPoint? userPosition) async {
    var volunteerings = await _getVolunteerings(textSearch, userPosition);
    state = AsyncValue.data(volunteerings);
  }

  // TODO: capaz hay que jugar un poco mas con el estado
  // y hacer que state sea loading y eso
  @override
  Future<List<Volunteering>> build() async {
    await ref.watch(favoritesControllerProvider.selectAsync((data) => null));
    return await _getVolunteerings(null, null);
  }


}
