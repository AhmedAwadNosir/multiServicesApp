import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:multiservices_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:multiservices_app/features/auth/presentation/views/login_view.dart';
import 'package:multiservices_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:multiservices_app/features/auth/states_manager/sende_resset_password_requst/sendressetpasswordemail_cubit.dart';
import 'package:multiservices_app/features/auth/states_manager/sign_in/signin_cubit.dart';
import 'package:multiservices_app/features/auth/states_manager/sign_in_google/signingoogle_cubit.dart';
import 'package:multiservices_app/features/auth/states_manager/sign_up/signup_cubit.dart';
import 'package:multiservices_app/features/home/data/repos/setting_repo_impl.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/edit_note_view.dart';
import 'package:multiservices_app/features/home/presentation/views/about_us_view.dart';
import 'package:multiservices_app/features/home/presentation/views/contact_us.dart';
import 'package:multiservices_app/features/home/presentation/views/home_view.dart';
import 'package:multiservices_app/features/home/states_manager/send_feedback_message/send_feedback_message_cubit.dart';

import 'package:multiservices_app/features/onBoarding/presentation/views/onbaording_view.dart';

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
        OnbaordingView.id: (context) => OnbaordingView(),
        ContactUsView.id:
            (context) => BlocProvider(
              create:
                  (context) => SendFeedbackMessageCubit(
                    settingRepoImpl: SettingRepoImpl(
                      firebaseServieces: FirebaseServieces(),
                      auth: FirebaseAuth.instance,
                    ),
                  ),
              child: ContactUsView(),
            ),
        AboutUsView.id: (context) => AboutUsView(),
        LoginView.id: (context) => LoginView(),
        SignUpView.id:
            (context) => BlocProvider(
              create:
                  (context) => SignupCubit(
                    AuthRepoImpl(firebaseServieces: FirebaseServieces()),
                  ),
              child: SignUpView(),
            ),
        HomeView.id: (context) => HomeView(),
        ForgotPasswordView.id:
            (context) => BlocProvider(
              create:
                  (context) => SendressetpasswordemailCubit(
                    AuthRepoImpl(firebaseServieces: FirebaseServieces()),
                  ),
              child: ForgotPasswordView(),
            ),
      };
}
