import 'dart:io';
import 'package:file_picker/file_picker.dart';

Future<PlatformFile?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'doc', 'docx', 'xlsx', 'ppt'],
    allowMultiple: false,
  );
  PlatformFile? docmentFile;
  if (result != null) {
    docmentFile = result.files.single;
  }

  return docmentFile;
}
