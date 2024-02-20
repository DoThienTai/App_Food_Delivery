import 'package:app_food_delivery/base/show_custom_snackbar.dart';
import 'package:app_food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response){
    if(response.statusCode==401){
      Get.offNamed(RouteHelper.getSignIn());
    }else{
      showCustomSnackBar(response.statusText!);
    }
  }
}