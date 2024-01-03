import 'package:app_food_delivery/utils/colors.dart';
import 'package:app_food_delivery/utils/dimensions.dart';
import 'package:app_food_delivery/widget/app_icon.dart';
import 'package:app_food_delivery/widget/big_text.dart';
import 'package:app_food_delivery/widget/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
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
                    child: BigText(size: Dimensions.font26, text: "Vn side")),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
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
                    text:
                        "Pho is essentially Vietnam’s signature dish, comprising rice noodles in a flavourful soup with meat and various greens, plus a side of nuoc cham (fermented fish) or chilli sauce. A basic bowl contains beef or chicken, topped with bean sprouts, lime wedges, and fresh herbs such as basil, mint, cilantro, and onions. Depending on the restaurant or roadside stall, you can also opt for more exotic ingredients such as gan (beef tendon), sach (thinly-sliced pig stomach), and ve don (flank with cartilage). Typically eaten for breakfast, pho is priced between VND 20,000 and VND 30,000 at a local restaurant or street market in Vietnam. Pho has shown its position not only in Vietnamese cuisine but also world cuisine. Pho can be seen everywhere from street stalls to high-end restaurants.Commonly well-known along with Pho, Vietnamese baguette sandwiches, called Banh Mi, have attracted a growing fan base around the world. The uniqueness of Banh mi not only lies within the light and crispy baguette, but also the variation of flavors Vietnam fillings bring out the most amazing flavor. Banh mi is a unique French-Vietnamese sandwich that’s great for when you’re in need of a quick meal. Priced between VND 10,000 and VND 15,000, it consists of a toasted baguette sandwich, pickled vegetables, pate, butter, soy sauce, cilantro, chillies, etc. Most banh mi sellers also offer a wide range of meat fillings, including heo quay (roasted pork belly), trung op la (fried egg), thit nuong (grilled pork loin), cha ca (fried fish with turmeric and dill), cha lua (boiled sausages), xa xiu (Chinese barbecued pork), and thit ga (poached chicken). With it reputation, Banh mi is considered to be the essence of Vietnamese cuisine. It is a must-try that even the pickiest eaters can’t resist.",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
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
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(text: "\$12.88 " + " X " + " 0 ", color: AppColors.mainBlackColor,size: Dimensions.font26,),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add),
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
                Container(
                  child: BigText(
                    text: "\$10 | Add to card",
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      bottom: Dimensions.height15,
                      right: Dimensions.width20,
                      left: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
