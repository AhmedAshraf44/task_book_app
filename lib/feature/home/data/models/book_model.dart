import 'package:hive/hive.dart';
part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel extends HiveObject {
  @HiveField(0)
  final String bookName;
  @HiveField(1)
  final String autherName;
  @HiveField(2)
  String numberBooks;
  @HiveField(3)
  final String versionNumber;
  // @HiveField(4)
  // final String firstNumberBook;

  BookModel({
    required this.bookName,
    required this.autherName,
    required this.numberBooks,
    required this.versionNumber,
    // required this.firstNumberBook,
  });
}
