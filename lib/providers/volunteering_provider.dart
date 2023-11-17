import 'package:SerManos/models/volunteering.dart';
import 'package:SerManos/providers/favorites_provider.dart';
import 'package:SerManos/providers/user_location_provider.dart';
import 'package:SerManos/services/volunteering_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'volunteering_provider.g.dart';

@riverpod
class VolunteeringController extends _$VolunteeringController {
  final VolunteeringService _volunteeringService = VolunteeringService();
  GeoPoint? userLocation;

  Future<List<Volunteering>> _getVolunteerings(
      String? textSearch, GeoPoint? userPosition) async {
    var volunteerings =
        await _volunteeringService.getVolunteerings(textSearch, userLocation);
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
    userLocation = await ref.watch(userLocationControllerProvider.future);
    await ref.watch(favoritesControllerProvider.selectAsync((data) => null));
    return await _getVolunteerings(null, null);
  }
}
