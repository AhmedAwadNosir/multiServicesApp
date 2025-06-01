import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/add_note_form_sheet.dart';
import 'package:multiservices_app/features/home/notes/states_manager/add_note/add_note_cubit.dart';
import 'package:multiservices_app/features/home/notes/states_manager/get_notes/get_notes_cubit.dart';

class AddNoteFormBlocConsumer extends StatelessWidget {
  const AddNoteFormBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          BlocProvider.of<GetNotesCubit>(context).getNotes();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddNoteLoading,
          child: AddNoteForm(),
        );
      },
    );
  }
}
