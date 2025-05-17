import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserModal> getUserData() async {
  String? userName;
  String? userPhoto;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  userName = prefs.getString(AppConstants.userNameKey);
  userPhoto = prefs.getString(AppConstants.profileImageKey);
  return UserModal(userName: userName ?? "", profilImageLink: userPhoto!);
}
