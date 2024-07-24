class AddBookStates {}

class AddBookinitialState extends AddBookStates {}

class AddBookLoadingState extends AddBookStates {}

class AddBookSuccesState extends AddBookStates {}

class AddBookFaulireState extends AddBookStates {
  final String errorMasseges;
  AddBookFaulireState({required this.errorMasseges});
}
