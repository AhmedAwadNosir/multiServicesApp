import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/notes/data/models/note_modal.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/no_notes_found.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/custom_note_card.dart';
import 'package:multiservices_app/generated/l10n.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  List<NoteModal> notes = [
    NoteModal(
      title: "ahmed awad mohaemd ",
      description: "ahdfkljahidfhluahdfjkhlkahdjlhalhla",
      date: "31/5/2025",
    ),
    NoteModal(
      title: "ahmed awad mohaemd ",
      description: "ahdfkljahidfhluahdfjkhlkahdjlhalhla",
      date: "31/5/2025",
    ),
    NoteModal(
      title: "ahmed awad mohaemd ",
      description: "ahdfkljahidfhluahdfjkhlkahdjlhalhla",
      date: "31/5/2025",
    ),
    NoteModal(
      title: "ahmed awad mohaemd ",
      description: "ahdfkljahidfhluahdfjkhlkahdjlhalhla",
      date: "31/5/2025",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return notes.isEmpty
        ? NoDataFound(
          title: "${S.of(context).NoNotesFound}\n${S.of(context).AddOne}",
          dataImage: AppImages.addNote,
        )
        : Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.76,
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomNoteCard(noteModal: notes[index]),
                  );
                },
              ),
            ),
          ],
        );
  }
}
