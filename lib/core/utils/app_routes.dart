import 'package:flutter/material.dart';
import 'package:multiservices_app/features/auth/login/presentation/views/login_view.dart';
import 'package:multiservices_app/features/onBoarding/presentation/views/onbaording_view.dart';

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
        OnbaordingView.id: (context) => OnbaordingView(),
        LoginView.id: (context) => LoginView(),
      };
}
