import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/home/manger/books/book_cubit.dart';
import 'package:task_app/feature/home/manger/books/book_state.dart';
import 'package:task_app/feature/home/presentation/view/widgets/home_list_view_item.dart';
import '../../../data/models/book_model.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        if (state is BookInitial) {
          return const Center(
            child: Text('there is no book'),
          );
        }
        List<BookModel> books = BlocProvider.of<BookCubit>(context).books ?? [];
        return ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: HomeListViewItem(book: books[index]),
          ),
        );
      },
    );
  }
}
