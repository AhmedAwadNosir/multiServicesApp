import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:multiservices_app/core/services/supabase_services.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';

Future<String> uploadfileGetUrl({
  required File file,
  String? imagePaht,
  String? folderBocketName,
  String? fullPath,
}) async {
  try {
    final SupabaseServices supabaseServices = SupabaseServices();
    final String downloadUrl = await supabaseServices.uploadFile(
      bucketName: folderBocketName ?? AppConstants.storagePacketImages,
      path:
          fullPath ??
          '${imagePaht ?? AppConstants.profileImagesPaht}/${path.basename(file!.path)}/${DateTime.now().millisecond}',
      file: file!,
    );
    return downloadUrl;
  } catch (e) {
    return e.toString();
  }
}
