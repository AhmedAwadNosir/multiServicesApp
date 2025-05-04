import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/features/auth/presentation/views/login_view.dart';
import 'package:multiservices_app/features/home/presentation/views/home_view.dart';
import 'package:multiservices_app/features/onBoarding/presentation/views/onbaording_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void spashNavigationControler(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final bool onboardingIsViewed =
      prefs.getBool(AppConstants.onbaordingIsViewd) ?? false;
  if (onboardingIsViewed) {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushNamed(context, HomeView.id);
    } else {
      Navigator.pushNamed(context, LoginView.id);
    }
  } else {
    Navigator.pushNamed(context, OnbaordingView.id);
  }
}
