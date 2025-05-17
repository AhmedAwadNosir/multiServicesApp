import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/books/presentation/wedgits/best_seller_books_list_view_builder.dart';
import 'package:multiservices_app/features/home/books/states_manager/get_best_seller_books/get_best_seller_books_cubit.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBestSellerBooksCubit, GetBestSellerBooksState>(
      builder: (context, state) {
        if (state is GetBestSellerBooksFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
          return SizedBox();
        } else if (state is GetBestSellerBooksSuccess) {
          return BestSellerBooksListViewBuilder(bestSellerBooks: state.books);
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 180), CircularProgressIndicator()],
          );
        }
      },
    );
  }
}
