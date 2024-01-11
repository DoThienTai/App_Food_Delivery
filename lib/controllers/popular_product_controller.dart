import 'package:get/get.dart';
import 'package:app_food_delivery/data/respository/popular_product_repo.dart';

import '../models/product_model.dart';

class PopularProductController extends GetxController {
  final PopularproductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded =>_isLoaded;

  int _quantity = 0;
  Future<void> getPopularProductList()async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{}

  }

  // void setQuantity(bool isIncrement){
  //   if(isIncrement){
  //
  //   }else{
  //
  //   }
  // }


}
