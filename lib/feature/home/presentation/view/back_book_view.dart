import 'package:flutter/material.dart';
import 'package:task_app/feature/home/presentation/view/widgets/back_book_view.dart';
import '../../data/models/book_model.dart';

class BackBookView extends StatelessWidget {
  const BackBookView({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<AddBookCubit>(context).firstNumberBook;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Return Book'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: BackBookbody(book: book));
  }
}
