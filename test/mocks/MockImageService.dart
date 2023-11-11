import 'dart:io';

import 'package:SerManos/services/image_service.dart';

class MockImageService extends ImageService {
  @override
  Future<String> uploadUserImage(String uid, File image) async {
    return 'fakeUrl';
  }
}
