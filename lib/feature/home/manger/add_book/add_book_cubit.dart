import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/constant.dart';
import 'package:task_app/feature/home/manger/add_book/add_book_state.dart';

import '../../data/models/book_model.dart';

class AddBookCubit extends Cubit<AddBookStates> {
  AddBookCubit() : super(AddBookinitialState());
  // int? numberBooks;
  getBook(BookModel book) async {
    // book.numberBooks = numberBooks.toString();

    emit(AddBookLoadingState());
    try {
      var addBook = Hive.box<BookModel>(kBooksBox);
      await addBook.add(book);
      emit(AddBookSuccesState());
    } catch (e) {
      emit(AddBookFaulireState(errorMasseges: e.toString()));
    }
  }
}
