import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/data/models/BookModel.dart';
import 'package:multiservices_app/features/home/presentation/widgets/best_seller_book_item.dart';

class BestSellerBooksListViewBuilder extends StatefulWidget {
  const BestSellerBooksListViewBuilder({super.key});

  @override
  State<BestSellerBooksListViewBuilder> createState() =>
      _BestSellerBooksListViewBuilderState();
}

class _BestSellerBooksListViewBuilderState
    extends State<BestSellerBooksListViewBuilder> {
  @override
  List<BookModel> bestSellerBooks = [
    BookModel(
      image:
          "https://i.pinimg.com/564x/f7/c8/12/f7c812c9b0296cd9f119e33a06d9a256.jpg",
      headline: "Hary Potter and the Goblet of fire",
      author: "J.K Rowling",
      price: "19.99",
      rating: 4.5,
      ratingCount: 5556,
    ),
    BookModel(
      image:
          "https://i.pinimg.com/564x/f7/c8/12/f7c812c9b0296cd9f119e33a06d9a256.jpg",
      headline: "Hary Potter and the Goblet of fire",
      author: "J.K Rowling",
      price: "19.99",
      rating: 4.5,
      ratingCount: 5556,
    ),
    BookModel(
      image:
          "https://i.pinimg.com/564x/f7/c8/12/f7c812c9b0296cd9f119e33a06d9a256.jpg",
      headline: "Hary Potter and the Goblet of fire",
      author: "J.K Rowling",
      price: "19.99",
      rating: 4.5,
      ratingCount: 5556,
    ),
    BookModel(
      image:
          "https://i.pinimg.com/564x/f7/c8/12/f7c812c9b0296cd9f119e33a06d9a256.jpg",
      headline: "Hary Potter and the Goblet of fire",
      author: "J.K Rowling",
      price: "19.99",
      rating: 4.5,
      ratingCount: 5556,
    ),
  ];
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bestSellerBooks.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return BestSellerBookItem(book: bestSellerBooks[index]);
      },
    );
  }
}
