import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final Color bgColor;
  final double iconSize;
  const AppIcon(
      {super.key,
      required this.icon,
      this.iconColor = const Color(0xff756d54),
      this.size = 40,
        this.iconSize = 16,
      this.bgColor = const Color(0xfffcf4e4)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: bgColor
      ),
      child: Icon(icon,color: iconColor,size: iconSize,),
    );
  }
}
