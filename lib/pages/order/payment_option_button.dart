import 'package:app_food_delivery/controllers/order_controller.dart';
import 'package:app_food_delivery/utils/colors.dart';
import 'package:app_food_delivery/utils/dimensions.dart';
import 'package:app_food_delivery/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentOptionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final int index;
  const PaymentOptionButton({super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController){
      bool _selected = orderController.paymentIndex==index;
      return InkWell(
        onTap: () => orderController.setPaymentIndex(index),
        child: Container(
          padding: EdgeInsets.only(bottom: Dimensions.height10/2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20/4),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[200]!,
                    blurRadius: 5,
                    spreadRadius: 1
                )
              ]
          ),
          child: ListTile(
            leading: Icon(
              icon,
              size: 40,
              color: _selected?AppColors.mainColor:Theme.of(context).disabledColor,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
            subtitle: Text(
              subTitle,
              maxLines: 1,
              style: TextStyle(
                  fontSize: Dimensions.font16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                  color: Theme.of(context).disabledColor),
            ),
            trailing: _selected?Icon(
              Icons.check_circle,
              color: Theme.of(context).primaryColor,
            ):null,
          ),
        ),
      );
    });
  }
}
