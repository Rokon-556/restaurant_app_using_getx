import 'dart:convert';
import 'dart:developer';

import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepository{
  final SharedPreferences preferences;
  CartRepository({required this.preferences});

  List<String> cartItem =[];
  List<String> cartHistoryItem =[];

  void addToCartItems(List<CartModel> cartItems){
    // preferences.remove(AppConstants.CART_ITEM);
    // preferences.remove(AppConstants.CART_HISTORY_ITEM);
    cartItem = [];
    var dateTime = DateTime.now().toString();
    // var dateTime = DateTime.now().toIso8601String();

    cartItems.forEach((element) {
      element.time = dateTime;
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

    cartItem.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));


    return cartList;

  }

  void addToCartHistory(){
    if(preferences.containsKey(AppConstants.CART_HISTORY_ITEM)){
      cartHistoryItem = preferences.getStringList(AppConstants.CART_HISTORY_ITEM)!;
    }
    for(int i= 0;i<cartItem.length;i++){
      cartHistoryItem.add(cartItem[i]);
    }
    cartItem=[];
    // removeCart();
    preferences.setStringList(AppConstants.CART_HISTORY_ITEM, cartHistoryItem);
  }

  void removeCart(){
    cartItem=[];
    preferences.remove(AppConstants.CART_ITEM);
  }

  void clearCartHistory(){
    removeCart();
    cartHistoryItem =[];
    preferences.remove(AppConstants.CART_HISTORY_ITEM);
  }

  List<CartModel> getCartHistoryList(){
    if(preferences.containsKey(AppConstants.CART_HISTORY_ITEM)){
      cartHistoryItem = [];
      cartHistoryItem = preferences.getStringList(AppConstants.CART_HISTORY_ITEM)!;
    }
    List<CartModel> cartListHistory =[];
    cartHistoryItem.forEach((element) =>cartListHistory.add(CartModel.fromJson(jsonDecode(element))));

    return cartListHistory;

  }

  void removeSharedPreferencesData(){
    preferences.remove(AppConstants.CART_ITEM);
    preferences.remove(AppConstants.CART_HISTORY_ITEM);

  }
}