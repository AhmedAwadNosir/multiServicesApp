import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:multiservices_app/core/services/api_services.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/api_failure.dart';
import 'package:multiservices_app/features/home/news/data/Models/news_modal.dart';

import 'package:multiservices_app/features/home/news/data/repos/news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  final ApiServices apiServices = ApiServices(
    dio: Dio(),
    baseUrl: "https://newsapi.org/v2/everything?",
  );

  @override
  Future<Either<Failure, List<NewsModal>>> getNews({
    String? category,
    String? lang,
    String? sortBy,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            "q=${category ?? "general"}&language=${lang ?? "en"}&sortBy=${sortBy ?? "publishedAt"}&apiKey=ad7a29fc84104227ad0b29c458b753ef",
      );
      List<NewsModal> newsArticles = [];
      for (var article in data["articles"]) {
        newsArticles.add(NewsModal.formJosn(article));
      }
      log(newsArticles.first.title);
      return right(newsArticles);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
