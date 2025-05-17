import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/books/data/models/BookModel.dart';
import 'package:multiservices_app/features/home/books/presentation/wedgits/best_seller_book_item.dart';

class BestSellerBooksListViewBuilder extends StatelessWidget {
  const BestSellerBooksListViewBuilder({
    super.key,
    required this.bestSellerBooks,
  });

  @override
  final List<BookModel> bestSellerBooks;

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
