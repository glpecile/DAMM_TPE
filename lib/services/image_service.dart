import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class ImageService {
  Future<String?> uploadUserImage(String uid, File imageFile) async {
    try {
      //TODO: analytics?
      // https://firebase.flutter.dev/docs/storage/upload-files
      final userRef = FirebaseStorage.instance.ref().child('volunteer_images');
      final storageRef = userRef.child(uid);
      final uploadTask = await storageRef.putFile(imageFile);
      String downloadUrl = await uploadTask.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      // TODO: exception?
      return null;
    }
  }
}
