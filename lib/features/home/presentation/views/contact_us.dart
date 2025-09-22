import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/presentation/widgets/contact_us_view_body.dart';
import 'package:multiservices_app/features/home/states_manager/send_feedback_message/send_feedback_message_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});
  static const id = "contactUs";

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  late TextEditingController nametextEditingController;
  late TextEditingController emailtextEditingController;
  late TextEditingController messagetextEditingController;
  @override
  void initState() {
    nametextEditingController = TextEditingController();
    emailtextEditingController = TextEditingController();
    messagetextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nametextEditingController.dispose();
    emailtextEditingController.dispose();
    messagetextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).ContactUs), elevation: 4),
      body: BlocConsumer<SendFeedbackMessageCubit, SendFeedbackMessageState>(
        listener: (context, state) {
          if (state is SendFeedbackMessageFailure) {
            showErrorDialog(context: context, errorMessage: state.errorMessage);
          }
          if (state is SendFeedbackMessageSuccess) {
            nametextEditingController.clear();
            emailtextEditingController.clear();
            messagetextEditingController.clear();
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SendFeedbackMessageLoading,
            color: Theme.of(context).colorScheme.primary,
            child: ContactUsViewBody(
              nametextEditingControler: nametextEditingController,
              emailtextEditingControler: emailtextEditingController,
              messagetextEditingControler: messagetextEditingController,
            ),
          );
        },
      ),
    );
  }
}
