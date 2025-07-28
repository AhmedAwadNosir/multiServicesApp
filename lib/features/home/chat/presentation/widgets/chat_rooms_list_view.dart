import 'package:flutter/material.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';

import 'package:multiservices_app/features/home/chat/data/models/contac_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/views/chat_view.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_chat_room_item.dart';

class ChatRoomsListView extends StatelessWidget {
  const ChatRoomsListView({super.key, required this.chats});
  final List<ContactModal> chats;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        ContactModal contact = chats[index];
        UserModal userModal = UserModal(
          userName: contact.name,
          profilImageLink: contact.image,
          docId: contact.docId,
          isOnline: contact.isOnline,
          chatRoom: contact.chatRoom,
        );
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChatView(userModal: userModal);
                  },
                ),
              );
            },
            child: CustomChatRoomItem(chatRoom: chats[index]),
          ),
        );
      },
    );
  }
}
