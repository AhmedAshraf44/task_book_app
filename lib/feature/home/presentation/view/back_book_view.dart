import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/functions/show_snakbar.dart';
import 'package:task_app/core/utils/app_styles.dart';
import 'package:task_app/feature/home/presentation/view/widgets/custom_text_button.dart';

import '../../data/models/book_model.dart';
import '../../manger/books/book_cubit.dart';

class BackBookView extends StatefulWidget {
  const BackBookView({super.key, required this.book});
  final BookModel book;

  @override
  State<BackBookView> createState() => _BackBookViewState();
}

class _BackBookViewState extends State<BackBookView> {
  @override
  Widget build(BuildContext context) {
    int numberReturnBook = int.parse(widget.book.numberBooks);
    // int firstNumberBook = int.parse(widget.book.firstNumberBook);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Return Book'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SizedBox()
        //  Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       AspectRatio(
        //         aspectRatio: 3 / 2,
        //         child: Image.asset('assets/images/image1.jpeg'),
        //       ),
        //       const SizedBox(
        //         height: 32,
        //       ),
        //       Text('Book Name :  ${widget.book.bookName}',
        //           maxLines: 2,
        //           overflow: TextOverflow.ellipsis,
        //           style: AppStyles.textStyle20
        //               .copyWith(fontWeight: FontWeight.bold)),
        //       const SizedBox(
        //         height: 16,
        //       ),
        //       Text(
        //         'Auther Name :  ${widget.book.autherName}',
        //         style: AppStyles.textStyle16
        //             .copyWith(color: const Color(0xffADACB2)),
        //       ),
        //       const SizedBox(
        //         height: 16,
        //       ),
        //       Text('Number Of Books :  $numberReturnBook',
        //           style: AppStyles.textStyle16),
        //       const SizedBox(
        //         height: 16,
        //       ),
        //       Text(
        //         'Version Number :  ${widget.book.versionNumber}',
        //         style: AppStyles.textStyle16,
        //       ),
        //       const SizedBox(
        //         height: 32,
        //       ),
        //       CustomTextButton(
        //         title: 'Return Book',
        //         height: 50,
        //         onTap: () {
        //           if (numberReturnBook < 3) {
        //             numberReturnBook += 1;
        //             widget.book.numberBooks = numberReturnBook.toString();
        //             setState(() {});
        //             // debugPrint('bookNumber = $firstNumberBook');
        //             debugPrint('book numberBooks = ${widget.book.numberBooks}');
        //           } else {
        //             showSnakBar(
        //                 context, 'The maximum number of books has been returned');
        //           }
        //           BlocProvider.of<BookCubit>(context).fatchAllBooks();
        //         },
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
