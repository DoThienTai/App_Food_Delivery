import 'package:app_food_delivery/widget/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigText(text: text, size: Dimensions.font26,),
        SizedBox(
          height: Dimensions.height10,
        ),
        SmallText(text: "With vietnames"),
        SizedBox(
          height: Dimensions.height10,
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
    );
  }
}
