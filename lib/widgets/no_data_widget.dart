import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataWidget(
      {super.key,
      required this.text,
      this.imgPath = 'assets/image/empty_cart.png'});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          imgPath,
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width * 0.22,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).disabledColor,
            fontSize: MediaQuery.of(context).size.height * 0.0175,
          ),
        )
      ],
    );
  }
}
