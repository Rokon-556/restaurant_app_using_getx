import 'package:food_delivery/data/repository/user_repo.dart';
import 'package:get/get.dart';

import '../../models/response_model.dart';
import '../../models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  UserController({required this.userRepo});

  Future<ResponseModel> getUserData() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      print('User Name * ${_userModel?.name}');
      _isLoading = true;
      responseModel = ResponseModel(true, 'success');
    } else {
      responseModel = ResponseModel(false, response.statusText ?? '');
    }
    update();
    return responseModel;
  }
}