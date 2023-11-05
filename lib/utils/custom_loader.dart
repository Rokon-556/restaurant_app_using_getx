import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';


class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.height20*5,
      width: Dimension.height20*5,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.all(Radius.circular(Dimension.radius20))
      ),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(color: Colors.white,),
    );
  }
}
