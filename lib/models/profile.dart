import 'dart:io';

import 'package:SerManos/helpers/gender.dart';

class ProfileData {
  String? dateOfBirth;
  Gender? gender;
  String? imageUrl;
  File? imageFile;

  // constructor
  ProfileData({
    this.dateOfBirth,
    this.gender,
    this.imageUrl,
    this.imageFile,
  });

  bool get isValid => [
        imageUrl,
        gender,
        dateOfBirth,
      ].every((element) => element != null);
}
