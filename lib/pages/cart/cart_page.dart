import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/auth_controller.dart';
import 'package:food_delivery/data/controller/cart_controller.dart';
import 'package:food_delivery/data/controller/location_controller.dart';
import 'package:food_delivery/data/controller/order_controller.dart';
import 'package:food_delivery/data/controller/popular_product_list_controller.dart';
import 'package:food_delivery/data/controller/user_controller.dart';
import 'package:food_delivery/models/place_order_model.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/utils/show_custom_snackbar.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/no_data_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../data/controller/recommended_product_list_controller.dart';
import '../../routes/app_routes.dart';
import '../../widgets/bottom_section.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimension.radius20 * 3.5,
              right: Dimension.width20,
              left: Dimension.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    bgColor: AppColors.mainColor,
                  ),
                  SizedBox(
                    width: Dimension.width20 * 6,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(
                      AppRoutes.getInitial(),
                    ),
                    child: AppIcon(
                      icon: Icons.home,
                      iconColor: Colors.white,
                      bgColor: AppColors.mainColor,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    bgColor: AppColors.mainColor,
                  )
                ],
              )),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getCartItems.length == 0
                ? const NoDataWidget(text: 'Your cart is empty')
                : Positioned(
                    top: Dimension.height20 * 5.2,
                    right: Dimension.width20,
                    left: Dimension.width20,
                    bottom: 0,
                    child: GetBuilder<CartController>(
                      builder: (cartController) {
                        return ListView.builder(
                            itemCount: cartController.getCartItems.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      var popularIndex = Get.find<
                                              PopularProductListController>()
                                          .productList
                                          .indexOf(cartController
                                              .getCartItems[index]
                                              .productModel);
                                      if (popularIndex >= 0) {
                                        Get.toNamed(AppRoutes.getPopularFood(
                                            popularIndex, 'cartpage'));
                                      } else {
                                        var recommendIndex = Get.find<
                                                RecommenededProductListController>()
                                            .recommendedProductList
                                            .indexOf(cartController
                                                .getCartItems[index]
                                                .productModel);
                                        if (recommendIndex < 0) {
                                          Get.snackbar('History Product',
                                              'History product cannot be reviewed !',
                                              backgroundColor:
                                                  AppColors.mainColor,
                                              colorText: Colors.white);
                                        } else {
                                          Get.toNamed(
                                              AppRoutes.getRecommendedFood(
                                                  recommendIndex, 'cartpage'));
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: Dimension.width20 * 5,
                                      height: Dimension.height20 * 5,
                                      margin: EdgeInsets.only(
                                          top: Dimension.height15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimension.radius20),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD +
                                                  cartController
                                                      .getCartItems[index]
                                                      .img!),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimension.width10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                          text: cartController
                                              .getCartItems[index].name!,
                                          color: Colors.black54,
                                        ),
                                        SmallText(text: 'Spicy'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text:
                                                  '\$ ${cartController.getCartItems[index].price} ',
                                              color: Colors.red,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: Dimension.height10,
                                                  horizontal:
                                                      Dimension.width10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimension.radius20),
                                                  color: Colors.white),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () =>
                                                        cartController.addItem(
                                                            cartController
                                                                    .getCartItems[
                                                                        index]
                                                                    .productModel ??
                                                                ProductModel(),
                                                            -1),
                                                    child: Icon(
                                                      Icons.remove,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimension.width10 / 2,
                                                  ),
                                                  BigText(
                                                    text: cartController
                                                        .getCartItems[index]
                                                        .quantity
                                                        .toString(),
                                                    // text: popularProduct.inCartItem.toString(),
                                                    textSize: 18,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimension.width10 / 2,
                                                  ),
                                                  InkWell(
                                                    onTap: () =>
                                                        cartController.addItem(
                                                            cartController
                                                                    .getCartItems[
                                                                        index]
                                                                    .productModel ??
                                                                ProductModel(),
                                                            1),
                                                    child: Icon(
                                                      Icons.add,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              );
                            });
                      },
                    ));
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return cartController.getCartItems.isNotEmpty
              ? BottomSection(
                  widget: Row(
                    children: [
                      SizedBox(
                        width: Dimension.width10 / 2,
                      ),
                      BigText(
                        text: '\$  ${cartController.totalPrice}',
                        textSize: 18,
                      ),
                      SizedBox(
                        width: Dimension.width10 / 2,
                      ),
                    ],
                  ),
                  buttonText: 'Check Out',
                  onTap: () {
                    if (Get.find<AuthController>().userLoggedIn()) {
                      // cartController.addToHistory();
                      if (Get.find<LocationController>().addressList.isEmpty) {
                        Get.toNamed(AppRoutes.getAddressPage());
                      } else {
                        var user = Get.find<UserController>().userModel;
                        var location =
                            Get.find<LocationController>().getUserAddress();
                        var cart = Get.find<CartController>().getCartItems;

                        PlaceOrderModel placeOrder = PlaceOrderModel(
                            cart: cart,
                            orderAmount: 100.0,
                            distance: 10.0,
                            scheduleAt: '',
                            orderNote: '',
                            address: location.address,
                            latitude: location.latitude,
                            longitude: location.longitude,
                            contactPersonName: user?.name ?? '',
                            contactPersonNumber: user?.phone ?? '');
                        Get.find<OrderController>().placeOrder(placeOrder, _callBackFunc);
                      }
                    } else {
                      Get.toNamed(AppRoutes.getSignIn());
                    }
                  },
                )
              : Container(
                  height: Dimension.bottomHeight,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimension.width20,
                      vertical: Dimension.height20),
                  decoration: BoxDecoration(
                      color: AppColors.buttonBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimension.radius20),
                        topRight: Radius.circular(Dimension.radius20),
                      )),
                );
        },
      ),
    );
  }

  void _callBackFunc(bool isSuccess, String message, String orderID) {
    if (isSuccess) {
      Get.offNamed(AppRoutes.getPaymentPage(
          orderID, Get.find<UserController>().userModel!.id));
    } else {
      showCustomSnackBar(message);
    }
  }
}
