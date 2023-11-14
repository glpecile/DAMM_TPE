import 'package:SerManos/models/volunteering.dart';
import 'package:SerManos/services/user_service.dart';
import '../services/volunteering_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_volunteering_controller.g.dart';

@riverpod
class UserVolunteeringController extends _$UserVolunteeringController {
  final VolunteeringService _volunteeringService = VolunteeringService();
  final UserService _userService = UserService();

  // TODO: capaz usar todo con refs

  Future<Volunteering?> _getUserVolunteering() async {
    var user = await _userService.getCurrentUser();
    if (user != null && user.volunteering != null) {
      var volunteering =
          await _volunteeringService.getVolunteeringById(user.volunteering!);
      if (volunteering != null) {
        volunteering.isVolunteeringApproved = user.isVolunteeringApproved;
        return volunteering;
      }
      return null;
    }
    return null;
  }

  Future<void> applyToVolunteering(String volunteeringId) async {
    var volunteering =
        await _volunteeringService.getVolunteeringById(volunteeringId);
    if (volunteering != null) {
      await _volunteeringService.applyVolunteering(volunteeringId);
      volunteering.isVolunteeringApproved = false;
      state = AsyncValue.data(volunteering);
    }
  }

  @override
  Future<Volunteering?> build() async {
    return await _getUserVolunteering();
  }
}
