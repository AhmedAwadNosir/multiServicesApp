import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:cross_file/cross_file.dart';
import 'package:path_provider/path_provider.dart'; // sometimes needed for XFile

Future<File?> compressImageAsFile(File originalFile) async {
  final dir = await getTemporaryDirectory();
  final targetPath = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

  XFile? xfileResult = await FlutterImageCompress.compressAndGetFile(
    originalFile.absolute.path,
    targetPath,
    minWidth: 1080,
    minHeight: 720,
    quality: 30,
    // you can also specify format if needed
  );

  if (xfileResult == null) {
    // compression failed (maybe permissions, or file not found etc.)
    return null;
  }

  // Convert to File
  File resultFile = File(xfileResult.path);
  return resultFile;
}
