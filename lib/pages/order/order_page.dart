import 'package:app_food_delivery/base/custom_app_bar.dart';
import 'package:app_food_delivery/controllers/auth_controller.dart';
import 'package:app_food_delivery/pages/order/view_order.dart';
import 'package:app_food_delivery/utils/colors.dart';
import 'package:app_food_delivery/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/order_controller.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tapController;
  late bool _isloggedIn;

  @override
  void initState() {
    super.initState();
    _isloggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isloggedIn) {
      _tapController = TabController(length: 2, vsync: this);
      Get.find<OrderController>().getOrderList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "My orders",
      ),
      body: Column(
        children: [
          Container(
            width: Dimensions.screenHeight,
            child: TabBar(
              indicatorWeight: 5,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Theme.of(context).disabledColor,

              controller: _tapController,
              tabs: const [
                Tab(
                  text: 'current',

                ),
                Tab(
                  text: "history",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tapController,
              children: [
                ViewOrder(isCurrent: true),
                ViewOrder(isCurrent: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
