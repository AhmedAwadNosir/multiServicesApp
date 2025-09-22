import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';

import 'package:multiservices_app/features/home/chat/data/models/message_modal.dart';

Stream<List<MessageModal>> getallMessagesForContact({
  required UserModal userModal,
  required String chatRoom,
}) {
  final firebase = FirebaseFirestore.instance;
  log(chatRoom ?? "no chat room");
  if (chatRoom == null || chatRoom.trim().isEmpty) {
    // Return a stream that immediately emits an empty list
    return Stream.value(<MessageModal>[]);
  }

  return firebase
      .collection(AppConstants.chatColection)
      .where('chatRoom', isEqualTo: chatRoom)
      .orderBy('messageTime', descending: true)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) {
              final message = MessageModal.fromJson(
                doc.data() as Map<String, dynamic>,
              );
              message.docId = doc.id;
              return message;
            }).toList(),
      );
}
