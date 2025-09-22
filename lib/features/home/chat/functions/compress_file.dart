import 'dart:io';
import 'package:archive/archive.dart';

Future<File> compressFile(File originalFile) async {
  final bytes = await originalFile.readAsBytes();

  // Create ZIP archive
  final archive = Archive();
  archive.addFile(
    ArchiveFile(originalFile.uri.pathSegments.last, bytes.length, bytes),
  );

  // Encode the archive
  final encoder = ZipEncoder();
  final compressedData = encoder.encode(archive);

  // Save compressed file
  final compressedFile = File('${originalFile.path}');
  await compressedFile.writeAsBytes(compressedData!);

  return compressedFile;
}
