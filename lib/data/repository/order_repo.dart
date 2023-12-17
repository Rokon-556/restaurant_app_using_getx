import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/place_order_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class OrderRepo{
  final ApiClient apiClient;
  OrderRepo({required this.apiClient});

  Future<Response> placeOrder(PlaceOrderModel placeOrderModel)async{
    return await apiClient.postData(AppConstants.PLACE_ORDER_URI,placeOrderModel.toJson());
  }

  Future<Response> getOrderList()async{
    return await apiClient.getData(AppConstants.ORDER_LIST_URI);
  }
}