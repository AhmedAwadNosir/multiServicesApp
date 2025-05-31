import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/notes/data/models/note_modal.dart';
import 'package:multiservices_app/features/home/notes/functions/show_confirmation_dialog.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/edit_note_view.dart';
import 'package:multiservices_app/generated/l10n.dart';

class CustomNoteCard extends StatelessWidget {
  CustomNoteCard({
    super.key,
    required this.noteModal,
    this.deletOptionDisapled,
  });
  final NoteModal noteModal;
  bool? deletOptionDisapled;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNoteView(noteModal: noteModal),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color:
              noteModal.noteColor != null
                  ? Color(noteModal.noteColor!)
                  : Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        noteModal.title,
                        style: const TextStyle(fontSize: 26),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                deletOptionDisapled == null
                    ? GestureDetector(
                      onTap: () {
                        showConfermaTionDailog(
                          context,
                          dailogTitle:
                              S.of(context).Areyoursureyouwantdelletethisnote,
                          cancelButtonName: S.of(context).Cancel,
                          confirmButtonName: S.of(context).Dellete,
                          confirmOnPressed: () {
                            // noteModal.delete();
                            // BlocProvider.of<GetNotesCubit>(context)
                            //     .getNotes();
                            // Navigator.pop(context);
                          },
                        );
                      },
                      child: const Icon(Icons.delete, size: 35),
                    )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              noteModal.date,
              style: TextStyle(color: Theme.of(context).colorScheme.shadow),
            ),
          ],
        ),
      ),
    );
  }
}
