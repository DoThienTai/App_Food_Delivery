import 'package:app_food_delivery/controllers/order_controller.dart';
import 'package:app_food_delivery/utils/dimensions.dart';
import 'package:app_food_delivery/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryOption extends StatelessWidget {
  final String value;
  final String title;
  final double amount;
  final bool isFree;

  const DeliveryOption(
      {super.key,
      required this.value,
      required this.title,
      required this.amount,
      required this.isFree});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController){
      return Row(
        children: [
          Radio(
            value: value,
            groupValue: orderController.orderType,
            onChanged: (String? value)=> orderController.setDeliveryType(value!),
          ),
          SizedBox(
            width: Dimensions.width10 / 2,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: Dimensions.font26,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(
            width: Dimensions.width10 / 2,
          ),
          Text(
            '(${(value == 'take away' || isFree) ? 'free' : '\$${amount / 10}'})',
            style: TextStyle(
              fontSize: Dimensions.font26,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          )
        ],
      );
    });
  }
}
