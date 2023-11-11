import 'package:SerManos/models/login.dart';
import 'package:SerManos/models/register.dart';
import 'package:SerManos/models/volunteer.dart';
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

  Future<void> logIn(LogInData data) async {
    var user = await _userService.logIn(data);
  }

  Future<void> logOut() async {
    await _userService.logOut();
  }

  Future<void> register(RegisterData data) async {
    try {
      var user = await _userService.signUp(
          data.firstName, data.lastName, data.email, data.password);
    } on FirebaseAuthException catch (error) {
      throw error.code;
    }
  }

  @override
  FutureOr<Volunteer> build() {
    var user = _userService.getCurrentUser();
    throw user;
  }
}
