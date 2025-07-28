import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModal {
  final String name;
  final String image;
  final String docId;
  final Timestamp lastMessageTime;
  final int numOfNewMessages;
  final String lastMessage;
  final bool isOnline;
  final String chatRoom;
  ContactModal({
    required this.name,
    required this.image,
    required this.docId,
    required this.lastMessageTime,
    required this.numOfNewMessages,
    required this.lastMessage,
    required this.isOnline,
    required this.chatRoom,
  });

  factory ContactModal.fromJson(dynamic json) {
    return ContactModal(
      name: json['name'],
      image: json['image'],
      docId: json['docId'],
      lastMessageTime: json['lastMessageTime'],
      numOfNewMessages: (json['numOfNewMessages'] as num).toInt(),
      lastMessage: json["lastMessage"],
      isOnline: json["isOnline"],
      chatRoom: json["chatRoom"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'docId': docId,
      'lastMessageTime': lastMessageTime,
      'numOfNewMessages': numOfNewMessages,
      "lastMessage": lastMessage,
      "isOnline": isOnline,
      "chatRoom": chatRoom,
    };
  }
}
