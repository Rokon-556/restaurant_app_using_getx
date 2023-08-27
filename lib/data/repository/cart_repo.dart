import 'dart:convert';
import 'dart:developer';

import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepository{
  final SharedPreferences preferences;
  CartRepository({required this.preferences});

  List<String> cartItem =[];

  void addCartItems(List<CartModel> cartItems){
    cartItem = [];
    
    cartItems.forEach((element) {
      log('${element.quantity}');
      return cartItem.add(jsonEncode(element));
    });
    preferences.setStringList(AppConstants.CART_ITEM, cartItem);
    getCartList();
    // log('hello share');
    // log('${preferences.getStringList("cart_item")}');
    // log('hello share 2');
  }

  List<CartModel> getCartList(){
    List<String> cartItem = [];
    List<CartModel> cartList = [];
    if(preferences.containsKey(AppConstants.CART_ITEM)){
      cartItem = preferences.getStringList(AppConstants.CART_ITEM) ?? <String>[];
      log('Inside cart:${cartItem.toString()}');
    }

    cartItem.forEach((element) => CartModel.fromJson(jsonDecode(element)));


    return cartList;

  }
}