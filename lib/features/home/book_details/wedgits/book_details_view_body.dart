import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/book_details/wedgits/book_details_header.dart';
import 'package:multiservices_app/features/home/book_details/wedgits/bottom_related_books_header.dart';
import 'package:multiservices_app/features/home/book_details/wedgits/bottom_related_books_list.dart';
import 'package:multiservices_app/features/home/data/models/BookModel.dart';
import 'book_details_item.dart';

class BookDetailsViewBody extends StatefulWidget {
  const BookDetailsViewBody({super.key, required this.bookDetails});
  final BookModel bookDetails;
  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {
  List<BookModel> books = [
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const BookDetailsHeader(),
                  BookDetailsItem(bookDetails: widget.bookDetails),
                  const Spacer(),
                  const BottomRelatedBooksHeader(),
                  Padding(
                    padding: EdgeInsets.only(left: 18, bottom: 20),
                    child: BottomRelatedBooksList(books: books),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
