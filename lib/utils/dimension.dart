import 'package:get/get.dart';

class Dimension {
  static double deviceHeight = Get.context!.height;
  static double deviceWidth = Get.context!.width;

  static double pageView = deviceHeight / 2.5;
  static double pageContainerView = deviceHeight / 3.6;
  static double pageTextView = deviceHeight / 7;

  static double height10 = deviceHeight / 78;
  static double height15 = deviceHeight / 68;
  static double height20 = deviceHeight / 39;
  static double height30 = deviceHeight / 19;
  static double height40 = deviceHeight / 20;
  static double height60 = deviceHeight / 13;

  static double width10 = deviceWidth / 40;
  static double width15 = deviceWidth / 30;
  static double width20 = deviceWidth / 20;
  static double width30 = deviceWidth / 14;

  static double font20 = deviceHeight / 39;

  static double radius10 = deviceHeight / 78;
  static double radius15 = deviceHeight / 68;
  static double radius20 = deviceHeight / 39;
  static double radius30 = deviceHeight / 19;

  static double icon24 = deviceHeight / 33;
  static double icon16 = deviceHeight / 40;

  static double imageHeight = deviceHeight / 6.5;
  static double listViewTextHeight = deviceHeight / 7.8;

  static double foodDetailImageSize = deviceHeight / 2.2;
  static double bottomHeight = deviceHeight / 6.5;
}
