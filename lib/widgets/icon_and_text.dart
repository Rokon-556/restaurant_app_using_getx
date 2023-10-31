import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  const IconAndText({super.key, required this.text, required this.icon, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimension.icon24,),
        SizedBox(width: 3,),
        SmallText(text: text),
      ],
    );
  }
}
