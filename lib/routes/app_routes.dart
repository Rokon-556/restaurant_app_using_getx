class AppRoutes{
  static const String INITIAL = '/';
  static const String POPULAR_FOOD = '/popular-food';
  static const String RECOMMENEDED_FOOD = '/recommeneded-food';
  static const String CART_PAGE = '/cart-page';

  static String getInitial()=>'$INITIAL';
  static String getPopularFood(int pageID,String page)=>'$POPULAR_FOOD?pageId=$pageID&page=$page';
  static String getRecommendedFood(int pageID,String page)=>'$RECOMMENEDED_FOOD?pageId=$pageID&page=$page';
  static String getCart()=>'$CART_PAGE';
}