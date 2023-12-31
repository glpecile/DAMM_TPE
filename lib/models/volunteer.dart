import 'package:SerManos/helpers/gender.dart';
import 'package:SerManos/models/contact.dart';
import 'package:SerManos/models/profile.dart';
import 'package:intl/intl.dart';

class Volunteer {
  final String id;
  final String email;
  final String name;
  final String lastName;
  final List<String> favorites;
  String? imageUrl;
  DateTime? birthDate;
  Gender? gender;
  String? phone;
  String? secondaryEmail;

  String? volunteering; // You can only have one volunteering
  bool isVolunteeringApproved;
  static final DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  bool get hasCompletedProfile => [
        imageUrl,
        birthDate,
        gender,
        phone,
        secondaryEmail
      ].every((element) => element != null);

  Volunteer(
      {required this.id,
      required this.email,
      required this.name,
      required this.lastName,
      required this.favorites,
      this.imageUrl,
      this.birthDate,
      this.gender,
      this.phone,
      this.secondaryEmail,
      this.volunteering,
      required this.isVolunteeringApproved});

  // https://stackoverflow.com/questions/53886304/understanding-factory-constructor-code-example-dart
  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        lastName: json['lastName'],
        favorites: List<String>.from(json['favorites']),
        imageUrl: json['imageUrl'],
        birthDate: json['birthDate'] != null
            ? dateFormat.parse(json['birthDate'])
            : null,
        gender: json['gender'] != null ? Gender.values[json['gender']] : null,
        phone: json['phone'],
        secondaryEmail: json['secondaryEmail'],
        volunteering: json['volunteering'],
        isVolunteeringApproved: json['isVolunteeringApproved']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'lastName': lastName,
      'favorites': favorites,
      'imageUrl': imageUrl,
      'birthDate': getBirthDate,
      'gender': gender?.index,
      'phone': phone,
      'secondaryEmail': secondaryEmail,
      'volunteering': volunteering,
      'isVolunteeringApproved': isVolunteeringApproved
    };
  }

  get getBirthDate => birthDate != null ? dateFormat.format(birthDate!) : null;

  void editVolunteer(
      ContactData contactData, ProfileData profileData, String? imageUrl) {
    imageUrl = imageUrl ?? profileData.imageUrl;

    // Define el formato de fecha que estás utilizando
    birthDate = dateFormat.parse(profileData.dateOfBirth!);

    gender = profileData.gender;
    phone = contactData.phone;
    secondaryEmail = contactData.email;
  }
}
