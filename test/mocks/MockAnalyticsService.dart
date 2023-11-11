import 'package:SerManos/services/analytics_service.dart';

class MockAnalyticsService extends AnalyticsService {
  Future<void> logEvent() async {
    return Future.value();
  }

  @override
  Future<void> applyToVolunteeringEvent(String volunteeringId, String volunteerId) async {
    return logEvent();
  }

  @override
  Future<void> leaveVolunteeringEvent(String volunteeringId, String volunteerId) async {
    return logEvent();
  }

  @override
  Future<void> loginEvent(String volunteerId) async {
    return logEvent();
  }
}
