import 'package:SerManos/models/volunteering.dart';
import 'package:SerManos/services/user_service.dart';
import '../services/volunteering_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_volunteering_controller.g.dart';

@riverpod
class UserVolunteeringController extends _$UserVolunteeringController {
  final VolunteeringService _volunteeringService = VolunteeringService();
  final UserService _userService = UserService();

  Future<Volunteering?> _getUserVolunteering() async {
    var user = await _userService.getCurrentUser();
    if (user != null && user.volunteering != null) {
      var volunteering =
          await _volunteeringService.getVolunteeringById(user.volunteering!);
      if (volunteering != null) {
        volunteering.isVolunteeringApproved = user.isVolunteeringApproved;
        volunteering.hasCompletedProfile = user.hasCompletedProfile;
        return volunteering;
      }
      return null;
    }
    return null;
  }

  Future<void> applyToVolunteering(String volunteeringId) async {
    var volunteering = await _volunteeringService.getVolunteeringById(volunteeringId);
    if (volunteering != null) {
      await _volunteeringService.applyVolunteering(volunteeringId);
      volunteering.isVolunteeringApproved = false;
      state = AsyncValue.data(volunteering);
    }
  }

  Future<void> leaveVolunteering(String volunteeringId) async {
    var volunteering = await _volunteeringService.getVolunteeringById(volunteeringId);
    if (volunteering != null) {
      await _volunteeringService.leaveVolunteering(volunteeringId);
      volunteering.isVolunteeringApproved = false;
      state = const AsyncValue.data(null);
    }
  }

  @override
  Future<Volunteering?> build() async {
    return await _getUserVolunteering();
  }
}
