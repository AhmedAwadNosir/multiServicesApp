import 'dart:io';
import 'package:file_picker/file_picker.dart';

Future<PlatformFile> fileToPlatformFile(File file) async {
  // Get file information
  final fileStat = await file.stat();
  final bytes = await file.readAsBytes();
  final fileName = file.path.split('/').last;

  return PlatformFile(
    name: fileName,
    path: file.path,
    size: fileStat.size,
    bytes: bytes,
  );
}
