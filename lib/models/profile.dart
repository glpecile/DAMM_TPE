import 'dart:io';

import 'package:SerManos/helpers/gender.dart';

class ProfileData {
  String? dateOfBirth;
  // FIXME: gender or just string?
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
}
