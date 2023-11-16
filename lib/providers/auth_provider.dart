import 'dart:convert';

import 'package:SerManos/models/login.dart';
import 'package:SerManos/models/profile.dart';
import 'package:SerManos/models/register.dart';
import 'package:SerManos/models/volunteer.dart';
import 'package:SerManos/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/contact.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  late final UserService _userService = UserService();
  late SharedPreferences _sharedPreferences;
  static const _sharedPrefsKey = 'volunteerData';
  Logger logger = Logger();

  Future<void> _saveToPrefs(Volunteer volunteer) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_sharedPrefsKey, json.encode(volunteer.toJson()));
  }

  Future<void> _removeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_sharedPrefsKey);
  }

  Future<void> logIn(LogInData data, void redirect) async {
    try {
      var user = await _userService.logIn(data);
      await _saveToPrefs(user);
      state = AsyncValue.data(user);
    } finally {
      redirect;
    }
  }

  Future<void> logOut() async {
    await _userService.logOut();
    await _removeFromPrefs();
    state = const AsyncValue.data(null);
  }

  Future<void> register(RegisterData data) async {
    try {
      await _userService.signUp(data);
    } on FirebaseAuthException catch (error) {
      throw error.code;
    }
  }

  Future<void> editUser(ContactData contactData, ProfileData profileData) async {
    try {
      var user = await _userService.editUser(contactData, profileData);
      await _saveToPrefs(user!);
      state = AsyncValue.data(user);
    } on FirebaseAuthException catch (error) {
      throw error.code;
    }
  }

  @override
  Future<Volunteer?> build() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    //_persistenceRefreshLogic();

    Volunteer? user;
    if (_sharedPreferences.containsKey(_sharedPrefsKey)) {
      final extractedUserData =
          json.decode(_sharedPreferences.getString(_sharedPrefsKey)!)
              as Map<String, dynamic>;
      extractedUserData['birthDate'] =
          DateTime.tryParse(extractedUserData['birthDate']) != null
              ? Timestamp.fromDate(
                  DateTime.parse(extractedUserData['birthDate']))
              : null;
      logger.i(extractedUserData);
      user = Volunteer.fromJson(extractedUserData);
    } else {
      //user = await _userService.getCurrentUser();
      //if (user != null) {
      //  await _saveToPrefs(user);
      //}
      user = null;
    }

    return user;
  }

  void _persistenceRefreshLogic() {
    ref.listenSelf((_, next) {
      if (next.isLoading) return;
      if (next.hasError) {
        _sharedPreferences.remove(_sharedPrefsKey);
        return;
      }
      if (next.value != null) {
        _sharedPreferences.setString(
            _sharedPrefsKey, json.encode(next.value!.toJson()));
      } else {
        _sharedPreferences.remove(_sharedPrefsKey);
      }
    });
  }

  Future<Volunteer?> getCurrentUser() async {
    return _userService.getCurrentUser();
  }
}
