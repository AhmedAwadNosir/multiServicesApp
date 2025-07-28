import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageType { text, file, image, voiceRecord }

// to recive message type as string and trun it to message type
MessageType messageTypeFromString(String s) => MessageType.values.byName(s);

// to store message type as String
extension MessageTypeExtension on MessageType {
  String get value => name; // from Dart ≥2.15
}

class MessageModal {
  final String chatRoom;
  final MessageType messageType;
  final String messageContent;
  final Timestamp messageTime;
  final String senderId;
  final bool seen;
  final bool delletReciver;
  final bool delletSender;
  MessageModal({
    required this.chatRoom,
    required this.messageType,
    required this.messageContent,
    required this.messageTime,
    required this.senderId,
    required this.seen,
    required this.delletReciver,
    required this.delletSender,
  });

  factory MessageModal.fromJson(dynamic json) {
    return MessageModal(
      chatRoom: json["chatRoom"],
      messageType: messageTypeFromString(json["messageType"] as String),
      messageContent: json["messageContent"],
      messageTime: json["messageTime"],
      senderId: json["senderId"],
      seen: json["seen"],
      delletReciver: json["delletReciver"],
      delletSender: json["delletSender"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "chatRoom": chatRoom,
      "messageType": messageType.value,
      "messageContent": messageContent,
      "messageTime": messageTime,
      'senderId': senderId,
      "seen": seen,
      "delletReciver": delletReciver,
      "delletSender": delletSender,
    };
  }
}
