import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/notes_list_view_bloc_builder.dart';

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
          child: NotesListViewBlocBuilder(),
        ),
      ],
    );
  }
}
