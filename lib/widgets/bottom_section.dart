import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';

import '../utils/colors.dart';
import '../utils/dimension.dart';

class BottomSection extends StatelessWidget {
  final Widget? widget;
  final String? price;
  final VoidCallback? onTap;
  final VoidCallback? paymentButtonTapped;
  final String? buttonText;
  final bool isCartPage;
  const BottomSection({super.key,this.widget, this.price,this.onTap,this.buttonText,required this.isCartPage,this.paymentButtonTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.bottomHeight+50,
      padding: EdgeInsets.symmetric(
          horizontal: Dimension.width20, vertical: Dimension.height10),
      decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimension.radius20),
            topRight: Radius.circular(Dimension.radius20),
          )),
      child: Column(
        children: [
          isCartPage ? InkWell(
            onTap: paymentButtonTapped,
            child: Container(
width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                  vertical: Dimension.height20, horizontal: Dimension.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: AppColors.mainColor,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(0,5),
                        color: AppColors.mainColor.withOpacity(0.3)
                    ),
                  ]
              ),
              child: Center(
                child: BigText(
                  text: 'Payment Option',
                  color: Colors.white,
                  textSize: 18,
                ),
              ),
            ),
          ):Container(),
          SizedBox(height: 10,),
          Row(
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
                      color: AppColors.mainColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0,5),
                      color: AppColors.mainColor.withOpacity(0.3)
                    ),
                  ]
                  ),
                  child: BigText(
                    text: buttonText ?? '\$$price | Add To Cart',
                    color: Colors.white,
                    textSize: 18,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}



