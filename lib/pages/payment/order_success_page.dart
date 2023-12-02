import 'package:flutter/material.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/custom_buutton.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:get/get.dart';

class OrderSuccessPage extends StatelessWidget {
  final String orderId;
  final int orderStatus;
  const OrderSuccessPage(
      {super.key, required this.orderId, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    if (orderStatus == 0) {
      Future.delayed(Duration(seconds: 1), () {});
    }
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Dimension.deviceWidth,
          child: Column(
            children: [
              Image.asset(
                orderStatus == 1
                    ? 'assets/images/checked.png'
                    : 'assets/images/warning.png',
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: Dimension.height40,
              ),
              Text(
                orderStatus == 1
                    ? 'You placed the order successfully '
                    : 'Your order failed',
                style: TextStyle(fontSize: Dimension.font20 + 6),
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              Padding(
                padding: EdgeInsets.all(Dimension.height20),
                child: Text(
                  orderStatus == 1 ? 'Successful order' : 'Failed order',
                  style: TextStyle(
                    fontSize: Dimension.font20,
                    color: Theme.of(context).disabledColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: Dimension.height30,
              ),
              Padding(
                padding: EdgeInsets.all(Dimension.height20),
                child: CustomButton(
                  buttonText: 'Back to Home',
                  onTap: () => Get.offAllNamed(
                    AppRoutes.getInitial(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
