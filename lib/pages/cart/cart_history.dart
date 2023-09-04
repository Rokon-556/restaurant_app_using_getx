import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/cart_controller.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/no_data_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/cart_model.dart';
import '../../widgets/app_icon.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = {};
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time ?? '', (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(
            getCartHistoryList[i].time ?? '', () => 1);
      }
    }
    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartDatetimePerOrderList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();
    var listCounter = 0;

    Widget timeWidget(int index) {
      String formattedTime = '';
      if (index < getCartHistoryList.length) {
        final dateString = getCartHistoryList[listCounter].time;
        final dateTime = DateTime.parse(dateString ?? '');
        formattedTime = DateFormat('MM/dd/yyyy hh:mm a').format(dateTime);
      }
      return BigText(text: formattedTime);
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimension.height60 * 2,
            padding: EdgeInsets.only(top: Dimension.height60),
            width: double.maxFinite,
            color: AppColors.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: 'Cart History',
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  bgColor: AppColors.yellowColor,
                  iconColor: AppColors.mainColor,
                )
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (cartController) {
            return cartController.getCartHistoryList().isNotEmpty
                ? Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: Dimension.height20,
                          left: Dimension.width20,
                          right: Dimension.width20),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          for (int i = 0; i < itemsPerOrder.length; i++)
                            Container(
                              margin:
                                  EdgeInsets.only(bottom: Dimension.height20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  timeWidget(listCounter),
                                  SizedBox(height: Dimension.height10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: List.generate(
                                            itemsPerOrder[i], (index) {
                                          if (listCounter <
                                              getCartHistoryList.length) {
                                            listCounter++;
                                          }
                                          return index <= 2
                                              ? Container(
                                                  height:
                                                      Dimension.height40 * 2,
                                                  width: Dimension.height40 * 2,
                                                  margin: EdgeInsets.only(
                                                      right: Dimension.width10 /
                                                          2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimension.radius10 -
                                                                2),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        AppConstants.BASE_URL +
                                                            AppConstants
                                                                .UPLOAD +
                                                            getCartHistoryList[
                                                                    listCounter -
                                                                        1]
                                                                .img!,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container();
                                        }),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SmallText(
                                            text: 'Total',
                                            color: AppColors.titleColor,
                                          ),
                                          BigText(
                                            text: '${itemsPerOrder[i]} Items',
                                            color: AppColors.titleColor,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              var orderTime =
                                                  cartDatetimePerOrderList();
                                              Map<int, CartModel> moreOrder =
                                                  {};
                                              for (int j = 0;
                                                  j < getCartHistoryList.length;
                                                  j++) {
                                                if (getCartHistoryList[j]
                                                        .time ==
                                                    orderTime[i]) {
                                                  moreOrder.putIfAbsent(
                                                      getCartHistoryList[j].id!,
                                                      () => CartModel.fromJson(
                                                          jsonDecode(jsonEncode(
                                                              getCartHistoryList[
                                                                  j]))));
                                                }
                                              }
                                              Get.find<CartController>()
                                                  .setItems = moreOrder;
                                              Get.find<CartController>()
                                                  .addToCartList();
                                              Get.toNamed(AppRoutes.getCart());
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: Dimension.width10,
                                                vertical:
                                                    Dimension.height10 / 2,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimension.radius15 / 3),
                                                border: Border.all(
                                                    width: 1,
                                                    color: AppColors.mainColor),
                                              ),
                                              child: SmallText(
                                                text: 'one more',
                                                color: AppColors.mainColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  )
                : SizedBox(
                    height: Get.height / 1.5,
                    child: const Center(
                      child: NoDataWidget(
                        text: 'You did not buy anything so far',
                        imgPath: 'assets/image/empty_box.png',
                      ),
                    ),
                  );
          })
        ],
      ),
    );
  }
}
