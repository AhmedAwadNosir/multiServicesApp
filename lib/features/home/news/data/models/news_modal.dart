class NewsModal {
  final String urlToImage;
  final String title;
  final String description;
  final String url;

  NewsModal({
    required this.urlToImage,
    required this.title,
    required this.description,
    required this.url,
  });

  factory NewsModal.formJosn(dynamic json) {
    return NewsModal(
        urlToImage: json["urlToImage"] ?? "",
        title: json["title"],
        description: json["description"] ?? json["content"] ?? "",
        url: json["url"]);
  }
}
