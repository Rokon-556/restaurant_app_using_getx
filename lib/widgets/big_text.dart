import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double textSize;
  TextOverflow textOverflow;
  BigText(
      {super.key,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.textSize = 20,
      this.textOverflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontSize: textSize,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto'),
    );
  }
}
