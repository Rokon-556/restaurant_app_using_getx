import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/cart_controller.dart';
import 'package:food_delivery/data/controller/popular_product_list_controller.dart';
import 'package:food_delivery/data/controller/recommended_product_list_controller.dart';
import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/routes/app_pages.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/widgets/no_data_widget.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductListController>(
      builder: (_) {
        return GetBuilder<RecommenededProductListController>(
          builder: (_) {
            return GetMaterialApp(
              title: 'food App',
              debugShowCheckedModeBanner: false,
              home: SignInPage(),
              // initialRoute: AppRoutes.SPLASH_SCREEN,
              // getPages: AppPages.pageList,
            );
          },
        );
      },
    );
  }
}
