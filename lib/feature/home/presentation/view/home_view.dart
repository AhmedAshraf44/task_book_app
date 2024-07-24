import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/constant.dart';
import 'package:task_app/feature/home/manger/books/book_cubit.dart';
import 'package:task_app/feature/home/presentation/view/widgets/add_book_bottom_sheet.dart';
import 'package:task_app/feature/home/presentation/view/widgets/home_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<BookCubit>(context).fatchAllBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Book App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
            context: context,
            builder: (context) {
              return const AddBookBottomSheet();
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: kSecondaryColor,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: HomeListView(),
      ),
    );
  }
}
