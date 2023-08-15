import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/food_name_column.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimension.foodDetailImageSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/food0.png'),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: Dimension.height60,
              left: Dimension.width20,
              right: Dimension.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart)
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: Dimension.foodDetailImageSize - 25,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  top: Dimension.height20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimension.radius20),
                    topRight: Radius.circular(Dimension.radius20),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodNameColumn(
                    text: 'Bitter Orange Marinade',
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  BigText(
                    text: "Introduce",
                    textSize: 18,
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text:
                                  'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book hhf ejhsihdas idguiqweyqwude uidgqwu8dtqw9 uiwdgyuqwdgaswidb aqidgqwuiegqwu8 asdhyas ajsikdgqwuidg jskdgaikdhqwui iAKDHIKAQDGH JKWDHQWUIDYQW UIQWDHASIDHA AISDHAUOwdh hiaswduqwodb ajhdgqwyud  UIWDTQWUIE ASDIHASDK;DP WUIDYTQWUIEDTGQ UIDGQWUIDTQW8OEB ASDHASWoidagswdaqowduiqwodqbk dawsidugqw8dt awdtqwu8idtqw aWSDUIGQW8DEO QWIDEGTQWDE DGQWUDETQWETQWD QWIDTQW8DTQWO8')))
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
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
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  BigText(
                    text: '0',
                    textSize: 18,
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
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
      ),
    );
  }
}
