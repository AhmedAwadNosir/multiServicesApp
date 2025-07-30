import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';

import 'package:multiservices_app/features/home/chat/data/models/contac_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';
import 'package:multiservices_app/features/home/chat/presentation/views/chat_view.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_chat_room_item.dart';

class ChatRoomsListView extends StatefulWidget {
  const ChatRoomsListView({super.key, required this.chats});
  final List<ContactModal> chats;

  @override
  State<ChatRoomsListView> createState() => _ChatRoomsListViewState();
}

class _ChatRoomsListViewState extends State<ChatRoomsListView> {
  ChatRepoImpl chatRepoImpl = ChatRepoImpl(
    firebaseServieces: FirebaseServieces(),
    auth: FirebaseAuth.instance,
  );
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.chats.length,
      itemBuilder: (context, index) {
        ContactModal contact = widget.chats[index];
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
              chatRepoImpl.handleUserOnlineSatuslastSeenChatIn(
                reciverDocId: contact.docId,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChatView(userModal: userModal);
                  },
                ),
              );
            },
            child: CustomChatRoomItem(chatRoom: widget.chats[index]),
          ),
        );
      },
    );
  }
}
