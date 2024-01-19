import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/custom_loader.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/utils/styles.dart';
import 'package:get/get.dart';

import '../../data/controller/order_controller.dart';
import '../../models/order_model.dart';

class ViewOrderPage extends StatelessWidget {
  final bool isCurrent;
  const ViewOrderPage({super.key, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrderController>(builder: (orderController) {
        if (orderController.isLoading == false) {
          late List<OrderModel> orderList;
          // List<OrderModel> orderList = [];
          if (orderController.currentOrderList.isNotEmpty ||
              orderController.historyOrderList.isNotEmpty) {
            // orderList.addAll(isCurrent
            //     ? orderController.currentOrderList.reversed
            //     : orderController.historyOrderList.reversed);
            orderList = isCurrent
                ? orderController.currentOrderList.reversed.toList()
                : orderController.historyOrderList.reversed.toList();
          }

          return SizedBox(
            width: Dimension.deviceWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListView.builder(
                  itemCount: orderList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text('Order ID',style: robotoRegular.copyWith(fontSize: Dimension.font20-8),
                                      ),
                                  SizedBox(
                                    width: Dimension.width10,
                                  ),
                                  Text('#${orderList[index].id}',style: robotoRegular.copyWith(fontSize: Dimension.font20-8),)
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 3),
                                      child: Text(
                                        orderList[index].orderStatus ?? '',
                                        style: robotoBold.copyWith(fontSize: Dimension.font20-8,color: Theme.of(context).cardColor),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.mainColor),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 2),
                                      child: Row(children: [
                                        Image.asset('assets/image/tracking.png',height: 15,width: 15,),
                                        SizedBox(width: 5,),
                                        Text('Track Order',style: robotoMedium.copyWith(color: AppColors.mainColor,fontSize: Dimension.font20-8),),
                                      ],),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          );
        } else {
          return CustomLoader();
        }
      }),
    );
  }
}
