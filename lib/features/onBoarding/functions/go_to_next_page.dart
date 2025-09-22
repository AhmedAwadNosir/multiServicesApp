import 'package:flutter/widgets.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/features/auth/presentation/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void goToNextPage({
  required PageController pageControler,
  required BuildContext context,
  required int onboardingLength,
}) async {
  final prefs = await SharedPreferences.getInstance();
  if (pageControler.page!.ceil() == onboardingLength) {
    await prefs.setBool(AppConstants.onbaordingIsViewd, true);
    Navigator.pushReplacementNamed(context, LoginView.id);
  } else {
    pageControler.nextPage(
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }
}
