import 'package:SerManos/helpers/gender.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

FakeFirebaseFirestore setUp() {
  final instance = FakeFirebaseFirestore();
  const usersCollection = "users";

  instance.collection(usersCollection).doc('0').set({
    'id': '0',
    'email': 'fake@gmail.com',
    'name': 'fake',
    'lastName': 'fakeroo',
    'favorites': [],
    'imageUrl': 'https://i.imgur.com/BoN9kdC.png',
    'birthDate': DateTime.now(),
    'gender': Gender.male.index,
    'phone': 'fakePhone',
    'secondaryEmail': 'fake@gmail,com',
    'hasCompletedProfile': true,
    'volunteering': null,
    'isVolunteeringApproved': false
  });
  
  return instance;
}