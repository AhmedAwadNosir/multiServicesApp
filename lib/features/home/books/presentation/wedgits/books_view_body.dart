import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/books/data/models/books_filter_option.dart';
import 'package:multiservices_app/features/home/books/functions/open_filter_dialog.dart';
import 'package:multiservices_app/features/home/books/presentation/wedgits/best_seller_list_view_bloc_builder.dart';
import 'package:multiservices_app/features/home/books/presentation/wedgits/top_books_list_view_bloc_builder.dart';
import 'package:multiservices_app/features/home/books/states_manager/get_best_seller_books/get_best_seller_books_cubit.dart';
import 'package:multiservices_app/features/home/books/states_manager/get_top_books/get_top_books_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class BooksViewBody extends StatefulWidget {
  const BooksViewBody({super.key});

  @override
  State<BooksViewBody> createState() => _BooksViewBodyState();
}

class _BooksViewBodyState extends State<BooksViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetTopBooksCubit>(context).getTopBooks();
    BlocProvider.of<GetBestSellerBooksCubit>(context).getBestSellerBooks();
    super.initState();
  }

  BooksFilterOptions _currentFilter = BooksFilterOptions(
    bookType: "programing",
    bookFilter: "free-ebooks",
    orderBy: "newst",
  );
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
            width: 40,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  openFilterDialog(context, (filter) {
                    setState(() {
                      _currentFilter = filter;
                      // apply filter to your data source
                    });
                  }, _currentFilter);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(S.of(context).Filter, style: TextStyle(fontSize: 18)),
                    Icon(Icons.filter_alt_outlined, size: 22),
                  ],
                ),
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(child: TopBooksLIstViewBuilderBlocConsumer()),

        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: Text(
            S.of(context).BestSeller,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        SliverToBoxAdapter(child: BestSellerListViewBlocBuilder()),
      ],
    );
  }
}
