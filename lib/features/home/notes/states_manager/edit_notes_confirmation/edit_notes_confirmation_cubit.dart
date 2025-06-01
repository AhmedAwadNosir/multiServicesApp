import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/home/notes/data/models/note_modal.dart';
import 'package:multiservices_app/features/home/notes/functions/show_confirmation_dialog.dart';
import 'package:multiservices_app/features/home/notes/states_manager/get_notes/get_notes_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

part 'edit_notes_confirmation_state.dart';

class EditNotesConfirmationCubit extends Cubit<EditNotesConfirmationState> {
  EditNotesConfirmationCubit() : super(EditNotesConfirmationInitial());
  String? noteTitle;
  String? noteDescription;
  void editNoteConfrmation({
    required NoteModal note,
    @required bool? isboobConfarmation,
    required BuildContext context,
  }) {
    if (isboobConfarmation == null) {
      showConfermaTionDailog(
        context,
        dailogTitle: S.of(context).Savechanges,
        cancelButtonName: S.of(context).Discard,
        confirmButtonName: S.of(context).Save,
        confirmationButtonColor: Colors.green,
        cancelButtonColor: Colors.red,
        icon: const Icon(Icons.info, size: 36),
        confirmOnPressed: () {
          note.title =
              noteTitle != null
                  ? (noteTitle!.isNotEmpty ? noteTitle! : note.title)
                  : note.title;
          note.description =
              noteDescription != null
                  ? (noteDescription!.isNotEmpty
                      ? noteDescription!
                      : note.description)
                  : note.description;
          note.save();
          BlocProvider.of<GetNotesCubit>(context).getNotes();
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    } else {
      if (noteTitle == note.title && noteDescription == note.description) {
        Navigator.pop(context);
      } else {
        showConfermaTionDailog(
          context,
          dailogTitle: S.of(context).Areyoursureyouwantdiscardyourchanges,
          cancelButtonName: S.of(context).Discard,
          confirmButtonName: S.of(context).keep,
          confirmationButtonColor: Colors.green,
          cancelButtonColor: Colors.red,
          icon: const Icon(Icons.info, size: 36),
          confirmOnPressed: () {
            note.title =
                noteTitle != null
                    ? (noteTitle!.isNotEmpty ? noteTitle! : note.title)
                    : note.title;
            note.description =
                noteDescription != null
                    ? (noteDescription!.isNotEmpty
                        ? noteDescription!
                        : note.description)
                    : note.description;
            note.save();
            BlocProvider.of<GetNotesCubit>(context).getNotes();
            Navigator.pop(context);
            Navigator.pop(context);
          },
          cancelOnPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      }
    }
  }
}
