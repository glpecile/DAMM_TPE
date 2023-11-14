import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class Volunteering {
  final String id;
  final String imageUrl;
  final String type;
  final String title;
  final String goal;
  final String description;
  final GeoPoint location;
  final String address;
  final String requirements;
  final DateTime createdAt;
  final int availableVacant;
  int currentVacant;
  bool isFavorite; // TODO: check
  double? distanceToUser;
  bool? isVolunteeringApproved;

  Volunteering(
      {required this.id,
      required this.imageUrl,
      required this.type,
      required this.title,
      required this.goal,
      required this.description,
      required this.location,
      required this.address,
      required this.requirements,
      required this.createdAt,
      required this.availableVacant,
      required this.currentVacant,
      required this.isFavorite,
      this.distanceToUser,
      this.isVolunteeringApproved});

  factory Volunteering.fromJson(Map<String, dynamic> json) {
    return Volunteering(
        id: json['id'],
        imageUrl: json['imageUrl'],
        type: json['type'],
        title: json['title'],
        goal: json['goal'],
        description: json['description'],
        location: json['location'],
        address: json['address'],
        requirements: json['requirements'],
        createdAt: (json['createdAt'] as Timestamp).toDate(),
        availableVacant: json['availableVacant'],
        currentVacant: json['currentVacant'],
        isFavorite: false,
        distanceToUser: double.infinity);
  }

  void assignDistance(GeoPoint userPosition) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((location.latitude - userPosition.latitude) * p) / 2 +
        c(userPosition.latitude * p) *
            c(location.latitude * p) *
            (1 - c((location.longitude - userPosition.longitude) * p)) /
            2;
    distanceToUser = 12742 * asin(sqrt(a));
  }
}
