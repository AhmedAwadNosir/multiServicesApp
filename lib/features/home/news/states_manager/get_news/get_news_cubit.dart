import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/home/news/data/Models/news_modal.dart';

import 'package:multiservices_app/features/home/news/data/repos/news_repo_impl.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit(this.newsRepoImpl) : super(GetNewsInitial());
  final NewsRepoImpl newsRepoImpl;
  Future<void> getNews({String? category, String? lang, String? sortBy}) async {
    emit(GetNewsLoading());
    var result = await newsRepoImpl.getNews(
      category: category,
      lang: lang,
      sortBy: sortBy,
    );

    result.fold(
      (failure) => emit(GetNewsFailure(errorMessage: failure.errorMessage)),
      (news) => emit(GetNewsSuccess(news: news)),
    );
  }
}
