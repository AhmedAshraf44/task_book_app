import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/home/presentation/view/widgets/add_book_form.dart';

import '../../../../../core/functions/show_snakbar.dart';
import '../../../manger/add_book/add_book_cubit.dart';
import '../../../manger/add_book/add_book_state.dart';
import '../../../manger/books/book_cubit.dart';

class AddBookBottomSheet extends StatelessWidget {
  const AddBookBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddBookCubit, AddBookStates>(
        listener: (context, state) {
      if (state is AddBookFaulireState) {
        debugPrint('failed ${state.errorMasseges}');
      }
      if (state is AddBookSuccesState) {
        BlocProvider.of<BookCubit>(context).fatchAllBooks();
        Navigator.pop(context);
        showSnakBar(context, 'The note has been successfully added');
      }
    }, builder: (context, state) {
      return AbsorbPointer(
        absorbing: state is AddBookLoadingState ? true : false,
        child: Padding(
          padding: EdgeInsets.only(
            right: 16,
            left: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const SingleChildScrollView(
            child: AddBookForm(),
          ),
        ),
      );
    });
  }
}
