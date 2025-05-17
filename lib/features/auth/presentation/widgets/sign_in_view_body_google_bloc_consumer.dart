import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/auth/functions/store_user_data_localy.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/login_view_body.dart';
import 'package:multiservices_app/features/auth/states_manager/sign_in_google/signingoogle_cubit.dart';
import 'package:multiservices_app/features/home/presentation/views/home_view.dart'
    show HomeView;

class SignInViewBodyGoogleBlocConsumer extends StatelessWidget {
  const SignInViewBodyGoogleBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigningoogleCubit, SigningoogleState>(
      listener: (context, state) {
        if (state is SigningoogleFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
        if (state is SigningoogleSuccess) {
          storeUserDataLocaly(userModal: state.userModal);
          Navigator.pushReplacementNamed(context, HomeView.id);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SigningoogleLoading,
          child: LoginViewBody(),
        );
      },
    );
  }
}
