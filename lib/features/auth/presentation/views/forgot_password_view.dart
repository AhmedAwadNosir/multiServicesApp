import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/forgot_password_view_body_bloc_consumer.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const id = "ForgotPasswordView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Image.asset(AppImages.appIcon)]),
      body: ForgotPasswordViewBodyBlocConsumer(),
    );
  }
}
