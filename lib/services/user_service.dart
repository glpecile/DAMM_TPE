import 'package:SerManos/models/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/volunteer.dart';


class UserService {
  final String collection = 'users';

  Future logIn(LogInData data) async {
    if (data.email == null || data.password == null) {
      throw Exception(
          'Email and password are required'); // TODO: manejo de excepciones
    }
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: data.email!, password: data.password!);
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
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password,
      'hasCompletedProfile': false
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
        .doc(userId.toString())
        .get();
    if (user.exists) {
      var userData = user.data();
      return Volunteer.fromJson(userData!);
    }
    return null;
  }

// TODO: editUser
}
