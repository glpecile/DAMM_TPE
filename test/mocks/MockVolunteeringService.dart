import 'package:SerManos/models/volunteering.dart';
import 'package:SerManos/services/volunteering_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MockVolunteeringService extends VolunteeringService {
  MockVolunteeringService(super._firestore, super.analyticsService, super.userService);

  final List<Volunteering> volunteerings = [
    Volunteering(
        id: '0',
        imageUrl: 'https://i.imgur.com/BoN9kdC.png',
        type: 'Ayuda',
        title: 'Ayuden',
        goal: 'Poder ayudar',
        description: 'Buscamos ayuda',
        location: const GeoPoint(5, 5),
        address: 'Santa Fe',
        requirements: 'Ser joven',
        createdAt: DateTime.now(),
        availableVacant: 20,
        currentVacant: 0,
        isFavorite: false,
        distanceToUser: 15),
    Volunteering(
        id: '1',
        imageUrl: 'https://i.imgur.com/BoN9kdC.png',
        type: 'Comida',
        title: 'Comida',
        goal: 'Comida',
        description: 'Buscamos comida',
        location: const GeoPoint(10, 10),
        address: 'Santa Fe',
        requirements: 'Ser joven',
        createdAt: DateTime.now(),
        availableVacant: 20,
        currentVacant: 0,
        isFavorite: false,
        distanceToUser: 20),
    Volunteering(
        id: '2',
        imageUrl: 'https://i.imgur.com/BoN9kdC.png',
        type: 'Casa',
        title: 'Casa',
        goal: 'Casa',
        description: 'Buscamos casa',
        location: const GeoPoint(0, 0),
        address: 'Santa Fe',
        requirements: 'Ser joven',
        createdAt: DateTime.now(),
        availableVacant: 20,
        currentVacant: 0,
        isFavorite: false,
        distanceToUser: 10)
  ];

  @override
  Future<List<Volunteering>> getVolunteerings(
      String? textSearch, GeoPoint? userPosition) async {
    List<Volunteering> toReturn = [];
    for (var volunteering in volunteerings) {
      if (textSearch == null) {
        toReturn.add(volunteering);
      } else {
        if (volunteering.title
                .toLowerCase()
                .contains(textSearch.toLowerCase().trim()) ||
            volunteering.description
                .toLowerCase()
                .contains(textSearch.toLowerCase().trim()) ||
            volunteering.goal
                .toLowerCase()
                .contains(textSearch.toLowerCase().trim())) {
          toReturn.add(volunteering);
        }
      }
      if (userPosition != null) {
        volunteering.assignDistance(userPosition);
      }
    }

    if (userPosition != null) {
      toReturn.sort((a, b) => a.distanceToUser!.compareTo(b.distanceToUser!));
    }

    return toReturn;
  }

  @override
  Future<void> applyVolunteering(String volunteeringId) async {
    /*
    var volunteering = volunteerings.elementAt(int.parse(volunteeringId));

    Volunteer? loggedUser = await userService!.getCurrentUser();
    if (loggedUser == null ||
        loggedUser.volunteering != null ||
        !loggedUser.hasCompletedProfile) {
      return;
    }
    loggedUser.volunteering = volunteeringId;
    loggedUser.isVolunteeringApproved = false;
     */
    return;
  }

  @override
  Future<void> leaveVolunteering(String volunteeringId) async {
    return;
  }
}
