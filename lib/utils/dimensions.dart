import 'package:get/get.dart';
class Dimensions{
  static double screenHeight = Get.context!.height;//867
  static double screenWidth = Get.context!.width;//411

  static double pageView = screenHeight/2.71;
  static double pageViewContainer= screenHeight/3.94;
  static double pageViewTexContainer = screenHeight/7.22;

  //dynamic height padding and margin
  static double height10 = screenHeight/86.7;
  static double height15 = screenHeight/57.8;
  static double height20 = screenHeight/44.5;
  static double height30 = screenHeight/28.9;
  static double height45 = screenHeight/19.26;
  //dynamic width padding and margin
  static double width10 = screenWidth/41.1;
  static double width15 = screenWidth/27.4;
  static double width20 = screenWidth/20.55;
  static double width30 = screenWidth/13.7;

  //font
  static double font16 = screenHeight/54.18;
  static double font20 = screenHeight/43.35;
  static double font26 = screenHeight/33.34;
  //radius
  static double radius15 = screenHeight/57.8;
  static double radius20 = screenHeight/43.35;
  static double radius30 = screenHeight/28.9;

  //icon size
  static double iconSize24 = screenHeight/36.12;
  static double iconSize16 = screenHeight/54.18;
  //list view size
  static double listViewImgSize = screenWidth/3.42;
  static double listViewTextConSize = screenWidth/4.11;

  //popular food
  static double popularFoodImgSize = screenHeight/2.47;
  //bottom height
  static double bottomHeightBar = screenHeight/7.22;
}