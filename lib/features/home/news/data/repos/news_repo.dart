import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/api_failure.dart';
import 'package:multiservices_app/features/home/news/data/Models/news_modal.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<NewsModal>>> getNews({
    @required String? category,
    @required String? lang,
    @required String? sortBy,
  });
}
