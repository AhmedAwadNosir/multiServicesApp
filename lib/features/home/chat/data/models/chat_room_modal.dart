import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomModal {
  final String chatRoom;
  final String sender;
  final String reciver;
  final String reciverProfileImage;
  final Timestamp lastUpdate;
  final int numOfNewMessage;

  ChatRoomModal({
    required this.chatRoom,
    required this.sender,
    required this.reciver,
    required this.reciverProfileImage,
    required this.lastUpdate,
    required this.numOfNewMessage,
  });
}
