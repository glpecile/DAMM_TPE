import 'package:url_launcher/url_launcher.dart';

String constructGoogleMapsUrl(final double lat, final double lng) {
  return 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
}

void openOnGoogleMaps(final double lat, final double lng) async {
  String apiUrl = constructGoogleMapsUrl(lat, lng);

  if (await canLaunchUrl(Uri.parse(apiUrl))) {
    await launchUrl(
      Uri.parse(apiUrl),
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch Google Maps with the provided coordinates: $lat, $lng';
  }
}
