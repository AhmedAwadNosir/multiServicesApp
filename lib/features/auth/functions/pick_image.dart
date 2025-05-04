import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  ImagePicker picker = ImagePicker();
  File? imageFile;
  XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    imageFile = File(image.path);
  }
  return imageFile;
}
