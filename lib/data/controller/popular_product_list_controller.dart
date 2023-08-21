import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

import '../../models/cart_model.dart';

class PopularProductListController extends GetxController {
  final PopularProductRepo productRepo;
  List<dynamic> _productList = [];
  List<dynamic> get productList => _productList;
  bool isLoaded = false;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;
  late CartController _cartController;
  PopularProductListController({required this.productRepo});

  Future<void> getPopularProductList() async {
    Response response = await productRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _productList = [];
      _productList.addAll(Product.fromJson(response.body).products as Iterable);
      log('Length:${_productList.length}');
      isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_inCartItem + quantity < 0) {
      Get.snackbar('Item Count', 'You cannot reduce more !',
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if(_inCartItem>0){
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else if (_inCartItem + quantity > 20) {
      Get.snackbar('Item Count', 'You cannot add more !',
          backgroundColor: AppColors.mainColor, colorText: Colors.white);

      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cartController) {
    _quantity = 0;
    _inCartItem = 0;
    _cartController = cartController;
    var exist = false;
    exist = _cartController.existInCart(product);
    log(exist.toString());
    if (exist) {
      _inCartItem = _cartController.getQuantity(product);
    }
    log(_inCartItem.toString());
  }

  void addItem(ProductModel productModel) {
    _cartController.addItem(productModel, _quantity);
    _quantity = 0;
    _inCartItem = _cartController.getQuantity(productModel);
    _cartController.items.forEach((key, value) {
      log("the id is :${value.id.toString()} and quantity is :${value.quantity.toString()}");
    });
    update();
  }

  int get totalItems {
    return _cartController.totaItems;
  }

  List<CartModel> get cartItem{
    return _cartController.getCartItems;
  }
}
