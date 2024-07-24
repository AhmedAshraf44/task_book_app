import 'package:go_router/go_router.dart';
import '../../feature/home/data/models/book_model.dart';
import '../../feature/home/presentation/view/borrowers_view.dart';
import '../../feature/home/presentation/view/home_view.dart';
import '../../feature/home/presentation/view/back_book_view.dart';

abstract class AppRouter {
  static const kBorrowersView = '/BorrowersView';
  static const kBackBookView = '/BackBookView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
          path: kBorrowersView,
          builder: (context, state) {
            final bookModel = state.extra as BookModel?;
            return BorrowersView(book: bookModel!);
          }),
      GoRoute(
          path: kBackBookView,
          builder: (context, state) {
            final bookModel = state.extra as BookModel?;
            return BackBookView(book: bookModel!);
          }),
    ],
  );
}
