import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/show_custom_snackbar.dart';
import 'package:get/get.dart';

class ApiChecker{
  static void checkApi (Response response){
    if(response.statusCode == 401){
      Get.offNamed(AppRoutes.getSignIn());
    }else{
      showCustomSnackBar(response.statusText!);
    }
  }
}