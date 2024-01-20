import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/order_controller.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/utils/styles.dart';
import 'package:get/get.dart';

class DeliveryOption extends StatelessWidget {
  final String value;
  final String title;
  final double amount;
  final bool isFree;
  const DeliveryOption(
      {super.key,
      required this.value,
      required this.title,
      required this.amount,
      required this.isFree});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller){
      return Row(
        children: [
          Radio(
              activeColor: Theme.of(context).primaryColor,
              value: value,
              groupValue: controller.deliveryOption,
              onChanged: (String? value) {
                controller.setDeliveryOption(value!);
              }),
          SizedBox(
            width: Dimension.width10 / 2,
          ),
          Text(
            title,
            style: robotoRegular,
          ),
          SizedBox(
            width: Dimension.width10 / 2,
          ),
          Text(
            '(${(value == 'take away' || isFree) ? 'free' : '\$${amount / 10}'})',
            style: robotoMedium,
          )
        ],
      );
    });
  }
}
