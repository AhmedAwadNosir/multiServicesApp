import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/auth/functions/store_user_data_localy.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/sign_in_view_body_google_bloc_consumer.dart';
import 'package:multiservices_app/features/auth/states_manager/sign_in/signin_cubit.dart';
import 'package:multiservices_app/features/home/presentation/views/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const id = "loginview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: [Image.asset(AppImages.appIcon), SizedBox(width: 12)],
      ),
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninFailure) {
            showErrorDialog(context: context, errorMessage: state.errorMessage);
          }
          if (state is SigninSuccess) {
            if (FirebaseAuth.instance.currentUser!.emailVerified) {
              storeUserDataLocaly(userModal: state.userData);
              Navigator.pushReplacementNamed(context, HomeView.id);
            } else {
              showErrorDialog(
                context: context,
                errorMessage:
                    "Your email is not verified go to emialbox and verify your email",
              );
            }
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SigninLoading,
            child: SignInViewBodyGoogleBlocConsumer(),
          );
        },
      ),
    );
  }
}
