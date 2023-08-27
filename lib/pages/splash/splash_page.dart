import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:get/get.dart';

import '../../data/controller/popular_product_list_controller.dart';
import '../../data/controller/recommended_product_list_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  Future<void> loadDependencies() async {
    await Get.find<PopularProductListController>().getPopularProductList();
    await Get.find<RecommenededProductListController>()
        .getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    loadDependencies();

    Timer(
        const Duration(seconds: 3), () => Get.offNamed(AppRoutes.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                'assets/image/logo part 1.png',
                width: Dimension.splashImageWidth,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/image/logo part 2.png',
              width: Dimension.splashImageWidth,
            ),
          ),
        ],
      ),
    );
  }
}
