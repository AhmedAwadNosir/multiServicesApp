import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

storeUserDataLocaly({required UserModal userModal}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(AppConstants.userNameKey, userModal.userName);
  prefs.setString(AppConstants.profileImageKey, userModal.profilImageLink);
}
