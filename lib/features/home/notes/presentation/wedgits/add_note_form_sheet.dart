import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/color_picker_list_view.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/custom_text_form_filled.dart';
import 'package:multiservices_app/generated/l10n.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? noteTitle;
  String? noteDescription;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormFilled(
            hint: S.of(context).Title,
            onSaved: (value) {
              noteTitle = value;
            },
          ),
          const SizedBox(height: 25),
          CustomTextFormFilled(
            hint: S.of(context).Content,
            maxLines: 5,
            onSaved: (value) {
              noteDescription = value;
            },
          ),
          const SizedBox(height: 15),
          ColorPickerListView(),
          const SizedBox(height: 30),
          SizedBox(
            height: 50,
            width: 130,
            child: CustomButton(
              buttonName: S.of(context).Add,
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                  // BlocProvider.of<AddNotesCubit>(context).addNotes(
                  //     note: NoteModal(
                  //         title: noteTitle!,
                  //         description: noteDescription!,
                  //         date:
                  //             "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                  //         noteColor: Colors.orange.value));
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
