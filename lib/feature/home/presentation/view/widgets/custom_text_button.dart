import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.title, this.onTap, this.height});
  final String title;
  final void Function()? onTap;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          decoration: ShapeDecoration(
              color: kSecondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: Center(
            child: Text(
              title,
              style: AppStyles.textStyle16.copyWith(color: kPrimaryColor),
            ),
          )),
    );
  }
}
