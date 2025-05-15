import 'package:flutter/material.dart';

class BookModel {
  final String? image;
  final String? headline;
  final String? author;
  final String? price;
  final num? rating;
  final int? ratingCount;

  BookModel({
    this.image,
    @required required this.headline,
    @required this.author,
    @required this.price,
    @required this.rating,
    @required this.ratingCount,
  });
  factory BookModel.fromjson(dynamic jsonData) {
    return BookModel(
      image: jsonData['volumeInfo']['imageLinks']?['thumbnail'] ??
          "https://th.bing.com/th/id/OIP.9zpFpYq2xuDkiJevIxpJ4gHaQd?pid=ImgDet&rs=1",
      headline: jsonData["volumeInfo"]["title"],
      author: jsonData["volumeInfo"]["authors"][0],
      price:
          jsonData["volumeInfo"]["listPrice"]?["amount"].toString() ?? 'FREE',
      rating: jsonData["volumeInfo"]["averageRating"] ?? 0,
      ratingCount: jsonData['volumeInfo']['ratingsCount'] ?? 0,
    );
  }
}
