import 'package:app_food_delivery/widget/app_column.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widget/big_text.dart';
import '../../widget/icon_and_text_widget.dart';
import '../../widget/small_text.dart';


class BodyFoodPage extends StatefulWidget {
  const BodyFoodPage({super.key});

  @override
  State<BodyFoodPage> createState() => _BodyFoodPageState();
}

class _BodyFoodPageState extends State<BodyFoodPage> {
  PageController controller =
      PageController(viewportFraction: 0.85, keepPage: true);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        _currPageValue = controller.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: controller,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //dots
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        // Popular text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food paring"),
              ),
            ],
          ),
        ),
        //List of food an images
        ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height20),
                  child: Row(
                    children: [
                      //image secsion
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/image/food0.png",
                            ),
                          ),
                        ),
                      ),
                      //text container
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextConSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFe8e8e8),
                                blurRadius: 5.0,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.width10,
                                right: Dimensions.width10),
                            child: AppColumn(text: "vn side"),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTran = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTran = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTran = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                right: Dimensions.width10, left: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                image: AssetImage("assets/image/food0.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTexContainer,
              margin: EdgeInsets.only(
                  right: Dimensions.width30,
                  left: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.height15,
                    right: Dimensions.height15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese side"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width20,
                        ),
                        SmallText(text: "4.5"),
                        SizedBox(
                          width: Dimensions.width20,
                        ),
                        SmallText(text: "1270"),
                        SizedBox(
                          width: Dimensions.width20,
                        ),
                        SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: 'nomal',
                            iconColor: AppColors.iconColor1),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: '1.7km',
                            iconColor: AppColors.mainColor),
                        IconAndTextWidget(
                            icon: Icons.access_alarm_sharp,
                            text: '32min',
                            iconColor: AppColors.iconColor2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
