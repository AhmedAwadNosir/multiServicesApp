import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/add_note_bottom_sheet.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/notes_view_body.dart';
import 'package:multiservices_app/features/home/notes/states_manager/get_notes/get_notes_cubit.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<GetNotesCubit>(context).getNotes();
    super.initState();
  }

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
