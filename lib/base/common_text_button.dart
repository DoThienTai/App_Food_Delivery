import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widget/big_text.dart';

class CommonTextButton extends StatelessWidget {
  final String text;
  const CommonTextButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: BigText(
          text: text,
          color: Colors.white,
        ),
      ),
      padding: EdgeInsets.only(
          top: Dimensions.height15,
          bottom: Dimensions.height15,
          right: Dimensions.width20,
          left: Dimensions.width20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0,5),
              blurRadius: 10,
              color: AppColors.mainColor.withOpacity(0.3)
          )
        ],
        color: AppColors.mainColor,
        borderRadius:
        BorderRadius.circular(Dimensions.radius20),
      ),
    );
  }
}
