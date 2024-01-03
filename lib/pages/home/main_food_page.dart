import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widget/big_text.dart';
import '../../widget/small_text.dart';
import 'body_food_page.dart';
class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        color: AppColors.mainColor,
                        text: "Country",
                      ),
                      Row(
                        children: [
                          SmallText(
                            color: Colors.black54,
                            text: "City",
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //showing the body
          Expanded(child: SingleChildScrollView(child: BodyFoodPage(),))
        ],
      ),
    );
  }
}
