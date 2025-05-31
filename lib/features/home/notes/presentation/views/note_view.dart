import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/add_note_bottom_sheet.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
