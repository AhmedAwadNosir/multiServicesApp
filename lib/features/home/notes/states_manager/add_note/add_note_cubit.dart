import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/core/utils/widgets/app_colors.dart';
import 'package:multiservices_app/features/home/notes/data/models/note_modal.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  int noteColor = AppColors.kcolors[0].toARGB32();
  Future<void> addNote({
    required NoteModal note,
    required BuildContext context,
  }) async {
    emit(AddNoteLoading());
    note.noteColor =
        noteColor ?? Theme.of(context).colorScheme.primary.toARGB32();
    var box = Hive.box<NoteModal>(AppConstants.kNotesBox);
    await box.add(note);
    emit(AddNoteSuccess());
  }
}
