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
import 'package:multiservices_app/features/home/presentation/views/home_view.dart';
import 'package:multiservices_app/features/onBoarding/presentation/views/onbaording_view.dart';

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
        OnbaordingView.id: (context) => OnbaordingView(),
        LoginView.id:
            (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) => SigninCubit(
                        AuthRepoImpl(firebaseServieces: FirebaseServieces()),
                      ),
                ),
                BlocProvider(
                  create:
                      (context) => SigningoogleCubit(
                        AuthRepoImpl(firebaseServieces: FirebaseServieces()),
                      ),
                ),
              ],
              child: LoginView(),
            ),
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
