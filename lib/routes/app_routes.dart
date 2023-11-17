class AppRoutes{
  static const String INITIAL = '/';
  static const String SPLASH_SCREEN = '/splash-screen';
  static const String POPULAR_FOOD = '/popular-food';
  static const String RECOMMENEDED_FOOD = '/recommeneded-food';
  static const String CART_PAGE = '/cart-page';
  static const String SIGN_IN = '/sign-in';
  static const String ADD_ADDRESS = '/add-address';

  static String getInitial()=>'$INITIAL';
  static String getSplashScreen()=>'$SPLASH_SCREEN';
  static String getPopularFood(int pageID,String page)=>'$POPULAR_FOOD?pageId=$pageID&page=$page';
  static String getRecommendedFood(int pageID,String page)=>'$RECOMMENEDED_FOOD?pageId=$pageID&page=$page';
  static String getCart()=>'$CART_PAGE';
  static String getSignIn()=>'$SIGN_IN';
  static String getAddressPage()=>'$ADD_ADDRESS';
}