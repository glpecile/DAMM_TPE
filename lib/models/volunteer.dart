// TODO: pasar de enum a string
import '../helpers/gender.dart';

class Volunteer {
  final String email;
  final String name;
  final String lastName;
  String? imageUrl;
  DateTime? birthDate;
  Gender? gender;
  String? phone;
  bool? hasCompletedProfile;
  String? volunteering; // You can only have one volunteering
  bool? isVolunteeringApproved;

  Volunteer(
      {required this.email,
      required this.name,
      required this.lastName,
      this.imageUrl,
      this.birthDate,
      this.gender,
      this.phone,
      this.hasCompletedProfile,
      this.volunteering,
      this.isVolunteeringApproved});

  // https://stackoverflow.com/questions/53886304/understanding-factory-constructor-code-example-dart
  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
        email: json['email'],
        name: json['name'],
        lastName: json['lastName'],
        imageUrl: json['imageUrl'],
        birthDate: DateTime.tryParse(json['bitrhDate']),
        gender: json['gender'] != null ? Gender.values[json['gender']] : null,
        phone: json['phone'],
        hasCompletedProfile: json['hasCompletedProfile'],
        volunteering: json['volunteering'],
        isVolunteeringApproved: json['isVolunteeringApproved']);
  }
}
