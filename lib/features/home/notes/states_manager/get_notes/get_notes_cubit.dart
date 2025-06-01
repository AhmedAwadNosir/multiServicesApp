import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/features/home/notes/data/models/note_modal.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());
  void getNotes() {
    emit(GetNotesLoading());
    var box = Hive.box<NoteModal>(AppConstants.kNotesBox);
    List<NoteModal> notes = box.values.toList();
    emit(GetNotesSuccess(nots: notes));
  }
}
