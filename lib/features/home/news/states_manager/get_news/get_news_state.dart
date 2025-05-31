part of 'get_news_cubit.dart';

@immutable
sealed class GetNewsState {}

final class GetNewsInitial extends GetNewsState {}

final class GetNewsLoading extends GetNewsState {}

final class GetNewsSuccess extends GetNewsState {
  final List<NewsModal> news;

  GetNewsSuccess({required this.news});
}

final class GetNewsFailure extends GetNewsState {
  final String errorMessage;

  GetNewsFailure({required this.errorMessage});
}
