import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiservices_app/features/home/books/data/models/BookModel.dart';
import 'package:multiservices_app/features/home/books/data/repos/book_repo_impl.dart';

part 'get_top_books_state.dart';

class GetTopBooksCubit extends Cubit<GetTopBooksState> {
  GetTopBooksCubit(this.bookRepo) : super(GetTopBooksInitial());
  final BookRepoImpl bookRepo;
  Future<void> getTopBooks({
    @required String? booksType,
    @required String? filter,
    @required String? orderby,
  }) async {
    emit(GetTopBooksLoading());
    var result = await bookRepo.getTopBooks(
      booksType: booksType,
      filter: filter,
      orderby: orderby,
    );
    result.fold(
      (failure) => emit(GetTopBooksFailure(errorMessage: failure.errorMessage)),
      (books) => emit(GetTopBooksSuccess(books: books)),
    );
  }
}
