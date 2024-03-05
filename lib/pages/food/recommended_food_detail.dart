import 'package:app_food_delivery/controllers/popular_product_controller.dart';
import 'package:app_food_delivery/controllers/recommended_product_controller.dart';
import 'package:app_food_delivery/routes/route_helper.dart';
import 'package:app_food_delivery/utils/colors.dart';
import 'package:app_food_delivery/utils/dimensions.dart';
import 'package:app_food_delivery/widget/app_icon.dart';
import 'package:app_food_delivery/widget/big_text.dart';
import 'package:app_food_delivery/widget/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../utils/app_constants.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetail({super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading:
                false, // tắt hiển thị nút back măck đinh trên SliverAppbar
            toolbarHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      if(page=="cartpage"){
                        Get.toNamed(RouteHelper.getCartpage());
                      }else{
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: AppIcon(icon: Icons.clear)),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getCartpage());
                    },
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        controller.totalItem >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                ),
                              )
                            : Container(),
                        controller.totalItem >= 1
                            ? Positioned(
                                right: 3,
                                top: 1,
                                child: BigText(
                                  text: Get.find<PopularProductController>()
                                      .totalItem
                                      .toString(),
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            : Container()
                      ],
                    ),
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    )),
                child: Center(
                    child:
                        BigText(size: Dimensions.font26, text: product.name!)),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: ExpandableTextWidget(
                    text: product.description!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.remove),
                  ),
                  BigText(
                    text: "\$${product.price!} X ${controller.inCartItems} ",
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.add),
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  right: Dimensions.width20,
                  left: Dimensions.width20),
              decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height15,
                        bottom: Dimensions.height15,
                        right: Dimensions.width20,
                        left: Dimensions.width20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                      child: BigText(
                        text: "\$ ${product.price!} | Thêm vào giỏ",
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(
                          top: Dimensions.height15,
                          bottom: Dimensions.height15,
                          right: Dimensions.width20,
                          left: Dimensions.width20),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
