// TODO: pasar de enum a string
import 'package:SerManos/models/contact.dart';
import 'package:SerManos/models/profile.dart';

import '../helpers/gender.dart';

class Volunteer {
  final String email;
  final String name;
  final String lastName;
  String? imageUrl;
  DateTime? birthDate;
  Gender? gender;
  String? phone;
  String? secondaryEmail;
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
      this.secondaryEmail,
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
        secondaryEmail: json['secondaryEmail'],
        hasCompletedProfile: json['hasCompletedProfile'],
        volunteering: json['volunteering'],
        isVolunteeringApproved: json['isVolunteeringApproved']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'lastName': lastName,
      'imageUrl': imageUrl,
      'birthDate': birthDate != null ? birthDate!.toIso8601String() : null,
      'gender': gender?.index,
      'phone': phone,
      'secondaryEmail': secondaryEmail,
      'hasCompletedProfile': hasCompletedProfile,
      'volunteering': volunteering,
      'isVolunteeringApproved': isVolunteeringApproved
    };
  }

  void editVolunteer(ContactData contactData, ProfileData profileData) {
    //imageUrl = profileData.imageUrl;
    birthDate = DateTime.tryParse(profileData.dateOfBirth!);
    gender = profileData.gender;
    phone = contactData.phone;
    secondaryEmail = contactData.email;
    if (profileData.gender != null &&
        profileData.dateOfBirth != null &&
        //profileData.imageUrl != null &&
        contactData.phone != null &&
        contactData.email != null) {
      hasCompletedProfile = true;
    }
  }
}
