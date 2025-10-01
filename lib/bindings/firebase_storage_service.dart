import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RFirebaseStorageService extends GetxController{
  static RFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  /// Upload Local Assets from IDE
 ///  Returns a Uint8List containing image data.
  Future<Uint8List> getImageFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      // Handle exception gracefully
      throw 'Error loading image data: $e';
    }
  }

  /// Upload Image using image-data on cloud Firebase storage
 /// Returns the download URL of the uploaded image.

  Future<String> uploadingImageData(String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {

    }
  }
}