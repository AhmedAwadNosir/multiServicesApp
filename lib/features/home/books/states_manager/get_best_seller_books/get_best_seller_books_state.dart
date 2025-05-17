part of 'get_best_seller_books_cubit.dart';

@immutable
sealed class GetBestSellerBooksState {}

final class GetBestSellerBooksInitial extends GetBestSellerBooksState {}

final class GetBestSellerBooksLoading extends GetBestSellerBooksState {}

final class GetBestSellerBooksSuccess extends GetBestSellerBooksState {
  final List<BookModel> books;

  GetBestSellerBooksSuccess({required this.books});
}

final class GetBestSellerBooksFailure extends GetBestSellerBooksState {
  final String errorMessage;

  GetBestSellerBooksFailure({required this.errorMessage});
}
