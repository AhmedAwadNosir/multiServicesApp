import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/books/data/models/BookModel.dart';
import 'package:multiservices_app/features/home/books/presentation/wedgits/book_details_header.dart';
import 'package:multiservices_app/features/home/books/presentation/wedgits/bottom_related_books_header.dart';
import 'package:multiservices_app/features/home/books/presentation/wedgits/bottom_related_books_list.dart';
import 'package:multiservices_app/features/home/books/states_manager/get_top_books/get_top_books_cubit.dart';
import 'book_details_item.dart';

class BookDetailsViewBody extends StatefulWidget {
  const BookDetailsViewBody({super.key, required this.bookDetails});
  final BookModel bookDetails;
  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {
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
                    child: BlocBuilder<GetTopBooksCubit, GetTopBooksState>(
                      builder: (context, state) {
                        if (state is GetTopBooksFailure) {
                          showErrorDialog(
                            context: context,
                            errorMessage: state.errorMessage,
                          );
                          return SizedBox();
                        } else if (state is GetTopBooksSuccess) {
                          return BottomRelatedBooksList(books: state.books);
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
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
