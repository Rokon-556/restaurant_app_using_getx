import 'package:food_delivery/data/repository/order_repo.dart';
import 'package:food_delivery/models/place_order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController implements GetxService{
  final OrderRepo orderRepo;
  OrderController({required this.orderRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> placeOrder(PlaceOrderModel placeOrderModel , Function callBackFunc)async{
    _isLoading = true;
    Response response = await orderRepo.placeOrder(placeOrderModel);
    if(response.statusCode == 200){
      _isLoading = false;
      String stringText = response.body['message'];
      String orderId = response.body['order_id'].toString();
      callBackFunc(true,stringText,orderId);
    }else{
      callBackFunc(false,response.statusText!,'-1');
    }
  }
}