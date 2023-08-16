

import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/popular_product_list_controller.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/bottom_section.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/food_name_column.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductListController>().productList[pageId];
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
                        image: NetworkImage(AppConstants.BASE_URL +
                            AppConstants.UPLOAD +
                            product.img),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: Dimension.height60,
              left: Dimension.width20,
              right: Dimension.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.INITIAL),
                    child: AppIcon(icon: Icons.arrow_back_ios),
                  ),
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
                    text: product?.name ?? '',
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
                      child: ExpandableTextWidget(text: product?.description ?? ''),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomSection(
        widget: Row(
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
        price: product.price.toString(),
      ),
    );
  }
}
