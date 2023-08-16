import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';

import '../utils/colors.dart';
import '../utils/dimension.dart';

class BottomSection extends StatelessWidget {
  final Widget widget;
  final String price;
  final VoidCallback? onTap;
  const BottomSection({super.key,required this.widget, required this.price,this.onTap});

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
          InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: Dimension.height20, horizontal: Dimension.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: AppColors.mainColor),
              child: BigText(
                text: '\$$price | Add To Cart',
                color: Colors.white,
                textSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}



