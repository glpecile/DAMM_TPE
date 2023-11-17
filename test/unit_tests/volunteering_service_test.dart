import 'package:SerManos/models/volunteering.dart';
import 'package:SerManos/services/volunteering_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VolunteeringService', () {
    late FirebaseFirestore firestore;
    late VolunteeringService volunteeringService;

    setUpAll(() {
      firestore = FakeFirebaseFirestore();
      volunteeringService = VolunteeringService(firestore);
    });

    test('returns volunteering list when getVolunteerings is called', () async {
      await firestore.collection('volunteering').add({
        'id': 'some-id',
        'imageUrl': 'some-image-url',
        'type': 'Test Type',
        'title': 'Test Volunteering',
        'goal': 'Test Goal',
        'description': 'Test Description',
        'location': const GeoPoint(0, 0), // replace with actual values
        'address': 'some-address',
        'requirements': 'some-requirements',
        'createdAt': DateTime.parse('2021-10-10 10:10:10'),
        'availableVacant': 10, // replace with actual value
        'currentVacant': 5, // replace with actual value
        'isFavorite': false,
      });

      final result = await volunteeringService.getVolunteerings(null, null);

      expect(result, isA<List<Volunteering>>());
      expect(result.first.title, 'Test Volunteering');
    });

    test(
        'returns a volunteering item when getVolunteeringById is called with existing id',
        () async {
      var docRef = await firestore.collection('volunteering').add({
        'id': 'some-id',
        'imageUrl': 'some-image-url',
        'type': 'Test Type',
        'title': 'Test Volunteering',
        'goal': 'Test Goal',
        'description': 'Test Description',
        'location': const GeoPoint(0, 0), // replace with actual values
        'address': 'some-address',
        'requirements': 'some-requirements',
        'createdAt': DateTime.parse('2021-10-10 10:10:10'),
        'availableVacant': 10, // replace with actual value
        'currentVacant': 5, // replace with actual value
        'isFavorite': false,
      });

      final volunteeringId = docRef.id;
      final volunteering =
          await volunteeringService.getVolunteeringById(volunteeringId);

      expect(volunteering, isA<Volunteering>());
      expect(volunteering?.title, 'Test Volunteering');
    });

    test('returns null when getVolunteeringById is called with non-existing id',
        () async {
      final result =
          await volunteeringService.getVolunteeringById('non-existing-id');

      expect(result, isNull);
    });
  });
}
