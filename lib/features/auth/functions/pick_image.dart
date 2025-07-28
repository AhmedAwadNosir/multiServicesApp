import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickGallaryImage() async {
  ImagePicker picker = ImagePicker();
  File? imageFile;
  XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    imageFile = File(image.path);
  }
  return imageFile;
}

Future<File?> pickCameraImage() async {
  ImagePicker picker = ImagePicker();
  File? imageFile;
  XFile? image = await picker.pickImage(source: ImageSource.camera);
  if (image != null) {
    imageFile = File(image.path);
  }
  return imageFile;
}
