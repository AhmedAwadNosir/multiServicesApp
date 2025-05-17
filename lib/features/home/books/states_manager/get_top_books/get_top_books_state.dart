part of 'get_top_books_cubit.dart';

@immutable
sealed class GetTopBooksState {}

final class GetTopBooksInitial extends GetTopBooksState {}

final class GetTopBooksLoading extends GetTopBooksState {}

final class GetTopBooksSuccess extends GetTopBooksState {
  final List<BookModel> books;

  GetTopBooksSuccess({required this.books});
}

final class GetTopBooksFailure extends GetTopBooksState {
  final String errorMessage;

  GetTopBooksFailure({required this.errorMessage});
}
