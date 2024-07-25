import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/functions/show_snakbar.dart';
import 'package:task_app/core/utils/app_styles.dart';
import 'package:task_app/core/utils/assets.dart';
import 'package:task_app/feature/home/manger/books/book_cubit.dart';
import 'package:task_app/feature/home/presentation/view/widgets/custom_text_button.dart';

import '../../../../../core/functions/build_number_books.dart';
import '../../../data/models/book_model.dart';

class BackBookbody extends StatefulWidget {
  const BackBookbody({super.key, required this.book});
  final BookModel book;
  @override
  State<BackBookbody> createState() => _BackBookbodyState();
}

class _BackBookbodyState extends State<BackBookbody> {
  int? firstNumberBook;
  void myMethod() async {
    firstNumberBook = await getNumberBooks();
    // Rest of your code
  }

  @override
  void initState() {
    myMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int numberReturnBook = int.parse(widget.book.numberBooks);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.asset(Assets.image),
          ),
          const SizedBox(
            height: 32,
          ),
          Text('Book Name :  ${widget.book.bookName}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:
                  AppStyles.textStyle20.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Auther Name :  ${widget.book.autherName}',
            style:
                AppStyles.textStyle16.copyWith(color: const Color(0xffADACB2)),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Number Of Books :  $numberReturnBook',
              style: AppStyles.textStyle16),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Version Number :  ${widget.book.versionNumber}',
            style: AppStyles.textStyle16,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomContainerButton(
            title: 'Return Book',
            height: 50,
            onTap: () {
              log('numberReturnBook = $numberReturnBook');
              log('firstNumberBook = $firstNumberBook');

              if (numberReturnBook < firstNumberBook!) {
                numberReturnBook += 1;
                widget.book.numberBooks = numberReturnBook.toString();
                setState(() {});
                log('numberReturnBook = $numberReturnBook');
                log('Return Book = ${widget.book.numberBooks}');
              } else {
                showSnakBar(
                    context, 'The maximum number of books has been returned');
              }
              BlocProvider.of<BookCubit>(context).fatchAllBooks();
            },
          )
        ],
      ),
    );
  }
}
