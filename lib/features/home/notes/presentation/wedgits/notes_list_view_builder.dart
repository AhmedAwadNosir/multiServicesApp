import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/notes/data/models/note_modal.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/custom_note_card.dart';

class NotesListViewBuilder extends StatelessWidget {
  const NotesListViewBuilder({super.key, required this.notes});
  final List<NoteModal> notes;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomNoteCard(noteModal: notes[index]),
        );
      },
    );
  }
}
