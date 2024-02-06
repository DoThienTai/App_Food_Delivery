import 'package:app_food_delivery/data/respository/auth_repo.dart';
import 'package:app_food_delivery/models/response_model.dart';
import 'package:app_food_delivery/models/signup_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;
  AuthController({ required this.authRepo});


  bool _isloading = false;
  bool get isloading => _isloading;


  Future<ResponseModel> registration(SignupModel signupModel) async {
    _isloading = true;
    Response response = await authRepo.registration(signupModel);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      authRepo.saveUserToken(response.body["token"]);
      responseModel =  ResponseModel(true, response.body["token"]);
    }else{
      responseModel =  ResponseModel(false, response.statusText!);
    }
    _isloading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    print("Getting token");
    print(authRepo.getUserToken().toString());
    _isloading = true;
    update();
    Response response = await authRepo.login(email, password);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      authRepo.saveUserToken(response.body["token"]);
      print(response.body["token"].toString());
      responseModel =  ResponseModel(true, response.body["token"]);
    }else{
      responseModel =  ResponseModel(false, response.statusText!);
    }
    _isloading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword( String number, String password)  {
    authRepo.saveUserNumberAndPassword(number, password);
  }
  bool userLoggedIn()  {
    return  authRepo.userLoggedIn();
  }

}