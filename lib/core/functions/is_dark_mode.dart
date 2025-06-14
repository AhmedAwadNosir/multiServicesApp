import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isDarkMode() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  return isDarkMode;
}
