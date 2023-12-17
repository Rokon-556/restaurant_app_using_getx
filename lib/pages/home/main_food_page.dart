import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../data/controller/popular_product_list_controller.dart';
import '../../data/controller/recommended_product_list_controller.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> loadDependencies() async {
    await Get.find<PopularProductListController>().getPopularProductList();
    await Get.find<RecommenededProductListController>()
        .getRecommendedProductList();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: Column(
      children: [
        SizedBox(height: 50,),
        // Container(
        //   child: Container(
        //     margin: const EdgeInsets.only(top: 60, bottom: 15),
        //     padding:  EdgeInsets.only(right: Dimension.width20, left: Dimension.width20),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Column(
        //           children: [
        //             BigText(
        //               text: 'Bangladesh',
        //               color: AppColors.mainColor,
        //             ),
        //             Row(
        //               children: [
        //                 SmallText(
        //                   text: 'Narsingdi',
        //                   color: Colors.black54,
        //                 ),
        //                 const SizedBox(width: 5,),
        //                 const Icon(Icons.arrow_drop_down)
        //               ],
        //             )
        //           ],
        //         ),
        //         Center(
        //           child: Container(
        //             height: Dimension.height40,
        //             width: Dimension.height40,
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(Dimension.radius15),
        //                 color: AppColors.mainColor),
        //             child: Icon(
        //               Icons.search,
        //               size: Dimension.icon24,
        //               color: Colors.white,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        const Expanded(child: FoodPageBody()),
      ],
    ), onRefresh: loadDependencies);
  }
}
