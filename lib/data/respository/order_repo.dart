import 'package:app_food_delivery/models/place_order_model.dart';
import 'package:app_food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class OrderRepo {
  final ApiClient apiClient;
  OrderRepo({required this.apiClient});

 Future<Response> placeOrder(PlaceOrderBody placeOrderBody) async {
    return await apiClient.postData(AppConstants.PLACE_ORDER_URI, placeOrderBody.toJson());
  }
}