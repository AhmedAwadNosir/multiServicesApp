import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/presentation/widgets/best_seller_books_list_view_builder.dart';
import 'package:multiservices_app/features/home/presentation/widgets/custom_book_card.dart';
import 'package:multiservices_app/features/home/presentation/widgets/top_books_list_view_builder.dart';
import 'package:multiservices_app/generated/l10n.dart';

class BooksViewBody extends StatefulWidget {
  const BooksViewBody({super.key});

  @override
  State<BooksViewBody> createState() => _BooksViewBodyState();
}

class _BooksViewBodyState extends State<BooksViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: TopBooksListViewBuilder()),

        SliverToBoxAdapter(child: SizedBox(height: 30)),
        SliverToBoxAdapter(
          child: Text(
            S.of(context).BestSeller,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        SliverToBoxAdapter(child: BestSellerBooksListViewBuilder()),
      ],
    );
  }
}
