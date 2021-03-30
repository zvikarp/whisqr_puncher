class ApiConsts {
  static const String API_VERSION = "/v1.2";
  static const String SERVER_URL = "https://whisqr.com/api$API_VERSION";

  // user
  static const String USER_PATH = "$SERVER_URL/user";
  static const String USER_LOGIN_PATH = "$USER_PATH/login";

  // punch
  static const String PUNCH_PATH = "$SERVER_URL/punch";
  static const String PUNCH_TOTAL_PATH = "$PUNCH_PATH/total";

  // redemption
  static const String REDEMPTION_PATH = "$SERVER_URL/redeem";

  // business
  static const String BUSINESS_PATH = "$SERVER_URL/business";
  static const String BUSINESS_BEHAVIOURS_PATH = "$BUSINESS_PATH/behaviours";
  static const String BUSINESS_REWARDS_PATH = "$BUSINESS_PATH/rewards";
  static const String BUSINESS_LOCATIONS_PATH = "$BUSINESS_PATH/locations";
}
