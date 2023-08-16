import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/recommended_product_list_controller.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/bottom_section.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetails({super.key,required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommenededProductListController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            backgroundColor: AppColors.yellowColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()=>Get.toNamed(AppRoutes.getInitial()),
                  child: const AppIcon(icon: Icons.clear),
                ),
                const AppIcon(icon: Icons.shopping_cart)
              ],
            ),
            expandedHeight: 300,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimension.radius20),
                      topRight: Radius.circular(Dimension.radius20),
                    )),
                child: Center(
                  child: BigText(
                    text: product.name ?? '',
                    textSize: Dimension.font20 + 6,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD+product.img,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimension.width20),
                  child:  ExpandableTextWidget(
                    text:
                        product.description ?? '',
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimension.width20 * 2.5,
              vertical: Dimension.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimension.icon24,
                  iconColor: Colors.white,
                ),
                BigText(text: '\$${product.price.toString()} X 0 ',textSize: Dimension.font20+6,color: AppColors.mainBlackColor,),
                AppIcon(
                  icon: Icons.add,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimension.icon24,
                  iconColor: Colors.white,
                )
              ],
            ),
          ),
          BottomSection(widget: Icon(Icons.favorite,color: AppColors.mainColor,),price: product.price.toString(),)
        ],
      ),
    );
  }
}
