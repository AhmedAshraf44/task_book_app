import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/feature/home/data/models/book_model.dart';
import 'package:task_app/feature/home/manger/books/book_state.dart';

import '../../../../constant.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());
  List<BookModel>? books;

  fatchAllBooks() {
    var bookBox = Hive.box<BookModel>(kBooksBox);
    books = bookBox.values.toList();
    //rebuild form to emit()
    emit(BookSuccess());
  }
}
