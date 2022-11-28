import 'package:ecommerce_app_getx/constants.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onPressed;
  String title;

  CustomButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(),
        ),
      ),
      child: CustomText(
        text: title,
        alignment: Alignment.center,
        color: Colors.white,
      ),
    );
  }
}
