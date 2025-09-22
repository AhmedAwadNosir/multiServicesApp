import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:multiservices_app/core/services/supabase_services.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> uploadfileGetUrl({
  required File file,
  String? imagePaht,
  String? folderBocketName,
  String? fullPath,
}) async {
  final storage = Supabase.instance.client.storage;
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
  } on StorageException catch (e) {
    // StorageException is the type of error Supabase gives (adjust if different)
    if (e.statusCode == "409" || e.message.contains("already exists")) {
      // The file already exists. Return its URL.
      final publicUrl = storage
          .from(folderBocketName ?? AppConstants.storagePacketImages)
          .getPublicUrl(
            fullPath ??
                '${imagePaht ?? AppConstants.profileImagesPaht}/${path.basename(file!.path)}/${DateTime.now().millisecond}',
          );
      return publicUrl;
    }
    // rethrow or handle other errors
    rethrow;
  } catch (e) {
    return e.toString();
  }
}
