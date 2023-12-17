import 'dart:developer';

import 'package:food_delivery/data/repository/order_repo.dart';
import 'package:food_delivery/models/order_model.dart';
import 'package:food_delivery/models/place_order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController implements GetxService {
  final OrderRepo orderRepo;
  OrderController({required this.orderRepo});
  bool _isLoading = false;
  late List<OrderModel> _currentOrderList;
  late List<OrderModel> _historyOrderList;
  bool get isLoading => _isLoading;
  List<OrderModel> get currentOrderList => _currentOrderList;
  List<OrderModel> get historyOrderList => _historyOrderList;

  Future<void> placeOrder(
      PlaceOrderModel placeOrderModel, Function callBackFunc) async {
    _isLoading = true;
    Response response = await orderRepo.placeOrder(placeOrderModel);
    if (response.statusCode == 200) {
      _isLoading = false;
      String stringText = response.body['message'];
      String orderId = response.body['order_id'].toString();
      callBackFunc(true, stringText, orderId);
    } else {
      callBackFunc(false, response.statusText!, '-1');
    }
  }

  Future<void> getOrderList() async {
    _isLoading = true;
    Response response = await orderRepo.getOrderList();
    if (response.statusCode == 200) {
      _historyOrderList = [];
      _currentOrderList = [];
      response.body.forEach((order) {
        OrderModel orderModel = OrderModel.fromJson(order);
        if (orderModel.orderStatus == 'pending' ||
            orderModel.orderStatus == 'picked_up' ||
            orderModel.orderStatus == 'accepted' ||
            orderModel.orderStatus == 'processing' ||
            orderModel.orderStatus == 'handover') {
          _currentOrderList.add(orderModel);
        } else {
          _historyOrderList.add(orderModel);
        }
      });
    } else {
      _historyOrderList = [];
      _currentOrderList = [];
    }
    _isLoading = false;
    update();
  }
}
