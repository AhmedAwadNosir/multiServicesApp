import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:multiservices_app/core/services/api_services.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/api_failure.dart';
import 'package:multiservices_app/features/home/books/data/models/BookModel.dart';
import 'package:multiservices_app/features/home/books/data/repos/book_repo.dart';

class BookRepoImpl implements BookRepo {
  final ApiServices apiServices = ApiServices(
    dio: Dio(),
    baseUrl: "https://www.googleapis.com/books/v1/volumes?",
  );

  @override
  Future<Either<Failure, List<BookModel>>> getBestSellerBooks({
    String? booksType,
    String? filter,
    String? orderby,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            "q=${booksType ?? "all"}&filter=${filter ?? "free-ebooks"}&orderBy=relevance",
      );
      List<BookModel> books = [];
      for (var book in data["items"]) {
        books.add(BookModel.fromjson(book));
      }
      log("firstBook:${books.first.author ?? ""}");
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getTopBooks({
    String? booksType,
    String? filter,
    String? orderby,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            "q=${booksType ?? "all"}&filter=${filter ?? "free-ebooks"}&orderBy=newest",
      );
      List<BookModel> books = [];
      for (var book in data["items"]) {
        books.add(BookModel.fromjson(book));
      }
      log("firstBook:${books.first.price ?? ""}");
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
