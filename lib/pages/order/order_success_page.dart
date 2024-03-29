import 'package:app_food_delivery/base/custom_button.dart';
import 'package:app_food_delivery/routes/route_helper.dart';
import 'package:app_food_delivery/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSuccessPage extends StatelessWidget {
  final String orderID;
  final int status;
  OrderSuccessPage({required this.orderID, required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      Future.delayed(Duration(seconds: 1), () {});
    }
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: Dimensions.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              status == 1
                  ? "assets/image/checked.png"
                  : "assets/image/warning.png",
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: Dimensions.height45,
            ),
            Text(
              status == 1
                  ? 'You placed the order successfully'
                  : 'your order failed',
              style: TextStyle(fontSize: Dimensions.font20),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height20,
                  vertical: Dimensions.height10),
              child: Text(status == 1 ? 'Successful order' : 'Failed order',
                  style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: Theme.of(context).disabledColor),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
              child: CustomButton(
                buttonText: 'Back to home', onPressed: () => Get.offNamed(RouteHelper.getInitial()),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
