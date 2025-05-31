import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/notes/data/models/note_modal.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/custom_search_button.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/edit_note_custom_text_form_field.dart';
import 'package:multiservices_app/generated/l10n.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModal});
  final NoteModal noteModal;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  void initState() {
    // BlocProvider.of<EditConfirmationCubit>(context).noteTitle =
    //     widget.noteModal.title;
    // BlocProvider.of<EditConfirmationCubit>(context).noteDescription =
    //     widget.noteModal.description;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  ontap: () {
                    // BlocProvider.of<EditConfirmationCubit>(context)
                    //     .editNoteConfrmation(
                    //         note: widget.noteModal,
                    //         isboobConfarmation: true,
                    //         context: context);
                    Navigator.pop(context);
                  },
                  icon: Icons.chevron_left_outlined,
                ),
                CustomIconButton(
                  ontap: () {
                    // BlocProvider.of<EditConfirmationCubit>(context)
                    //     .editNoteConfrmation(
                    //         note: widget.noteModal, context: context);
                  },
                  icon: Icons.save,
                ),
              ],
            ),
            const SizedBox(height: 16),
            //title text field
            EditNoteCustomTextFormFilled(
              onChanged: (value) {
                // BlocProvider.of<EditConfirmationCubit>(context).noteTitle =
                //     value;
              },
              hint: S.of(context).Title,
              intialValue: widget.noteModal.title,
              fontSize: 33,
              hintFontSize: 48,
            ),
            const SizedBox(height: 12),
            EditNoteCustomTextFormFilled(
              onChanged: (value) {
                // BlocProvider.of<EditConfirmationCubit>(context)
                //     .noteDescription = value;
              },
              hint: S.of(context).Typesomething,
              intialValue: widget.noteModal.description,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
