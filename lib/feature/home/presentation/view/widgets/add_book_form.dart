import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/home/data/models/book_model.dart';
import 'package:task_app/feature/home/manger/add_book/add_book_cubit.dart';
import 'package:task_app/feature/home/presentation/view/widgets/custom_button.dart';
import 'package:task_app/feature/home/presentation/view/widgets/custom_text_field.dart';
import '../../../manger/add_book/add_book_state.dart';

class AddBookForm extends StatefulWidget {
  const AddBookForm({super.key});

  @override
  State<AddBookForm> createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? bookName, autherName;
  String? numberBooks, versionNumber;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'Book Name',
            onSaved: (value) {
              bookName = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hint: 'Author Name',
            onSaved: (value) {
              autherName = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hint: 'Number of Books',
            onSaved: (value) {
              numberBooks = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hint: 'Version number',
            onSaved: (value) {
              versionNumber = value;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddBookCubit, AddBookStates>(
            builder: (context, state) => CustomButton(
              isLoading: state is AddBookLoadingState ? true : false,
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var book = BookModel(
                    bookName: bookName!,
                    autherName: autherName!,
                    numberBooks: numberBooks!,
                    versionNumber: versionNumber!,
                    //firstNumberBook: numberBooks ?? '0',
                  );
                  BlocProvider.of<AddBookCubit>(context).getBook(book);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
