import 'package:food_delivery/pages/address/add_address_page.dart';
import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recommeded_food_details.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static var pageList = [
    GetPage(
      // name: AppRoutes.getInitial(),
      name: AppRoutes.INITIAL,
      page: () => const HomePage(),
    ),
    GetPage(
      // name: AppRoutes.getSplashScreen(),
      name: AppRoutes.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      // name: AppRoutes.getSplashScreen(),
      name: AppRoutes.ADD_ADDRESS,
      page: () => const AddAddressPage(),
    ),
    GetPage(
      // name: AppRoutes.getSplashScreen(),
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      transition: Transition.fade
    ),
    GetPage(
        // name: AppRoutes.getPopularFood(),
        name: AppRoutes.POPULAR_FOOD,
        page: () {
          var pageID = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(
            pageId: int.parse(pageID ?? ''),
            page: page ?? '',
          );
        },
        transition: Transition.fadeIn
        ),
    GetPage(
        // name: AppRoutes.getRecommendedFood(),
        name: AppRoutes.RECOMMENEDED_FOOD,
        page: () {
          var pageID = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetails(
            pageId: int.parse(pageID ?? ''),
            page: page ?? '',
          );
        },
        transition: Transition.fadeIn
        ),
    GetPage(
      // name: AppRoutes.getRecommendedFood(),
        name: AppRoutes.CART_PAGE,
        page: () {
          return const CartPage();
        },
        transition: Transition.fadeIn
    ),
  ];
}
