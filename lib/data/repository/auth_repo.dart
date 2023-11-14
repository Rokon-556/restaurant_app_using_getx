import 'dart:developer';

import 'package:food_delivery/models/sign_up_body.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences preference;

  AuthRepo({required this.apiClient,required this.preference});

  Future<Response> registration(SignUpBody signUpBody)async{
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  Future<Response> login(String email,String password)async{
    return await apiClient.postData(AppConstants.LOGIN_URI,
        {'email':email,'password':password});
  }

  saveToken(String token)async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await preference.setString(AppConstants.TOKEN, token);
  }

  Future<String> getToken()async{
    return preference.getString(AppConstants.TOKEN)??'';
  }
  bool isLoggedIn(){
     return preference.containsKey(AppConstants.TOKEN);
  }

  Future<void> savePhoneAndPassword(String phone, String password) async {
    try{
      await preference.setString(AppConstants.TOKEN, phone);
      await preference.setString(AppConstants.TOKEN, password);
    }catch(e){
      log(e.toString());
    }
  }
}