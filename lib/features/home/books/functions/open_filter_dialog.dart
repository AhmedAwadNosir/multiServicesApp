import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/books/data/models/books_filter_option.dart';
import 'package:multiservices_app/features/home/books/states_manager/get_best_seller_books/get_best_seller_books_cubit.dart';
import 'package:multiservices_app/features/home/books/states_manager/get_top_books/get_top_books_cubit.dart';

void openFilterDialog(
  BuildContext context,
  Function(BooksFilterOptions) onApply,
  BooksFilterOptions currentFilter,
) {
  final List<String> bookTypes = [
    "programing",
    "romance",
    "mystery",
    "fantasy",
    "science fiction",
    "historical fiction",
    "biography",
    "self-help",
    "young adult",
    "true crime",
    "children",
  ];
  final List<String> orderByOptions = ['newest', 'relevance'];
  final List<String> priceOptions = ['free-ebooks', 'paid-ebooks', 'ebooks'];

  String selectedBookType = currentFilter.bookType;
  String selectedOrderBy = currentFilter.orderBy;
  String selectedPriceType = currentFilter.bookFilter;

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
                Text("Book Type"),
                DropdownButton<String>(
                  value:
                      bookTypes.contains(selectedBookType)
                          ? selectedBookType
                          : bookTypes.first,
                  isExpanded: true,
                  items:
                      bookTypes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged:
                      (val) => setState(() {
                        selectedBookType = val!;
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
                Text("Price Type"),
                DropdownButton<String>(
                  value:
                      priceOptions.contains(selectedPriceType)
                          ? selectedPriceType
                          : priceOptions.first,
                  isExpanded: true,
                  items:
                      priceOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged:
                      (val) => setState(() {
                        selectedPriceType = val!;
                      }),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    onApply(
                      BooksFilterOptions(
                        bookType: selectedBookType,
                        orderBy: selectedOrderBy,
                        bookFilter: selectedPriceType,
                      ),
                    );

                    BlocProvider.of<GetBestSellerBooksCubit>(
                      context,
                    ).getBestSellerBooks(
                      booksType: selectedBookType,
                      filter: selectedPriceType,
                      orderby: selectedOrderBy,
                    );
                    BlocProvider.of<GetTopBooksCubit>(context).getTopBooks(
                      booksType: selectedBookType,
                      filter: selectedPriceType,
                      orderby: selectedOrderBy,
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
