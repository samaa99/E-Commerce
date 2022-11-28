import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final Alignment alignment;
  const CustomText({
    Key? key,
    this.text = '',
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }
}
