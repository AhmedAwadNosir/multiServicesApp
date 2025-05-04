class UserModal {
  final String userName;
  final String profilImageLink;

  UserModal({required this.userName, required this.profilImageLink});

  factory UserModal.fromJson(dynamic json) {
    return UserModal(
      userName: json['userName'],
      profilImageLink: json['profilImageLink'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"userName": userName, 'profilImageLink': profilImageLink};
  }
}
