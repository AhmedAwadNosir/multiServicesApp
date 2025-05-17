import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/books/data/models/BookModel.dart';
import 'package:multiservices_app/features/home/books/presentation/views/book_details_view.dart';
import 'package:multiservices_app/features/home/books/presentation/wedgits/custom_book_card.dart';

class TopBooksListViewBuilder extends StatelessWidget {
  const TopBooksListViewBuilder({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsView(book: books[index]),
                  ),
                );
              },
              child: CustomBookCard(bookModel: books[index]),
            ),
          );
        },
      ),
    );
  }
}
