import 'package:flutter/material.dart';
import 'package:task_app/feature/home/data/models/book_model.dart';
import 'package:task_app/feature/home/presentation/view/widgets/borrowers_body.dart';

class BorrowersView extends StatelessWidget {
  const BorrowersView({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Borrowers Book'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: BorrowersBody(
          book: book,
        ));
  }
}
