import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/functions/is_dark_mode.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/chat/data/models/message_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/create_message_container.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/message_list_view.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  final List<MessageModal> messages = [
    MessageModal(
      messageContent: "hi, how are you?",
      messageTime: Timestamp.now(),
      senderId: '7UF9r4w47Ig8p1P5lTxxkzLYV4g1',
    ),
    MessageModal(
      messageContent: "i,am fine and you?",
      messageTime: Timestamp.now(),
      senderId: '',
    ),
    MessageModal(
      messageContent: "i,am good",
      messageTime: Timestamp.now(),
      senderId: '7UF9r4w47Ig8p1P5lTxxkzLYV4g1',
    ),
    MessageModal(
      messageContent: "what are you doing now?",
      messageTime: Timestamp.now(),
      senderId: '',
    ),
    MessageModal(
      messageContent: "i play video games?",
      messageTime: Timestamp.now(),
      senderId: '7UF9r4w47Ig8p1P5lTxxkzLYV4g1',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isDarkMode(),
      builder: (context, isDarkMode) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                isDarkMode.data!
                    ? AppImages.chatBackground
                    : AppImages.chatBackgroundLight,
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MessagesListView(
                  scrollController: scrollController,
                  messages: messages,
                ),

                CreateMessageContainerForm(scrollController: scrollController),
              ],
            ),
          ),
        );
      },
    );
  }
}
