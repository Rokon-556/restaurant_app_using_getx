import 'dart:developer';
import 'package:food_delivery/data/repository/recommened_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class RecommenededProductListController extends GetxController{
  final RecommenededProductRepo recommendedProductRepo;
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList=>_recommendedProductList;
  bool isLoaded = false;
  RecommenededProductListController({required this.recommendedProductRepo});

  Future<void> getRecommendedProductList()async{
    Response response = await recommendedProductRepo.getRecommenededProductList();
    if(response.statusCode == 200){
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products as Iterable);
      log('Length:${_recommendedProductList.length}+'+'recommed');
      isLoaded = true;
      update();
    }else{}
  }
}