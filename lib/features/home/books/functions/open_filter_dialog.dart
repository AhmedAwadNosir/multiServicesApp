import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/books/data/models/books_filter_option.dart';
import 'package:multiservices_app/features/home/books/states_manager/get_best_seller_books/get_best_seller_books_cubit.dart';
import 'package:multiservices_app/features/home/books/states_manager/get_top_books/get_top_books_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';

void openFilterDialog(
  BuildContext context,
  Function(BooksFilterOptions) onApply,
  BooksFilterOptions currentFilter,
) {
  final Map<String, String> currnetFiletrKeyesOnArabic = {
    "البرمجة": "programing",
    "رومانسيّات": "romance",
    "روايات غموض": "mystery",
    "خيال": "fantasy",
    "خيال علمي": "sciencefiction",
    "روايات تاريخيّة": "historicalfiction",
    "سيرة ذاتيّة": "biography",
    "تطوير الذات": "selfhelp",
    "شبابي": "youngadult",
    "جريمة حقيقية": "truecrime",
    "أطفال": "children",
    "الأحدث": "newest",
    "الأكثر صلة": "relevance",
    "كتب إلكترونيّة مجانية": "free-ebooks",
    "كتب إلكترونيّة مدفوعة": "paid-ebooks",
    "كتب إلكترونيّة": "ebooks",
    "نوع الكتاب": "BookType",
    "نوع السعر": "PriceType",
  };
  final List<String> bookTypes = [
    S.of(context).programing,
    S.of(context).romance,
    S.of(context).mystery,
    S.of(context).fantasy,
    S.of(context).sciencefiction,
    S.of(context).historicalfiction,
    S.of(context).biography,
    S.of(context).selfhelp,
    S.of(context).youngadult,
    S.of(context).truecrime,
    S.of(context).children,
  ];
  final List<String> orderByOptions = [
    S.of(context).newest,
    S.of(context).relevance,
  ];
  final List<String> priceOptions = [
    S.of(context).freeebooks,
    S.of(context).paidebooks,
    S.of(context).ebooks,
  ];

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
                Text(S.of(context).BookType),
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
                Text(S.of(context).OrderBy),
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
                Text(S.of(context).PriceType),
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

                    Locale currentLocal =
                        Provider.of<LocalizationProvider>(
                          context,
                          listen: false,
                        ).locale;
                    if (currentLocal == Locale('ar')) {
                      BlocProvider.of<GetBestSellerBooksCubit>(
                        context,
                      ).getBestSellerBooks(
                        booksType: currnetFiletrKeyesOnArabic[selectedBookType],
                        filter: currnetFiletrKeyesOnArabic[selectedPriceType],
                        orderby: currnetFiletrKeyesOnArabic[selectedOrderBy],
                      );
                      BlocProvider.of<GetTopBooksCubit>(context).getTopBooks(
                        booksType: currnetFiletrKeyesOnArabic[selectedBookType],
                        filter: currnetFiletrKeyesOnArabic[selectedPriceType],
                        orderby: currnetFiletrKeyesOnArabic[selectedOrderBy],
                      );
                    } else {
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
                    }
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).ApplyFilter),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
