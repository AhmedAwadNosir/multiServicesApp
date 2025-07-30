import 'dart:io';

import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/features/auth/functions/upload_image_geturl.dart';
import 'package:record/record.dart';

Future<String?> stopRecordandUploaded({required AudioRecorder record}) async {
  String? finalPath = await record.stop();
  String downloadUrl = '';
  if (finalPath != null) {
    downloadUrl = await uploadfileGetUrl(
      file: File(finalPath),
      imagePaht: AppConstants.recordsPaht,
      folderBocketName: AppConstants.storagePacketrecords,
    );
  }
  return downloadUrl;
}
