import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  Future<void> applyToVolunteeringEvent(String volunteeringId, String volunteerId) async {
    log("ABOUT TO APPLY TO VOLUNTEERING");
    await FirebaseAnalytics.instance.logEvent(
        name: "applied_to_volunteering",
        parameters: {"volunteering": volunteeringId, "volunteer": volunteerId});
  }

  Future<void> leaveVolunteeringEvent(String volunteeringId, String volunteerId) async {
    log("ABOUT TO LEAVE VOLUNTEERING");
    await FirebaseAnalytics.instance.logEvent(
        name: "leaft_volunteering",
        parameters: {"volunteering": volunteeringId, "volunteer": volunteerId});
  }

  Future<void> loginEvent(String volunteerId) async {
    await FirebaseAnalytics.instance.logEvent(
        name: "login", parameters: {"volunteer": volunteerId});
  }
}