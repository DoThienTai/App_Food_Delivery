import 'package:app_food_delivery/data/respository/user_repo.dart';
import 'package:app_food_delivery/models/user_model.dart';
import 'package:get/get.dart';
import '../models/response_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool _isloading = false;
  UserModel? _userModel;
  bool get isloading => _isloading;
  UserModel? get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {

    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fomJson(response.body);
      _isloading = true;
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }
}
