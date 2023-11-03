import 'package:SerManos/models/volunteering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteeringService {
  final String collection = 'volunteering';

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

  Future<void> updateVolunteerings(String volunteeringId, int toChange) async {
    Volunteering? volunteering = await getVolunteeringById(volunteeringId);
    if (volunteering == null) {
      return;
    }
    volunteering.currentVacant += toChange;
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(volunteeringId)
        .update({'currentVacant': volunteering.currentVacant});
  }
}
