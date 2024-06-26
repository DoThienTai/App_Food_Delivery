import 'package:app_food_delivery/controllers/cart_controller.dart';
import 'package:app_food_delivery/controllers/popular_product_controller.dart';
import 'package:app_food_delivery/pages/auth/sign_in_page.dart';
import 'package:app_food_delivery/pages/auth/sign_up_page.dart';
import 'package:app_food_delivery/pages/food/popular_food_detail.dart';
import 'package:app_food_delivery/pages/food/recommended_food_detail.dart';
import 'package:app_food_delivery/pages/home/main_food_page.dart';
import 'package:app_food_delivery/pages/splash/splash_page.dart';
import 'package:app_food_delivery/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            //home: SignInPage(),
            initialRoute: RouteHelper.getSplashPage(),
            getPages: RouteHelper.routes,
          );
        });
      },
    );
  }
}
//Completed