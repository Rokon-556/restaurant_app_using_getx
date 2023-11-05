import 'dart:developer';

import 'package:food_delivery/models/response_model.dart';
import 'package:food_delivery/models/sign_up_body.dart';
import 'package:get/get.dart';

import '../repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService{
   final AuthRepo authRepo;
   bool _isLoading = false;
   bool get isLoading=>_isLoading;
   AuthController({required this.authRepo});

   Future<ResponseModel>registration(SignUpBody signUpBody)async {
      _isLoading = true;
      update();
     late ResponseModel responseModel;
      Response response = await authRepo.registration(signUpBody);
      if(response.statusCode==200){
        authRepo.saveToken(response.body['token']);
        responseModel = ResponseModel(true, response.body['token']);
        log('token:${response.body['token']}');
      }else{
         responseModel = ResponseModel(true, response.statusText??'');
      }
      _isLoading = false;
      update();
      return responseModel;
   }
}