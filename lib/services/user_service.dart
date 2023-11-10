import 'package:SerManos/models/contact.dart';
import 'package:SerManos/models/login.dart';
import 'package:SerManos/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/volunteer.dart';
import 'analytics_service.dart';
import 'image_service.dart';

class UserService {
  final String collection = 'users';

  AnalyticsService analyticsService;

  UserService(this.analyticsService);

  Future logIn(LogInData data) async {
    if (data.email == null || data.password == null) {
      throw Exception(
          'Email and password are required'); // TODO: manejo de excepciones
    }
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: data.email!, password: data.password!);
    analyticsService.loginEvent(user.user!.uid);
    return user;
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future signUp(
      String name, String lastname, String email, String password) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    String uid = user.user!.uid;
    await FirebaseFirestore.instance.collection(collection).doc(uid).set({
      'email': email,
      'secondaryEmail': email, // TODO: CHECK
      'name': name,
      'lastname': lastname,
      'password': password,
      'hasCompletedProfile': false,
      'isVolunteeringApproved': false
    });
    return user;
  }

  Future<Volunteer?> getCurrentUser() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return getUserById(currentUser.uid);
    }
    return null;
  }

  Future<Volunteer?> getUserById(String userId) async {
    var user = await FirebaseFirestore.instance
        .collection(collection)
        .doc(userId)
        .get();
    if (user.exists) {
      var userData = user.data() as Map<String, dynamic>;
      userData['id'] = userId;
      return Volunteer.fromJson(userData);
    }
    return null;
  }

  void addFavorite(String volunteeringId) async {
    Volunteer? volunteer = await getCurrentUser();
    if (volunteer == null) {
      return;
    }
    volunteer.favorites.add(volunteeringId);
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(volunteer.id)
        .update({'favorites': volunteer.favorites});
  }

  void removeFavorite(String volunteeringId) async {
    Volunteer? volunteer = await getCurrentUser();
    if (volunteer == null) {
      return;
    }
    volunteer.favorites.remove(volunteeringId);
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(volunteer.id)
        .update({'favorites': volunteer.favorites});
  }

  Future<List<String>> getFavorites() async {
    Volunteer? volunteer = await getCurrentUser();
    if (volunteer == null) {
      return [];
    }
    return volunteer.favorites;
  }

  Future<Volunteer?> editUser(
      ContactData contactData, ProfileData profileData) async {
    Volunteer? volunteer = await getCurrentUser();
    if (volunteer == null || profileData.imageFile == null) {
      return null; // TODO: excepcion?
    }
    volunteer.editVolunteer(contactData, profileData);
    final uid = volunteer.id;
    if (profileData.imageFile != null) {
      String? imageUrl =
          await ImageService().uploadUserImage(uid, profileData.imageFile!);
      volunteer.imageUrl = imageUrl;
    }
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(uid)
        .update(volunteer.toJson());
    return volunteer;
  }
}
