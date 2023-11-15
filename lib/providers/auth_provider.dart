import 'dart:ui';

import 'package:SerManos/models/login.dart';
import 'package:SerManos/models/register.dart';
import 'package:SerManos/models/volunteer.dart';
import 'package:SerManos/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  late final UserService _userService = UserService();
  late SharedPreferences _sharedPreferences;
  static const _sharedPrefsKey = 'volunteerData';
  Logger logger = Logger();

  Future<void> logIn(LogInData data, void redirect) async {
    try{
      var user = await _userService.logIn(data);
      state = AsyncValue.data(user);
    } finally{
      redirect;
    }
  }

  Future<void> logOut() async {
    await _userService.logOut();
    state = const AsyncValue.data(null);
  }

  Future<void> register(RegisterData data) async {
    try {
      var user = await _userService.signUp(data);
    } on FirebaseAuthException catch (error) {
      throw error.code;
    }
  }

  @override
  Future<Volunteer?> build() async {
    var user = await _userService.getCurrentUser();
    return user;
  }

  Future<Volunteer?> getCurrentUser() async {
    return _userService.getCurrentUser();
  }

}
