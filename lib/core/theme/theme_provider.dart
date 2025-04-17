import 'package:flutter/material.dart';
import 'package:multiservices_app/core/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = AppTheming.ligtMode;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == AppTheming.ligtMode) {
      _themeData = AppTheming.darkMode;
    } else {
      _themeData = AppTheming.ligtMode;
    }
  }
}
