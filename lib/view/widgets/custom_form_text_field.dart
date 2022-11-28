import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_text.dart';

class CustomFormTextField extends StatelessWidget {
  String title;
  String hint;
  void Function(String?) onSave;
  String? Function(String?) validator;
  bool obsecureText;
  CustomFormTextField(
      {Key? key,
      required this.title,
      required this.hint,
      required this.onSave,
      required this.validator,
      this.obsecureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: Colors.grey.shade700,
        ),
        TextFormField(
          obscureText: obsecureText,
          onSaved: onSave,
          validator: validator,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
