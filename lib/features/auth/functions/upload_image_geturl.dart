import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:multiservices_app/core/services/supabase_services.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';

Future<String> uploadProfilegetUrl({required File profileImage}) async {
  try {
    final SupabaseServices supabaseServices = SupabaseServices();
    final String downloadUrl = await supabaseServices.uploadFile(
      bucketName: AppConstants.storagePacket,
      path:
          'ProfileImages/${path.basename(profileImage!.path)}/${DateTime.now().millisecond}',
      file: profileImage!,
    );
    return downloadUrl;
  } catch (e) {
    return e.toString();
  }
}
