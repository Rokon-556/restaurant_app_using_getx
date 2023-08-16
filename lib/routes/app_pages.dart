import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recommeded_food_details.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static var pageList = [
    GetPage(
      // name: AppRoutes.getInitial(),
      name: AppRoutes.INITIAL,
      page: () => const MainFoodPage(),
      // binding: FriendListBinding(),
    ),
    GetPage(
        // name: AppRoutes.getPopularFood(),
        name: AppRoutes.POPULAR_FOOD,
        page: () {
          var pageID = Get.parameters['pageId'];
          return PopularFoodDetail(
            pageId: int.parse(pageID ?? ''),
          );
        },
        transition: Transition.fadeIn
        // binding: FriendBinding(),
        ),
    GetPage(
        // name: AppRoutes.getRecommendedFood(),
        name: AppRoutes.RECOMMENEDED_FOOD,
        page: () {
          var pageID = Get.parameters['pageId'];
          return RecommendedFoodDetails(
            pageId: int.parse(pageID ?? ''),
          );
        },
        transition: Transition.fadeIn
        // binding: FriendBinding(),
        ),
  ];
}
