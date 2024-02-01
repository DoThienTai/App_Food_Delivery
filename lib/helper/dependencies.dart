import 'package:app_food_delivery/controllers/auth_controller.dart';
import 'package:app_food_delivery/controllers/cart_controller.dart';
import 'package:app_food_delivery/controllers/popular_product_controller.dart';
import 'package:app_food_delivery/data/api/api_client.dart';
import 'package:app_food_delivery/data/respository/auth_repo.dart';
import 'package:app_food_delivery/data/respository/cart_repo.dart';
import 'package:app_food_delivery/data/respository/popular_product_repo.dart';
import 'package:app_food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/respository/recommended_product_repo.dart';

Future<void> init() async{

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL),);
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //repos
  Get.lazyPut(() => PopularproductRepo(apiClient: Get.find()));
  Get.lazyPut(() =>RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() =>CartRepo(sharedPreferences: Get.find()));

  //controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}