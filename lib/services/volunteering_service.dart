import 'package:SerManos/models/volunteering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/volunteer.dart';
import 'analytics_service.dart';

class VolunteeringService {
  final String collection = 'volunteering';
  final String userCollection = 'users';

  Volunteer loggedUser;
  AnalyticsService analyticsService;

  VolunteeringService(this.loggedUser, this.analyticsService);

  Future<List<Volunteering>> getVolunteerings(
      String? textSearch, GeoPoint? userPosition) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(collection)
        .orderBy('createdAt', descending: true)
        .get();
    List<Volunteering> volunteerings = [];
    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      var volunteering = Volunteering.fromJson(data);
      if (userPosition != null) {
        volunteering.assignDistance(userPosition);
      }
      if (textSearch == null) {
        volunteerings.add(volunteering);
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
          volunteerings.add(volunteering);
        }
      }
    }

    if (userPosition != null) {
      volunteerings
          .sort((a, b) => a.distanceToUser!.compareTo(b.distanceToUser!));
    }

    return volunteerings;
  }

  Future<Volunteering?> getVolunteeringById(String volunteeringId) async {
    var data = await FirebaseFirestore.instance
        .collection(collection)
        .doc(volunteeringId)
        .get();
    if (data.exists) {
      var volunteeringData = data.data() as Map<String, dynamic>;
      volunteeringData['id'] = data.id;
      return Volunteering.fromJson(volunteeringData);
    }
    return null;
  }

  Future<void> applyVolunteering(String volunteeringId) async {
    Volunteering? volunteering = await getVolunteeringById(volunteeringId);
    if (volunteering == null ||
        volunteering.currentVacant == volunteering.availableVacant) {
      return;
    }

    if (loggedUser.volunteering != null || !loggedUser.hasCompletedProfile) {
      return;
    }

    analyticsService.applyToVolunteeringEvent(volunteeringId, loggedUser.id);
    await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(loggedUser.id)
        .update(
            {'volunteering': volunteering.id, 'isVolunteeringApproved': false});
  }

  Future<void> leaveVolunteering(String volunteeringId) async {
    Volunteering? volunteering = await getVolunteeringById(volunteeringId);
    if (volunteering == null ||
        volunteering.currentVacant == volunteering.availableVacant) {
      return;
    }

    if (loggedUser.volunteering == null ||
        loggedUser.volunteering != volunteeringId) {
      return;
    }

    analyticsService.leaveVolunteeringEvent(volunteeringId, loggedUser.id);
    await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(loggedUser.id)
        .update({'volunteering': null, 'isVolunteeringApproved': false});

    volunteering.currentVacant -= 1;

    await FirebaseFirestore.instance
        .collection(collection)
        .doc(volunteering.id)
        .update({'currentVacant': volunteering.currentVacant});
  }
}
