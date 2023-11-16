// TODO: pasar de enum a string
import 'dart:developer';

import 'package:SerManos/models/contact.dart';
import 'package:SerManos/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../helpers/gender.dart';
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

  //bool hasCompletedProfile;
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
      //required this.hasCompletedProfile,
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
        //hasCompletedProfile: json['hasCompletedProfile'],
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
      'birthDate': birthDate != null ? dateFormat.format(birthDate!) : null,
      'gender': gender?.index,
      'phone': phone,
      'secondaryEmail': secondaryEmail,
      //'hasCompletedProfile': hasCompletedProfile,
      'volunteering': volunteering,
      'isVolunteeringApproved': isVolunteeringApproved
    };
  }

  void editVolunteer(
      ContactData contactData, ProfileData profileData, String? imageUrl) {
    imageUrl = imageUrl ?? profileData.imageUrl;
    log("A punto de parsear para editar");
    log(profileData.dateOfBirth!);

    // Define el formato de fecha que estás utilizando
    birthDate = dateFormat.parse(profileData.dateOfBirth!);

    log(birthDate!.toIso8601String());
    gender = profileData.gender;
    phone = contactData.phone;
    secondaryEmail = contactData.email;

    /*
    if (profileData.gender != null &&
        profileData.dateOfBirth != null &&
        //profileData.imageUrl != null &&
        contactData.phone != null &&
        contactData.email != null) {
      hasCompletedProfile = true;
    }
     */
  }
}
