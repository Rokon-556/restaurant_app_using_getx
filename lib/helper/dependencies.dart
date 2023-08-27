import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/controller/cart_controller.dart';
import 'package:food_delivery/data/controller/popular_product_list_controller.dart';
import 'package:food_delivery/data/controller/recommended_product_list_controller.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommened_product_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init()async{
  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreference);
  Get.lazyPut(() => ApiClient(baseUrl: AppConstants.BASE_URL));
  // api client
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find())); // repository
  Get.lazyPut(() => RecommenededProductRepo(apiClient: Get.find())); // repository
  Get.lazyPut(()=>CartRepository(preferences: Get.find()));
  
  Get.lazyPut(() => PopularProductListController(productRepo: Get.find())); // controller
  Get.lazyPut(() => RecommenededProductListController(recommendedProductRepo: Get.find()));
  Get.lazyPut(()=>CartController(cartRepo: Get.find()));
}