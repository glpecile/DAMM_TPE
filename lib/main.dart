import 'package:SerManos/helpers/state_logger.dart';
import 'package:SerManos/pages/router.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // If the system can show an authorization request dialog
  if (await AppTrackingTransparency.trackingAuthorizationStatus ==
      TrackingStatus.notDetermined) {
    // Request system's tracking authorization dialog
    await AppTrackingTransparency.requestTrackingAuthorization();
  }

if (await AppTrackingTransparency.trackingAuthorizationStatus ==
      TrackingStatus.denied) {
    // The user has denied access to the system's tracking authorization dialog
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);
    FirebaseAnalytics.instance.setConsent(
        adStorageConsentGranted: false, analyticsStorageConsentGranted: false);
  }
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(const ProviderScope(observers: [StateLogger()], child: SerManosApp()));
}

class SerManosApp extends ConsumerWidget {
  const SerManosApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'SerManos',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: SerManosColors.secondary_10),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      //routerConfig: _router,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
