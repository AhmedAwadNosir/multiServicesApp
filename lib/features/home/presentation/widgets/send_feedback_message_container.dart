import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/functions/build_outlinedInput_border.dart';
import 'package:multiservices_app/features/home/data/models/feedback_message_modal.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/edit_note_custom_text_form_field.dart';
import 'package:multiservices_app/features/home/states_manager/send_feedback_message/send_feedback_message_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class SendFeedBackMessageContainer extends StatelessWidget {
  const SendFeedBackMessageContainer({
    super.key,
    required this.nametextEditingControler,
    required this.emailtextEditingControler,
    required this.messagetextEditingControler,
  });

  final TextEditingController? nametextEditingControler;
  final TextEditingController? emailtextEditingControler;
  final TextEditingController? messagetextEditingControler;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).Name),
            SizedBox(height: 4),
            EditNoteCustomTextFormFilled(
              textEditingController: nametextEditingControler,
              hint: S.of(context).Name,
              maxLines: 1,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              hintFontSize: 18,
              enabledBorder: buildOutlinedInputBodreder(
                Theme.of(context).colorScheme.secondary,
              ),
              foucsedBorder: buildOutlinedInputBodreder(
                Theme.of(context).colorScheme.tertiary,
              ),
            ),
            SizedBox(height: 12),
            Text(S.of(context).email),
            SizedBox(height: 4),
            EditNoteCustomTextFormFilled(
              textEditingController: emailtextEditingControler,
              hint: S.of(context).email,
              maxLines: 1,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              hintFontSize: 18,
              enabledBorder: buildOutlinedInputBodreder(
                Theme.of(context).colorScheme.secondary,
              ),
              foucsedBorder: buildOutlinedInputBodreder(
                Theme.of(context).colorScheme.tertiary,
              ),
            ),
            SizedBox(height: 12),
            Text(S.of(context).message),
            SizedBox(height: 4),
            EditNoteCustomTextFormFilled(
              textEditingController: messagetextEditingControler,

              hint: S.of(context).message,
              maxLines: 5,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              hintFontSize: 18,
              enabledBorder: buildOutlinedInputBodreder(
                Theme.of(context).colorScheme.secondary,
              ),
              foucsedBorder: buildOutlinedInputBodreder(
                Theme.of(context).colorScheme.tertiary,
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    BlocProvider.of<SendFeedbackMessageCubit>(
                      context,
                    ).sendFedbackMessage(
                      feedbackMessage: FeedbackMessageModla(
                        name: nametextEditingControler!.value.text,
                        email: emailtextEditingControler!.value.text,
                        message: messagetextEditingControler!.value.text,
                        senderDocId: FirebaseAuth.instance.currentUser!.uid,
                      ),
                    );
                  },
                  child: Text(
                    S.of(context).SendMessage,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
