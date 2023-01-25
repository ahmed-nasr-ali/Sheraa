class Urls {
  static const String BASE_URL = "http://develop.sheraa.net";
  static const String COUNTRIES_URL = BASE_URL + "/api/select/countries";
  static const String AGE_GROUP_URL = BASE_URL + "/api/select/age_groups";
  static const String ADS_SLIDER = BASE_URL + "/api/sliders";
  static const String STORES_ICONS_URL = BASE_URL + "/api/stores-screenicons";
  static const String REGETER_URL = BASE_URL + "/api/auth/register";
  static const String LOGIN_URL_ = BASE_URL + "/api/auth/login";
  static const String FORGETPASWARD_URL =
      BASE_URL + "/api/auth/password/forget";
  static const String UPLOAD_MEDIA_URL =
      BASE_URL + "/api/uploader/media/upload";
  static const String ADS_URL = BASE_URL + "/api/ads";
  static const String LOGIN_URL = BASE_URL + "/login";
  static const String USER_PROFILE_URL = BASE_URL + "/api/profile";
  static const String USER_REGISTER_URL = BASE_URL + "/register";
  static const String ORGANIZATION_REGISTER_URL =
      BASE_URL + "/register_provider";
  static const String ACTIVATION_CODE_URL = BASE_URL + "/verification/verify";
  static const String RESEND_ACTIVE_CODE_URL = BASE_URL + "/verification/send";
  static const String FORGET_PASSWORD_URL = BASE_URL + "/password/forget";
  static const String CONFIRM_CODE_URL = BASE_URL + "/password/code";
  static const String RESET_PASSWORD_URL = BASE_URL + "/password/reset";
  static const String SLIDER_URL = BASE_URL + "/sliders";

  static const String CONTRACT_URL = BASE_URL + "/user/contract";
  static const String CONTRACTS_URL = BASE_URL + "/user/contracts";
  static const String MAIN_AREAS_URL = BASE_URL + "/cities";
  static const String SUB_AREAS_URL = BASE_URL + "/areas";
  static const String SERVICES_URL = BASE_URL + "/services";
  static const String SERVICES_TYPE_URL = BASE_URL + "/service_types";
  static const String DEVICES_URL = BASE_URL + "/devices";
  static const String ORDER_PERIOD_URL = BASE_URL + "/available_hours";
  static const String MEDIAS_URL = BASE_URL + "/uploader/media/upload";
  static const String REQUEST_ORDER_URL = BASE_URL + "/orders";

  static const String UPDATE_PROFILE_URL = BASE_URL + "/profile";
  static const String ORDERS_URL = BASE_URL + "/orders";
  static const String ORDER_DETAILS_URL = BASE_URL + "/orders/";
  static const String CANCEL_ORDER__URL = BASE_URL + "/orders/cancel";
  static const String RATING_ORDER__URL = BASE_URL + "/ratings/";
  static const String REPORTS_URL = BASE_URL + "/customer/reports";
  static const String REPORT_DETAILS_URL = BASE_URL + "/reports/";
  static const String ACCEPT_REPORT = BASE_URL + "/orders/";
  static const String REFUSE_REPORT = BASE_URL + "/orders/";
  static const String REQUEST_FIX_STEPS_URL = BASE_URL + "/steps";
  static const String CANTACT_US_URL = BASE_URL + "/feedback";
  static const String PRIVACY_URL = BASE_URL + "/policy";
  static const String ABOUT_US_URL = BASE_URL + "/about";
  static const String SOCIAL_URL = BASE_URL + "/settings";
  static const String NOTIFICATION_URL = BASE_URL + "/notifications";
  static const String NOTIFICATION_UNREAD_URL =
      BASE_URL + "/notifications/unread";
  static const String NOTIFICATION_DELETED_ALL_URL =
      BASE_URL + "/notifications/deleteAll";
  static const String NOTIFICATION_DELETED_SINGLE_UR =
      BASE_URL + "/notifications/";

  static const String LOGOUT_URL = BASE_URL + "/api/auth/logout";
  static bool testPrice = true;

  ///
  static const String GET_ALL_CATEGORIES_URL =
      BASE_URL + "/api/select/categories";

  static const String GET_ALL_SUB_CATEGORIES_URL =
      BASE_URL + "/api/select/categories?parent=";

  static const String GET_ALL_FEATER_BY_CATEGORIES_ID_URL =
      BASE_URL + "/api/select/features?category_id=";

  static const String GET_ALL_CATEGORY_OPPTION_URL =
      BASE_URL + "/api/select/options?feature_id=";

  static const String GET_ALL_CITIES_URL =
      BASE_URL + "/api/select/cities?page=";

  static const String GET_Ads_URL = BASE_URL + "/api/ads";

  static const String GET_ALL_AREA_URL = BASE_URL + "/api/select/areas?page=";

  static const String GET_CITIES_DEPEND_ON_COUNTRY_URL =
      BASE_URL + "/api/select/countries/";

  static const String GET_MY_AD_TYPE_URL =
      BASE_URL + "/api/myActiveAndInactiveAds/";

  static const String GET_REMAINHING_ADS_URL = BASE_URL + "/api/myRemainingAds";

  static const String GET_DELETE_AD_URL = BASE_URL + "/api/ad/delete/";

  static const String GET_FAVORITE_AD_URL =
      BASE_URL + "/api/getAdsFavoriteList";

  static const String COMMENTS_URL = BASE_URL + "/api/comment";

  static const String REPORT_AD_URL = BASE_URL + "/api/ad-reports/create";

  static const String ADD_AND_DELETE_AD_FORM_FAVORITE_AD_LIST_URL =
      BASE_URL + "/api/ad-favorite/";

  static const String ACCOUNT_UPGRADE_URL =
      BASE_URL + "/api/packages/getPromotionPackages";

  static const String ACCOUNT_UPGRADE_TO_SELLER_OR_STORE_URL =
      BASE_URL + "/api/packages/accountUpgrade";

  static const String TELL_ME_WHEN_PRICE_DECREAsE_URL =
      BASE_URL + "/api/sendMessageWhenPriceLow";

  static const String AD_PROMOTION_URL = BASE_URL + "/api/adPromotion/";

  static const String GET_ALL_COMMENTS_URL = BASE_URL + "/api/select/ads/";

  static const String Follow_URl = BASE_URL + "/api/follows/";

  static const String GET_USER_BY_ID_URl =
      BASE_URL + "/api/select/users?user_id=";
}
