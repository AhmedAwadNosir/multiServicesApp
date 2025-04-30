import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

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

  // this is used if i have more than two languages deflut is en when i chang lang
  // lang defult is new lang
  void toggleLanguageSpicificLanguage({required String lang}) async {
    final prefs = await SharedPreferences.getInstance();
    _locale = Locale(lang);
    prefs.setString(AppConstants.lang, lang);
    notifyListeners();
  }
}
