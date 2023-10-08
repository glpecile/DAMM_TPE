import 'package:cloud_firestore/cloud_firestore.dart';

class Volunteering {
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
  // bool? isFavorite; // TODO: check

  Volunteering(
      {required this.imageUrl,
      required this.type,
      required this.title,
      required this.goal,
      required this.description,
      required this.location,
      required this.address,
      required this.requirements,
      required this.createdAt,
      required this.availableVacant});
      //this.isFavorite});
}
