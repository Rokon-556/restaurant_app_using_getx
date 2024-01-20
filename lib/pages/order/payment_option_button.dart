import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/order_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/utils/styles.dart';
import 'package:get/get.dart';

class PaymentOptionButton extends StatelessWidget {
  final IconData leadingIcon;
  final String paymentTitle;
  final String paymentDescription;
  final int index;

  const PaymentOptionButton(
      {super.key,
      required this.leadingIcon,
      required this.paymentTitle,
      required this.paymentDescription,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController) {
      bool _selectedIndex = orderController.paymentIndex == index;
      return InkWell(
        onTap: () => orderController.setPaymentIndex(index),
        child: Container(
          padding: EdgeInsets.only(bottom: Dimension.height20 / 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.radius10 / 2),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[200]!, blurRadius: 5, spreadRadius: 1)
              ]),
          child: ListTile(
            leading: Icon(
              leadingIcon,
              color: _selectedIndex? AppColors.mainColor: Theme.of(context).disabledColor,
              size: 40,
            ),
            title: Text(
              paymentTitle,
              style: robotoMedium.copyWith(fontSize: Dimension.font20),
            ),
            subtitle: Text(
              paymentDescription,
              style: robotoMedium.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontSize: Dimension.font20 - 4),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: _selectedIndex
                ? Icon(
                    Icons.check_circle_outline,
                    color: AppColors.mainColor,
                  )
                : null,
          ),
        ),
      );
    });
  }
}
