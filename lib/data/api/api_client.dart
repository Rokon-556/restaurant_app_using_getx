import 'dart:developer';

import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String baseUrl;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.baseUrl}) {
    baseUrl = baseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'Application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
  void updateHeader(String token){
    _mainHeaders = {
      'Content-type': 'Application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
