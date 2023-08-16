class AppRoutes{
  static const String INITIAL = '/';
  static const String POPULAR_FOOD = '/popular-food';
  static const String RECOMMENEDED_FOOD = '/recommeneded-food';

  static String getInitial()=>'$INITIAL';
  static String getPopularFood(int pageID)=>'$POPULAR_FOOD?pageId=$pageID';
  static String getRecommendedFood(int pageID)=>'$RECOMMENEDED_FOOD?pageId=$pageID';
}