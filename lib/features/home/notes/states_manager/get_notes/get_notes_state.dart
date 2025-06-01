part of 'get_notes_cubit.dart';

@immutable
sealed class GetNotesState {}

final class GetNotesInitial extends GetNotesState {}

final class GetNotesLoading extends GetNotesState {}

final class GetNotesSuccess extends GetNotesState {
  final List<NoteModal> nots;

  GetNotesSuccess({required this.nots});
}
