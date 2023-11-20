import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimension.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;
  final bool transparent;
  final double? height;
  final double? width;
  final double? fontSize;
  final double radius;
  final EdgeInsets? margin;
  final IconData? icon;

  const CustomButton(
      {super.key,
      this.onTap,
      required this.buttonText,
      this.transparent = false,
      this.height,
      this.width,
      this.fontSize,
      this.radius = 5,
      this.margin,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _flatStyle = TextButton.styleFrom(
        backgroundColor: onTap == null
            ? Theme.of(context).disabledColor
            : transparent
                ? Colors.transparent
                : Theme.of(context).primaryColor,
        minimumSize: Size(width == null ? width! : Dimension.deviceWidth,
            height == null ? height! : 50),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius)));

    return Center(
      child: SizedBox(
        width: width ?? Dimension.deviceWidth,
        height: height ?? 50,
        child: TextButton(
            onPressed: () {},
            style: _flatStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null
                    ? Padding(
                        padding: EdgeInsets.only(right: Dimension.width10 / 5),
                        child: Icon(
                          icon,
                          color: transparent
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).cardColor,
                        ),
                      )
                    : SizedBox(),
                Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: fontSize ?? Dimension.font20,
                    color: transparent
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).cardColor,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
