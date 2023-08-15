import 'dart:developer';

import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductListController extends GetxController{
  final PopularProductRepo productRepo;
  List<dynamic> _productList = [];
  List<dynamic> get productList=>_productList;
  bool isLoaded = false;
  PopularProductListController({required this.productRepo});

  Future<void> getPopularProductList()async{
    Response response = await productRepo.getPopularProductList();
    if(response.statusCode == 200){
      _productList = [];
       _productList.addAll(Product.fromJson(response.body).products as Iterable);
       log('Length:${_productList.length}');
       isLoaded = true;
      update();
    }else{}
  }
}