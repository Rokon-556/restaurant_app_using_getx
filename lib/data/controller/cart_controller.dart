import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepository cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;



  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if(_items.containsKey(product.id)){
      _items.update(product.id!, (value){
        totalQuantity = value.quantity!+quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            isExist: true,
            img: value.img,
            quantity: totalQuantity,
            // quantity: value.quantity!+quantity,
            time: DateTime.now().toIso8601String());
      });
      if(totalQuantity<=0){
        _items.remove(product.id);
      }
    }else{
     if(quantity>0){
       _items.putIfAbsent(
         product.id ?? 1,
             () {
           return CartModel(
               id: product.id,
               name: product.name,
               price: product.price,
               isExist: true,
               img: product.img,
               quantity: quantity,
               time: DateTime.now().toIso8601String());
         },
       );
     }else{
         Get.snackbar('Item Count', 'You should add at least an item !',
             backgroundColor: AppColors.mainColor, colorText: Colors.white);
     }
    }



  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product){
    var quantity = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key == product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totaItems{
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity = totalQuantity + value.quantity!;
    });
    return totalQuantity;
  }


}
