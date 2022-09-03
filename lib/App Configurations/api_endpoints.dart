class ApiEndPoints {
  // - https://new-ire-www.mypandit.com/ (Blog WP1)
  // - https://new-ire-product.mypandit.com (API WP2)

  // static String BASE_URL = "https://stagingproduct.mypandit.com/"; // old
  static String BASE_URL = "https://new-ire-product.mypandit.com/"; // new
  static String SIGN_UP = BASE_URL + "wp-json/digits/v2/signup_user";
  static String ADD_SHIPPING_ADDRESS = BASE_URL + "wp-json/mpv3/shipping-address-add";
  static String LOG_IN = BASE_URL + "wp-json/digits/v2/send_otp";
  static String VERIFY_OTP = BASE_URL + "wp-json/digits/v2/otp_verify";
  static String RESEND_OTP = BASE_URL + "wp-json/digits/v2/resend_otp";
  static String SOCIAL_LOGIN = BASE_URL + "wp-json/mpv4/social_login";
  static String FORCE_UPDATE = BASE_URL + "wp-json/mpv3/forcefully_update";
  static String GET_HOMEPAGE = BASE_URL + "wp-json/mpv4/homepage-apis/?";
  static String GET_COUNTRY_LIST = BASE_URL + "location/countrylist";
  static String GET_ASTROLOGER_INFO =
      BASE_URL + "wp-json/mpv4/getastrologerinformation";
  static String GET_ASTROLOGER_USER_CALL_LIMIT = BASE_URL + "wp-json/mpv3/user-call-limit-with-astro";
  static String GET_ASTRO_SUBCATEGORY_PRODUCT_LIST = BASE_URL + "wp-json/mpv3/subcategory-product-list";
  static String GET_ASTROLOGER_USER_CHAT_LIMIT =
      BASE_URL + "wp-json/mpv3/user-chat-limit-with-astro";
  static String DAILY_HOROSCOPE = BASE_URL + "wp-json/mpv3/get_star_guide";
  static String GET_USER_TRANSACTIONS =
      BASE_URL + "wp-json/mpv4/get-user-transaction-log";
  static String ASTRO_PROFILE_LIST =
      BASE_URL + "wp-json/mpv3/get-astroprofile-tabs";
  static String GET_ALL_ASTROLOGER_LIST =
      BASE_URL + "wp-json/mpv4/astrologerprofile-list-app";
  ///old api endpoint for call and chat page astrolist api
  // static String ALL_ASTROLOGER_LIST =
  //     BASE_URL + "wp-json/mpv4/astrologerprofile-filter-list-app";
  static String GET_ASTRO_LIST_FILTER_VALUES =
      BASE_URL + "wp-json/mpv3/astrologer-filter-values";
  static String ALL_REVIEW = BASE_URL + "wp-json/mpv4/get-astrologer-reviews";
  static String ASTRO_STORE_CATEGORY_LIST = BASE_URL + "wp-json/mpv3/product-subcategory-list";
  static String CHECKOUT_PAGE_DETAILS = BASE_URL + "wp-json/mpv3/product-details";
  static String CART_API = BASE_URL + "wp-json/mpv3/list-to-cart";
  static String CREATE_ORDER = BASE_URL + "wp-json/mpv3/create-order";
  static String GENERATE_PAYTM_TOKEN = BASE_URL + "wp-json/mpv4/generate-paytm-token";
  static String UPDATE_CART_API = BASE_URL + "wp-json/mpv3/update-to-cart";
  static String DELETE__TO_CART_API = BASE_URL + "wp-json/mpv3/delete-to-cart";
  static String ADD_TO_CART_API = BASE_URL + "wp-json/mpv3/add-to-cart";
  static String webViewLink = "https://www.mypandit.com";

  /// endpoints of article for other areas
  static String endPointOfArticleLove = "/horoscope-2022/love-and-relationship";
  static String endPointOfArticleHealth = "/horoscope-2022/health-and-fitness";
  static String endPointOfArticleEducation = "/horoscope-2022/education";
  static String endPointOfArticleFinance = "/horoscope-2022/finance";
  static String endPointOfArticleCareer = "/horoscope-2022/career-and-business";
  static String endPointOfArticleWealth = "/horoscope-2022/wealth";
  static String endPointOfArticleMarriage = "/horoscope-2022/marriage";
}
