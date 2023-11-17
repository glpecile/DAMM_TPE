import 'dart:convert';

import 'package:SerManos/models/contact.dart';
import 'package:SerManos/models/login.dart';
import 'package:SerManos/models/profile.dart';
import 'package:SerManos/models/register.dart';
import 'package:SerManos/models/volunteer.dart';
import 'package:SerManos/pages/routes/welcome.dart';
import 'package:SerManos/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  late final UserService _userService = UserService();
  late SharedPreferences _sharedPreferences;
  static const _sharedPrefsKey = 'volunteerData';

  Future<void> _saveToPrefs(Volunteer volunteer) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_sharedPrefsKey, json.encode(volunteer.toJson()));
  }

  Future<void> _removeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_sharedPrefsKey);
  }

  Future<void> logIn(LogInData data, var redirect) async {
    try {
      var user = await _userService.logIn(data);
      await _saveToPrefs(user);
      state = AsyncValue.data(user);
    } finally {
      redirect(Welcome.name);
    }
  }

  Future<void> logOut() async {
    await _userService.logOut();
    await _removeFromPrefs();
    state = const AsyncValue.data(null);
  }

  Future<void> register(RegisterData data, var redirect) async {
    try {
      await _userService.signUp(data);
    } on FirebaseAuthException catch (error) {
      throw error.code;
    } finally {
      logIn(LogInData(email: data.email, password: data.password), redirect);
    }
  }

  Future<void> editUser(
      ContactData contactData, ProfileData profileData) async {
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
    //_sharedPreferences.remove(_sharedPrefsKey);

    Volunteer? user;
    if (_sharedPreferences.containsKey(_sharedPrefsKey)) {
      final extractedUserData =
          json.decode(_sharedPreferences.getString(_sharedPrefsKey)!)
              as Map<String, dynamic>;
      user = Volunteer.fromJson(extractedUserData);
    } else {
      user = null;
    }

    return user;
  }

  Future<Volunteer?> getCurrentUser() async {
    return _userService.getCurrentUser();
  }
}
