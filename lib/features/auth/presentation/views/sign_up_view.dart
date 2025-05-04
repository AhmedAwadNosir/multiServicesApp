import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/sign_up_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const id = "signUpview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset(AppImages.appIcon), SizedBox(width: 12)],
      ),
      body: SignUpViewBodyBlocConsumer(),
    );
  }
}
