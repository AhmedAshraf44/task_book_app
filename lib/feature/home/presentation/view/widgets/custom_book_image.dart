import 'package:flutter/material.dart';
import 'package:task_app/core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Image.asset(
          Assets.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
