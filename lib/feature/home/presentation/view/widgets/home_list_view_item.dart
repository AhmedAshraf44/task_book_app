import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/constant.dart';
import 'package:task_app/core/functions/show_snakbar.dart';
import 'package:task_app/core/utils/app_router.dart';
import 'package:task_app/feature/home/presentation/view/widgets/custom_book_image.dart';
import 'package:task_app/feature/home/presentation/view/widgets/custom_text_button.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/book_model.dart';
import '../../../manger/books/book_cubit.dart';

class HomeListViewItem extends StatelessWidget {
  const HomeListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          book.delete();
          BlocProvider.of<BookCubit>(context).fatchAllBooks();
          showSnakBar(context, 'The note has been successfully deleted');
        },
        child: SizedBox(
          height: 180,
          child: Row(
            children: [
              const CustomBookImage(),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(book.bookName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      book.autherName,
                      style: AppStyles.textStyle14
                          .copyWith(color: const Color(0xffADACB2)),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text('Number Of Books : ${book.numberBooks}',
                        style: AppStyles.textStyle14),
                    Text(
                      'Version Number : ${book.versionNumber}',
                      style: AppStyles.textStyle14,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextButton(
                      title: "Brrowers Books",
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kBorrowersView, extra: book);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextButton(
                      title: "Return Books",
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kBackBookView, extra: book);
                      },
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  book.delete();
                  BlocProvider.of<BookCubit>(context).fatchAllBooks();
                  showSnakBar(
                      context, 'The book has been successfully deleted');
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 20,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
