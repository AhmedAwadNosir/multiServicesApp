import 'package:flutter/material.dart';
import 'package:multiservices_app/core/theme/theme.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(bool isDarkMode)
    : _themeData = isDarkMode ? AppTheming.darkMode : AppTheming.ligtMode;

  ThemeData get themeData => _themeData;

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (_themeData == AppTheming.ligtMode) {
      _themeData = AppTheming.darkMode;
      prefs.setBool(AppConstants.isDarkMode, true);
    } else {
      _themeData = AppTheming.ligtMode;
      prefs.setBool(AppConstants.isDarkMode, false);
    }
    notifyListeners();
  }
}
