import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  String title;
  String imgPath;
  VoidCallback onPressed;
  CustomSocialButton(
      {Key? key,
      required this.title,
      required this.imgPath,
      required this.onPressed})
      : super(key: key);
  late double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1)),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
        ),
        child: Row(
          children: [
            Image.asset(imgPath),
            SizedBox(
              width: _deviceWidth * 0.17,
            ),
            CustomText(
              text: title,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
