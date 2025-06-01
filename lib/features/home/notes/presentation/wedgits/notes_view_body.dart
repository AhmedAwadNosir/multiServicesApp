import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/notes/data/models/note_modal.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/no_notes_found.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/custom_note_card.dart';
import 'package:multiservices_app/features/home/notes/states_manager/get_notes/get_notes_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.76,
          child: BlocBuilder<GetNotesCubit, GetNotesState>(
            builder: (context, state) {
              if (state is GetNotesSuccess) {
                if (state.nots.isEmpty) {
                  return NoDataFound(
                    title:
                        "${S.of(context).NoNotesFound}\n${S.of(context).AddOne}",
                    dataImage: AppImages.addNote,
                  );
                } else {
                  return ListView.builder(
                    itemCount: state.nots.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomNoteCard(noteModal: state.nots[index]),
                      );
                    },
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
