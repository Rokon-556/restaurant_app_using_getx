import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommenededProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommenededProductRepo({required this.apiClient});

  Future<Response> getRecommenededProductList() async{
    return await apiClient.getData(AppConstants.RECOMMENDED_FOOD_LIST);

  }

}