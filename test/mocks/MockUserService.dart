import 'package:SerManos/helpers/gender.dart';
import 'package:SerManos/models/contact.dart';
import 'package:SerManos/models/login.dart';
import 'package:SerManos/models/profile.dart';
import 'package:SerManos/models/register.dart';
import 'package:SerManos/models/volunteer.dart';
import 'package:SerManos/services/user_service.dart';

class MockUserService extends UserService {
  @override
  final String collection = 'users';
  final Volunteer volunteer = Volunteer.fromJson({
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

  MockUserService(super._firestore, super.analyticsService);

  @override
  Future logIn(LogInData data) async {
    return volunteer;
  }

  @override
  Future logOut() async {
    return;
  }

  @override
  Future signUp(RegisterData registerData) async {
    return;
  }

  @override
  Future<Volunteer?> getCurrentUser() async {
    return volunteer;
  }

  @override
  Future<Volunteer?> getUserById(String userId) async {
    return volunteer;
  }

  @override
  Future<void> addFavorite(String volunteeringId) async {
    volunteer.favorites.add(volunteeringId);
  }

  @override
  Future<void> removeFavorite(String volunteeringId) async {
    volunteer.favorites.remove(volunteeringId);
  }

  @override
  Future<List<String>> getFavorites() async {
    return volunteer.favorites;
  }

  @override
  Future<Volunteer?> editUser(
      ContactData contactData, ProfileData profileData) async {
    volunteer.editVolunteer(contactData, profileData, null);
    return volunteer;
  }
}
