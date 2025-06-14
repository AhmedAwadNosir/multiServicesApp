import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/chat/data/models/chat_room_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_chat_room_item.dart';

class ChatRoomsListView extends StatefulWidget {
  const ChatRoomsListView({super.key});

  @override
  State<ChatRoomsListView> createState() => _ChatRoomsListViewState();
}

class _ChatRoomsListViewState extends State<ChatRoomsListView> {
  final List<ChatRoomModal> chats = [
    ChatRoomModal(
      chatRoom: "",
      sender: "Yousef Awad",
      reciver: "Ahmed Awad Nosir",
      reciverProfileImage: AppImages.profilePhoto,
      lastUpdate: Timestamp.now(),
      numOfNewMessage: 555,
    ),
    ChatRoomModal(
      chatRoom: "",
      sender: "Yousef Awad",
      reciver: "Ahmed Awad Nosir",
      reciverProfileImage: AppImages.profilePhoto,
      lastUpdate: Timestamp.now(),
      numOfNewMessage: 555,
    ),
    ChatRoomModal(
      chatRoom: "",
      sender: "Yousef Awad",
      reciver: "Ahmed Awad Nosir",
      reciverProfileImage: AppImages.profilePhoto,
      lastUpdate: Timestamp.now(),
      numOfNewMessage: 555,
    ),
    ChatRoomModal(
      chatRoom: "",
      sender: "Yousef Awad",
      reciver: "Ahmed Awad Nosir",
      reciverProfileImage: AppImages.profilePhoto,
      lastUpdate: Timestamp.now(),
      numOfNewMessage: 555,
    ),
    ChatRoomModal(
      chatRoom: "",
      sender: "Yousef Awad",
      reciver: "Ahmed Awad Nosir",
      reciverProfileImage: AppImages.profilePhoto,
      lastUpdate: Timestamp.now(),
      numOfNewMessage: 555,
    ),
    ChatRoomModal(
      chatRoom: "",
      sender: "Yousef Awad",
      reciver: "Ahmed Awad Nosir",
      reciverProfileImage: AppImages.profilePhoto,
      lastUpdate: Timestamp.now(),
      numOfNewMessage: 555,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CustomChatRoomItem(chatRoomModal: chats[index]),
        );
      },
    );
  }
}
