import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/auth/functions/store_user_data_localy.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/signUp_view_body.dart';
import 'package:multiservices_app/features/auth/states_manager/sign_up/signup_cubit.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) async {
        if (state is SignupFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
        if (state is SignupSuccess) {
          final FirebaseServieces _firebaseServieces = FirebaseServieces();
          await _firebaseServieces.sendEmailVerification();
          await storeUserDataLocaly(userModal: state.userModal);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading,
          child: SignupViewBody(),
        );
      },
    );
  }
}
