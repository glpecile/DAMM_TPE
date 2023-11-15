import 'package:SerManos/services/volunteering_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/volunteering.dart';

part 'volunteering_by_id_provider.g.dart';

@riverpod
Future<Volunteering> getVolunteeringByIdController(GetVolunteeringByIdControllerRef ref,
    {required String volunteeringId}) async {
  final VolunteeringService volunteeringService = VolunteeringService();
  var volunteering = await volunteeringService.getVolunteeringById(volunteeringId);
  return volunteering!;
}
