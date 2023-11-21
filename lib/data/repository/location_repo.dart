import 'dart:developer';

import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LocationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAddressFromLatLng(LatLng latlng) async {
    log('${AppConstants.GEOCODE_URI}?lat=${latlng.latitude}&lng=${latlng.longitude}');
    return await apiClient.getData(
        '${AppConstants.GEOCODE_URI}?lat=${latlng.latitude}&lng=${latlng.longitude}'
    );
  }

  String getUserAddress(){
    return sharedPreferences.getString(AppConstants.USER_ADRESS)??'';
  }

  Future<Response> addUserAddress(AddressModel addressModel)async{
    return await apiClient.postData(AppConstants.ADD_USER_ADRESS, addressModel.toJson());
  }

  Future<Response> getAllAddress()async{
    return await apiClient.getData(AppConstants.ADRESS_LIST_URI);
  }
  
  Future<bool> saveUserAddress(String address) async{
    apiClient.updateHeader(sharedPreferences.getString(AppConstants.TOKEN)!);
    return await sharedPreferences.setString(AppConstants.USER_ADRESS, address);
  }
  Future<Response> getZone(String lat,String lng)async{
    return await apiClient.getData('${AppConstants.ZONE_URI}?lat=$lat&lng=$lng');
  }
}
