import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/books/data/models/books_filter_option.dart';
import 'package:multiservices_app/features/home/books/states_manager/get_best_seller_books/get_best_seller_books_cubit.dart';
import 'package:multiservices_app/features/home/books/states_manager/get_top_books/get_top_books_cubit.dart';
import 'package:multiservices_app/features/home/news/data/models/news_filter_options_modal.dart';
import 'package:multiservices_app/features/home/news/states_manager/get_news/get_news_cubit.dart';

void openNewsFilterDialog(
  BuildContext context,
  Function(NewsFilterOptionsModal) onApply,
  NewsFilterOptionsModal currentFilter,
) {
  final List<String> categories = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology",
  ];
  final List<String> orderByOptions = [
    'publishedAt',
    'relevancy',
    "popularity",
  ];
  final List<String> lang = ['en', 'ar', 'fr', 'es'];

  String selectedCategory = currentFilter.category;
  String selectedOrderBy = currentFilter.sortBy;
  String selectedlang = currentFilter.lang;

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Book Type
                Text("News Categroy"),
                DropdownButton<String>(
                  value:
                      categories.contains(selectedCategory)
                          ? selectedCategory
                          : categories.first,
                  isExpanded: true,
                  items:
                      categories.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged:
                      (val) => setState(() {
                        selectedCategory = val!;
                      }),
                ),

                // Order By
                SizedBox(height: 10),
                Text("Order By"),
                DropdownButton<String>(
                  value:
                      orderByOptions.contains(selectedOrderBy)
                          ? selectedOrderBy
                          : orderByOptions.first,
                  isExpanded: true,
                  items:
                      orderByOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged:
                      (val) => setState(() {
                        selectedOrderBy = val!;
                      }),
                ),

                // Price Type
                SizedBox(height: 10),
                Text("News Language"),
                DropdownButton<String>(
                  value:
                      lang.contains(selectedlang) ? selectedlang : lang.first,
                  isExpanded: true,
                  items:
                      lang.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged:
                      (val) => setState(() {
                        selectedlang = val!;
                      }),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    onApply(
                      NewsFilterOptionsModal(
                        category: selectedCategory,
                        sortBy: selectedOrderBy,
                        lang: selectedlang,
                      ),
                    );

                    BlocProvider.of<GetBestSellerBooksCubit>(
                      context,
                    ).getBestSellerBooks(
                      booksType: selectedCategory,
                      filter: selectedlang,
                      orderby: selectedOrderBy,
                    );
                    BlocProvider.of<GetNewsCubit>(context).getNews(
                      category: selectedCategory,
                      lang: selectedlang,
                      sortBy: selectedOrderBy,
                    );
                    Navigator.pop(context);
                  },
                  child: Text("Apply Filter"),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
