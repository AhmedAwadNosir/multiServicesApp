import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/add_note_form_sheet.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      child: SingleChildScrollView(
        // child: BlocProvider(
        //   create: (context) => AddNotesCubit(),
        //   child: const AddNoteFormBlocConsumer(),
        // ),
        child: AddNoteForm(),
      ),
    );
  }
}
