import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/create_message_text_form_field.dart';

class CreateMessageContainerForm extends StatefulWidget {
  const CreateMessageContainerForm({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<CreateMessageContainerForm> createState() =>
      _CreateMessageContainerFormState();
}

class _CreateMessageContainerFormState
    extends State<CreateMessageContainerForm> {
  String messageContent = '';
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.attach_file,
                size: 35,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            CreateMessageTextFormField(
              textEditingController: _textEditingController,
              onChanged: (value) {
                messageContent = value ?? "";
              },
              onSubmitted: (value) {
                messageContent = value!;
              },
            ),
            Transform.rotate(
              angle: -45 / 70, // Rotate the icon by 45 degrees
              child: IconButton(
                onPressed: () async {
                  if (messageContent.isNotEmpty) {
                    // BlocProvider.of<SendMessageCubit>(context).sendMessage(
                    //   message: MessageModal(
                    //       messageContent: messageContent,
                    //       messageTime: Timestamp.now(),
                    //       senderId: FirebaseAuth.instance.currentUser!.uid),
                    // );
                    widget.scrollController.animateTo(
                      0.0,
                      duration: Duration(seconds: 2),
                      curve: Curves.bounceIn,
                    );
                    _textEditingController.clear();
                  } else {
                    // showSnackBar(
                    //     errorMessage: "Can,t Send Empty Message",
                    //     context: context);
                  }
                },
                icon: Icon(
                  Icons.send,
                  size: 40,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
