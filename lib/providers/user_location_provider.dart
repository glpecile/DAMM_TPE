import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location_provider.g.dart';

@Riverpod(keepAlive: true)
Future<GeoPoint?> userLocationController(UserLocationControllerRef ref) async {
  await Geolocator.requestPermission();
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return GeoPoint(position.latitude, position.longitude);
}