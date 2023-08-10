import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double textSize;
  double height;
  SmallText({
    super.key,
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.textSize = 12,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: textSize,
          height: height,
          fontFamily: 'Roboto'),
    );
  }
}
