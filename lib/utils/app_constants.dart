class AppConstants{

  static const String APP_NAME = "MyFood";
  static const int APP_VERSION = 1;
  static const String TOKEN = "";
  static const String PHONE = "";
  static const String PASSWORD = "";
  static const String BASE_URL = 'http://127.0.0.1:8000';
  // static const String BASE_URL = 'http://mvs.bslmeiyu.com';
  static const String UPLOAD = '/uploads/';
  static const String POPULAR_FOOD_LIST='/api/v1/products/popular';
  static const String RECOMMENDED_FOOD_LIST='/api/v1/products/recommended';
  static const String REGISTRATION_URI='/api/v1/auth/register';
  static const String LOGIN_URI='/api/v1/auth/login';
  static const String USER_INFO_URI='/api/v1/customer/info';
  static const String USER_ADRESS='user_address';
  static const String ADD_USER_ADRESS='/api/v1/customer/address/add';
  static const String ADRESS_LIST_URI='/api/v1/customer/address/list';
  static const String GEOCODE_URI='/api/v1/config/geocode-api';


  //storage key

  static const String CART_ITEM = 'cart_item';
  static const String CART_HISTORY_ITEM = 'cart_history_item';

}