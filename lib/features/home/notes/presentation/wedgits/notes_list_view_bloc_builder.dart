import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/no_notes_found.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/notes_list_view_builder.dart';
import 'package:multiservices_app/features/home/notes/states_manager/get_notes/get_notes_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class NotesListViewBlocBuilder extends StatelessWidget {
  const NotesListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        if (state is GetNotesSuccess) {
          if (state.nots.isEmpty) {
            return NoDataFound(
              title: "${S.of(context).NoNotesFound}\n${S.of(context).AddOne}",
              dataImage: AppImages.addNote,
              imageTopPading: 0.1,
            );
          } else {
            return NotesListViewBuilder(notes: state.nots);
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
      },
    );
  }
}
