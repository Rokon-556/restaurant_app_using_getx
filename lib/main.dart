import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/popular_product_list_controller.dart';
import 'package:food_delivery/data/controller/recommended_product_list_controller.dart';
import 'package:food_delivery/routes/app_pages.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductListController>().getPopularProductList();
    Get.find<RecommenededProductListController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.INITIAL,
      getPages: AppPages.pageList,
    );
  }
}


