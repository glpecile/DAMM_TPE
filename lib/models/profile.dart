import 'dart:io';

import 'package:SerManos/helpers/gender.dart';

class ProfileData {
  String? dateOfBirth;
  Gender? gender;
  String? imageUrl = 'https://firebasestorage.googleapis.com/v0/b/sermanos-91896.appspot.com/o/volunteerings%2FTecho.jpg?alt=media&token=40c7abbf-2d90-44fe-af3e-f358e35a0559';
  File? imageFile;

  // constructor
  ProfileData({
    this.dateOfBirth,
    this.gender,
    this.imageUrl,
    this.imageFile,
  });
}
