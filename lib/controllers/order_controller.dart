import 'package:app_food_delivery/data/respository/order_repo.dart';
import 'package:app_food_delivery/models/place_order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController implements GetxService{
  final OrderRepo orderRepo;
  OrderController({ required this.orderRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> placeOrder(PlaceOrderBody placeOrderBody, Function callback) async{
    _isLoading = true;
    Response response = await orderRepo.placeOrder(placeOrderBody);
    if(response.statusCode == 200){
      _isLoading = false;
      String message = response.body['message'];
      String orderID  = response.body['order_id'].toString();
      callback(true, message, orderID);
    }else{
      callback(false, response.statusText!, '-1');
    }
  }

}