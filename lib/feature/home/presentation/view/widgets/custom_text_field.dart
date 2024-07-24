import 'package:flutter/material.dart';
import 'package:task_app/core/functions/build_border.dart';

import '../../../../../constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.onSaved,
    this.onChanged,
    this.initialValue,
  });
  final String? hint;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Feiled is Required';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      onChanged: onChanged,
      cursorColor: kSecondaryColor,
      initialValue: initialValue,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(kPrimaryColor),
        focusedBorder: buildBorder(kSecondaryColor),
        hintText: hint,
      ),
    );
  }
}
