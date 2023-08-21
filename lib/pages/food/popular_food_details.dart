import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/cart_controller.dart';
import 'package:food_delivery/data/controller/popular_product_list_controller.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
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
  final String page;
  const PopularFoodDetail({super.key, required this.pageId,required this.page});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductListController>().productList[pageId];
    Get.find<PopularProductListController>()
        .initProduct(product, Get.find<CartController>());
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
                      onTap: () {
                        if(page == 'cartpage'){
                          Get.toNamed(AppRoutes.getCart());
                        }else{
                          Get.toNamed(AppRoutes.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios),
                    ),
                    GetBuilder<PopularProductListController>(
                        builder: (popularController) {
                      return InkWell(
                        onTap: () {
                          if(popularController.totalItems >= 1)
                            Get.toNamed(
                              AppRoutes.getCart(),
                            );
                        },
                        child: Stack(
                          children: [
                            AppIcon(icon: Icons.shopping_cart),
                            popularController.totalItems >= 1
                                ? Positioned(
                                    top: 0,
                                    right: 0,
                                    child: AppIcon(
                                      icon: Icons.circle,
                                      size: 20,
                                      iconColor: Colors.transparent,
                                      bgColor: AppColors.mainColor,
                                    ),
                                  )
                                : Container(),
                            popularController.totalItems >= 1
                                ? Positioned(
                                    top: 3,
                                    right: 3,
                                    child: BigText(
                                      text:
                                          popularController.totalItems.toString(),
                                      textSize: 12,
                                      color: Colors.white,
                                    ))
                                : Container(),
                          ],
                        ),
                      );
                    })
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
                        child: ExpandableTextWidget(
                            text: product?.description ?? ''),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductListController>(
          builder: (popularProduct) {
            return BottomSection(
              widget: Row(
                children: [
                  InkWell(
                    onTap: () => popularProduct.setQuantity(false),
                    child: Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    ),
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  BigText(
                    text: popularProduct.inCartItem.toString(),
                    textSize: 18,
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  InkWell(
                    onTap: () => popularProduct.setQuantity(true),
                    child: Icon(
                      Icons.add,
                      color: AppColors.signColor,
                    ),
                  ),
                ],
              ),
              price: product.price.toString(),
              onTap: () => popularProduct.addItem(product),
            );
          },
        ));
  }
}
