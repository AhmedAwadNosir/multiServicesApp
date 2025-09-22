class FeedbackMessageModla {
  final String name;
  final String email;
  final String message;
  final String senderDocId;

  FeedbackMessageModla({
    required this.name,
    required this.email,
    required this.message,
    required this.senderDocId,
  });

  factory FeedbackMessageModla.fromJson(dynamic json) {
    return FeedbackMessageModla(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      message: json['message'] ?? '',
      senderDocId: json['docId'] ?? '',
    );
  }

  /// Converts FeedbackMessage to JSON (Map)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'message': message,
      'docId': senderDocId,
    };
  }
}
