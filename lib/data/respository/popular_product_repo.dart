import 'package:app_food_delivery/data/api/api_client.dart';
import 'package:app_food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularproductRepo extends GetxService{

  final ApiClient apiClient;
  PopularproductRepo({required this.apiClient});

  Future<Response> getPopularProductList()async{
    return apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}