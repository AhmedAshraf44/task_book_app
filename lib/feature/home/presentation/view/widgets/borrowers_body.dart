import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/utils/assets.dart';
import 'package:task_app/feature/home/data/models/book_model.dart';
import 'package:task_app/feature/home/presentation/view/widgets/custom_text_button.dart';

import '../../../../../core/functions/show_snakbar.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../manger/books/book_cubit.dart';

class BorrowersBody extends StatefulWidget {
  const BorrowersBody({super.key, required this.book});
  final BookModel book;

  @override
  State<BorrowersBody> createState() => _BorrowersBodyState();
}

class _BorrowersBodyState extends State<BorrowersBody> {
  @override
  Widget build(BuildContext context) {
    int numberOfborrow = int.parse(widget.book.numberBooks);

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
          Text('Number Of Books :  $numberOfborrow',
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
            title: 'Borrowers Book',
            height: 50,
            onTap: () {
              if (numberOfborrow == 0) {
                showSnakBar(context, 'There is no copy of the book to borrow');
              } else {
                numberOfborrow -= 1;
                widget.book.numberBooks = numberOfborrow.toString();
                setState(() {});
                debugPrint('bookNumber = $numberOfborrow');
                debugPrint('book numberBooks = ${widget.book.numberBooks}');
              }
              // BlocProvider.of<AddBookCubit>(context).numberBooks =
              //   numberOfborrow;
              // setState(() {});
              BlocProvider.of<BookCubit>(context).fatchAllBooks();
            },
          )
        ],
      ),
    );
  }
}
