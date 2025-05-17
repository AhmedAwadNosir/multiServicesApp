import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/api_failure.dart';
import 'package:multiservices_app/features/home/books/data/models/BookModel.dart';

abstract class BookRepo {
  Future<Either<Failure, List<BookModel>>> getTopBooks({
    @required String? booksType,
    @required String? filter,
    @required String? orderby,
  });
  Future<Either<Failure, List<BookModel>>> getBestSellerBooks({
    @required String? booksType,
    @required String? filter,
    @required String? orderby,
  });
}
