class AppRoutes{
  static const String INITIAL = '/';
  static const String SPLASH_SCREEN = '/splash-screen';
  static const String POPULAR_FOOD = '/popular-food';
  static const String RECOMMENEDED_FOOD = '/recommeneded-food';
  static const String CART_PAGE = '/cart-page';
  static const String SIGN_IN = '/sign-in';
  static const String ADD_ADDRESS = '/add-address';
  static const String ADD_ADDRESS_MAP = '/add-address-map';
  static const String PAYMENT_PAGE = '/payment';
  static const String ORDER_SUCCESS = '/order-success';

  static String getInitial()=>'$INITIAL';
  static String getSplashScreen()=>'$SPLASH_SCREEN';
  static String getPopularFood(int pageID,String page)=>'$POPULAR_FOOD?pageId=$pageID&page=$page';
  static String getRecommendedFood(int pageID,String page)=>'$RECOMMENEDED_FOOD?pageId=$pageID&page=$page';
  static String getCart()=>'$CART_PAGE';
  static String getSignIn()=>'$SIGN_IN';
  static String getAddressPage()=>'$ADD_ADDRESS';
  static String getAddressMapPage()=>'$ADD_ADDRESS_MAP';
  static String getPaymentPage(String id,int userId)=>'$PAYMENT_PAGE?id=$id&userID=$userId';
  static String getOrderSuccessPage(String orderId,String orderStatus)=>'$ORDER_SUCCESS?id=$orderId&status=$orderStatus';
}