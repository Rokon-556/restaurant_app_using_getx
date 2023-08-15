import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';

import '../utils/colors.dart';
import '../utils/dimension.dart';

class BottomSection extends StatelessWidget {
  final Widget widget;
  const BottomSection({super.key,required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.bottomHeight,
      padding: EdgeInsets.symmetric(
          horizontal: Dimension.width20, vertical: Dimension.height20),
      decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimension.radius20),
            topRight: Radius.circular(Dimension.radius20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: Dimension.height20, horizontal: Dimension.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white),
            child: widget,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: Dimension.height20, horizontal: Dimension.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: AppColors.mainColor),
            child: BigText(
              text: '\$10 | Add To Cart',
              color: Colors.white,
              textSize: 18,
            ),
          )
        ],
      ),
    );
  }
}



