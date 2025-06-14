import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/chat/data/models/message_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_reciver_message.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_sender_message.dart';

class MessagesListView extends StatefulWidget {
  const MessagesListView({
    super.key,
    required this.scrollController,
    required this.messages,
  });
  final ScrollController scrollController;
  final List<MessageModal> messages;
  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.78,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          controller: widget.scrollController,
          reverse: true,
          itemCount: widget.messages.length,
          itemBuilder: (context, index) {
            return widget.messages[index].senderId == auth.currentUser!.uid
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CustomSenderMessage(
                    message: widget.messages[index].messageContent,
                    userAvatar: AppImages.profilePhoto,
                  ),
                )
                : Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CustomResiverMessage(
                    message: widget.messages[index].messageContent,
                  ),
                );
          },
        ),
      ),
    );
  }
}
