import 'dart:developer';

import 'package:SerManos/models/contact.dart';
import 'package:SerManos/models/login.dart';
import 'package:SerManos/models/profile.dart';
import 'package:SerManos/models/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/volunteer.dart';
import 'analytics_service.dart';
import 'image_service.dart';

class UserService {
  final String collection = 'users';

  FirebaseFirestore? _firestore;
  AnalyticsService? analyticsService;
  ImageService? imageService;

  UserService([this._firestore, this.analyticsService]) {
    _firestore ??= FirebaseFirestore.instance;
    analyticsService ??= AnalyticsService();
    imageService ??= ImageService();
  }

  Future logIn(LogInData data) async {
    if (data.email == null || data.password == null) {
      throw Exception(
          'Email and password are required'); // TODO: manejo de excepciones
    }
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: data.email!, password: data.password!);
    analyticsService!.loginEvent(user.user!.uid);
    return user;
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future signUp(RegisterData registerData) async {
    log(registerData.firstName);
    log(registerData.lastName);
    log(registerData.email);
    log(registerData.password);
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: registerData.email, password: registerData.password);
    String uid = user.user!.uid;
    await _firestore!.collection(collection).doc(uid).set({
      'email': registerData.email,
      'secondaryEmail': registerData.email, // TODO: CHECK
      'name': registerData.firstName,
      'lastname': registerData.lastName,
      'password': registerData.password,
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
    var user = await _firestore!.collection(collection).doc(userId).get();
    if (user.exists) {
      var userData = user.data() as Map<String, dynamic>;
      userData['id'] = userId;
      return Volunteer.fromJson(userData);
    }
    return null;
  }

  Future<void> addFavorite(String volunteeringId) async {
    Volunteer? volunteer = await getCurrentUser();
    if (volunteer == null) {
      return;
    }
    volunteer.favorites.add(volunteeringId);
    await _firestore!
        .collection(collection)
        .doc(volunteer.id)
        .update({'favorites': volunteer.favorites});
  }

  Future<void> removeFavorite(String volunteeringId) async {
    Volunteer? volunteer = await getCurrentUser();
    if (volunteer == null) {
      return;
    }
    volunteer.favorites.remove(volunteeringId);
    await _firestore!
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
          await imageService!.uploadUserImage(uid, profileData.imageFile!);
      volunteer.imageUrl = imageUrl;
    }
    await _firestore!
        .collection(collection)
        .doc(uid)
        .update(volunteer.toJson());
    return volunteer;
  }
}
