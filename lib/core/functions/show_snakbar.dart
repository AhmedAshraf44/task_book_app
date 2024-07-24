import 'package:flutter/material.dart';
import 'package:task_app/constant.dart';

void showSnakBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kSecondaryColor,
      content: Text(
        text,
        style: const TextStyle(color: kPrimaryColor, fontSize: 15),
      ),
    ),
  );
}
