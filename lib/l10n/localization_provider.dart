import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider with ChangeNotifier {
  Locale _locale;

  LocalizationProvider(String lang) : _locale = Locale(lang);
  Locale get locale => _locale;

  void toggleLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    if (_locale == Locale('ar')) {
      _locale = Locale('en');
      prefs.setString(AppConstants.lang, 'en');
    } else {
      _locale = Locale('ar');
      prefs.setString(AppConstants.lang, 'ar');
    }
    notifyListeners();
  }
}
