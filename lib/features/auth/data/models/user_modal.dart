class UserModal {
  final String userName;
  final String profilImageLink;
  String? docId;
  String? chatRoom;
  bool? isOnline;
  UserModal({
    required this.userName,
    required this.profilImageLink,
    this.docId,
    this.chatRoom,
    this.isOnline,
  });

  factory UserModal.fromJson(dynamic json) {
    return UserModal(
      userName: json['userName'],
      profilImageLink: json['profilImageLink'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      'profilImageLink': profilImageLink,
      "docId": docId ?? "",
    };
  }
}
