import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModal {
  final String messageContent;
  final Timestamp messageTime;
  final String senderId;

  MessageModal({
    required this.messageContent,
    required this.messageTime,
    required this.senderId,
  });

  factory MessageModal.fromJson(dynamic json) {
    return MessageModal(
      messageContent: json["messageContent"],
      messageTime: json["messageTime"],
      senderId: json["senderId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "messageContent": messageContent,
      "messageTime": messageTime,
      'senderId': senderId,
    };
  }
}
