import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/notes/data/models/note_modal.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModal});
  static const id = "editNoteView";
  final NoteModal noteModal;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {},
      // (didPop) async {
      //   //   BlocProvider.of<EditConfirmationCubit>(context).editNoteConfrmation(
      //   //       note: noteModal, isboobConfarmation: true, context: context);
      // },
      child: SafeArea(
        child: Scaffold(body: EditNoteViewBody(noteModal: noteModal)),
      ),
    );
  }
}
