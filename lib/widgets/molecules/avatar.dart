import 'dart:io';

import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.imageUrl, this.imageFile, this.sm = true});

  final String? imageUrl;
  final File? imageFile;
  final bool sm;

  getBackgroundImage() {
    if (imageUrl != null) {
      return NetworkImage(imageUrl!);
    } else if (imageFile != null) {
      return FileImage(imageFile!);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double radius = sm ? 42 : 55;
    radius = imageUrl == null ? 50 : radius;

    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: radius,
      backgroundImage: getBackgroundImage(),
    );
  }
}
