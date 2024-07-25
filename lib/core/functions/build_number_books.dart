import 'package:shared_preferences/shared_preferences.dart';

Future<void> setNumberBooks(int numberBooks) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('numberBooks', numberBooks);
}

Future<int> getNumberBooks() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('numberBooks')!;
}
