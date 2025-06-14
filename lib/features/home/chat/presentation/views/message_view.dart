import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/messages_view_body.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/new_chat_bottom_sheet.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/add_note_bottom_sheet.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Theme.of(context).colorScheme.surface,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: NewChatBottomSheet(),
              );
            },
          );
        },
        backgroundColor: const Color(0xFF252525),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Icon(
          Icons.add_comment_sharp,
          size: 28,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: MessagesViewBody(),
    );
  }
}
