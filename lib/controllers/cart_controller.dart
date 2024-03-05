import 'package:app_food_delivery/data/respository/cart_repo.dart';
import 'package:app_food_delivery/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  //chi de storge va sharedpreferences
  List<CartModel> storageItems = [];

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    //ktra item co trong map,co thì update item
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExit: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      if(totalQuantity<=0){
        _items.remove(product.id);
      }

    } else {
      if (quantity > 0) {
        //ktra item co trong map, chua co thì them mơi nêu key chua ton tai
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExit: true,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      } else {
        Get.snackbar(
          "Item count",
          "You should ai least add an item in the cart !",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  //kiem tra item co trong cart?
  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  //tra ra so luong cua item
  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  //tra ra tong cac item
  int get totalItems{
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems{
    return _items.entries.map((e){
      return e.value;
    }).toList();
  }

  //tra ve tong so tien cua cac item
  int get totalAmount{
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity!*value.price!;
    });
    return total;
  }

  //lay data tu luu tru cuc bo
  List<CartModel> getCartData(){

    setCart = cartRepo.getCartList();

    return storageItems;
  }

  set setCart(List<CartModel> items){
    storageItems = items;
    print("length of cart item " + storageItems.length.toString());
    for(int i=0; i<storageItems.length;i++){
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToHistory(){
    cartRepo.addToCartHistoryList();
    clear();
  }

  // xoa khi da checkout
  void clear(){
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList(){
    return cartRepo.getCartHistoryList();
  }

  void addToCartList(){
    cartRepo.addToCartList(getItems);
    update();
  }

  set setItems(Map<int, CartModel> setItems){
    _items = {};
    _items = setItems;
  }


  // xoa khi dang xuat
  void clearCartHistory(){
    cartRepo.clearCartHistory();
    update();
  }

  void removeCartSharePreference() {
    cartRepo.removeCartSharePreference();
    update();
  }
}
