import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:multiservices_app/core/functions/show_awesome_dialog.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/forgot_password_view_body.dart';
import 'package:multiservices_app/features/auth/states_manager/sende_resset_password_requst/sendressetpasswordemail_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class ForgotPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgotPasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      SendressetpasswordemailCubit,
      SendressetpasswordemailState
    >(
      listener: (context, state) {
        if (state is SendressetpasswordemailFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
        if (state is SendressetpasswordemailSuccess) {
          showAwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            dialogTitle: "about",
            dialogDesc:
                S
                    .of(context)
                    .Wesentressetpasswordemailtoyouremailboxgoandressetyourpassword,

            btnOkName: "Ok",
            btnOkOnPress: () {
              Navigator.pop(context);
            },
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SendressetpasswordemailLoading,
          color: Colors.deepPurpleAccent,
          child: ForgotPasswordViewBody(),
        );
      },
    );
  }
}
