import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  ///set user lang
  static setUserLang(String userLang) async {
    await _preferences!.setString("userlang", userLang);
  }

  static String getUSerLang() {
    return _preferences!.getString("userlang") ?? "";
  }

  ///=======================================================================

  static Future setUserphoneNumberForRegester(String userPhoneNumber) async =>
      await _preferences!
          .setString('UserphoneNumberForRegester', userPhoneNumber);

  static String? getUserPhoneNmberForRegester() =>
      _preferences!.getString('UserphoneNumberForRegester');

  ///=======================================================================
  static Future setCountryCode(String countryCode) async =>
      await _preferences!.setString('_CountryCode', countryCode);

  static String? getCountryCode() => _preferences!.getString('_CountryCode');

  ///=======================================================================
  static Future setUserphoneNumberWithoutCode(
          String userPhoneNumberWithoutCode) async =>
      await _preferences!
          .setString('_userPhoneNumberWithoutCode', userPhoneNumberWithoutCode);

  static String? getUserPhoneNumberWithoutCode() =>
      _preferences!.getString('_userPhoneNumberWithoutCode');

  ///=======================================================================

  ///=======================================================================
  static setFirebaseUserToken(String userToken) async =>
      await _preferences!.setString('_userToken', userToken);

  static String? getFirebaseUserToken() {
    return _preferences!.getString('_userToken');
  }

  ///=======================================================================
  static setUserName(String userName) async =>
      await _preferences!.setString('_userName', userName);

  static String? getUserName() {
    return _preferences!.getString('_userName');
  }

  ///=======================================================================
  static setUserEmail(String userEmail) async =>
      await _preferences!.setString('_userEmail', userEmail);

  static String? getUserEmail() {
    return _preferences!.getString('_userEmail');
  }

  ///=======================================================================
  static Future setUserphoneNumber(String userPhoneNumber) async =>
      await _preferences!.setString('_userPhoneNumber', userPhoneNumber);

  static String? getUserPhoneNmber() =>
      _preferences!.getString('_userPhoneNumber');

  ///=======================================================================
  static setUserApiToken(String userToken) async =>
      await _preferences!.setString('_userApiToken', userToken);

  static String? getUserApiToken() {
    return _preferences!.getString('_userApiToken');
  }

  ///=======================================================================
  static setUserId(int id) async => await _preferences!.setInt('_UserID', id);

  static int? getUserId() {
    return _preferences!.getInt('_UserID');
  }

  ///=======================================================================
  static setCountryId(int countryid) async =>
      await _preferences!.setInt('_countryid', countryid);

  static int? getCountryId() {
    return _preferences!.getInt('_countryid');
  }

  ///=======================================================================

  static setCountryImageUrl(String countryImageUrl) async =>
      await _preferences!.setString('_CountryImageUrl', countryImageUrl);

  static String? getCountryImageUrl() {
    return _preferences!.getString('_CountryImageUrl');
  }

  ///=======================================================================
  static setUserGender(String userGender) async =>
      await _preferences!.setString('_userGender', userGender);

  static String? getUserGender() {
    return _preferences!.getString('_userGender');
  }

  ///=======================================================================
  static setAgeId(int ageId) async =>
      await _preferences!.setInt('_ageId', ageId);

  static int? getAgeId() {
    return _preferences!.getInt('_ageId');
  }

  ///=======================================================================
  static setUserType(String userType) async =>
      await _preferences!.setString('_userType', userType);

  static String? getUserType() {
    return _preferences!.getString('_userType');
  }

  ///=======================================================================
  ///userd in (الملف الشخصي) to show and hidden user phone
  static setHiddenUserPhoneNumber(bool isHidden) async =>
      await _preferences!.setBool('_HiddenUserPhoneNumber', isHidden);

  static bool? getHiddenUserPhoneNumber() {
    return _preferences!.getBool('_HiddenUserPhoneNumber');
  }

  ///=======================================================================
  ///Adding ad
  ///set main categry name
  static setMainCategoryName(String mainCategoryName) async {
    await _preferences!.setString("_mainCategoryName", mainCategoryName);
  }

  static String getMainCategoryName() {
    return _preferences!.getString("_mainCategoryName") ?? "";
  }

  ///set main category id
  static setMainCategoryId(int mainCategoryId) async {
    await _preferences!.setInt("_mainCategoryId", mainCategoryId);
  }

  static int getMainCategoryId() {
    return _preferences!.getInt("_mainCategoryId") ?? 0;
  }

  ///set sub categry name
  static setSubCategoryName(String subCategoryName) async {
    await _preferences!.setString("_subCategoryName", subCategoryName);
  }

  static String getSubCategoryName() {
    return _preferences!.getString("_subCategoryName") ?? "";
  }

  ///set sub category id
  static setSubCategoryId(int subCategoryId) async {
    await _preferences!.setInt("_subCategoryId", subCategoryId);
  }

  static int getSubCategoryId() {
    return _preferences!.getInt("_subCategoryId") ?? 0;
  }

  ///set country id
  static setAddingAdCountryId(int countryId) async {
    await _preferences!.setInt("_countryId", countryId);
  }

  static int getAddingAddCountryId() {
    return _preferences!.getInt("_countryId") ?? 0;
  }

  ///set area id
  static setAddingAdAreaId(int areaId) async {
    await _preferences!.setInt("_areaId", areaId);
  }

  static int getAddingAdAreaId() {
    return _preferences!.getInt("_areaId") ?? 0;
  }

  ///set Ads Name
  static setAdsName(String adsName) async {
    await _preferences!.setString("_adsName", adsName);
  }

  static String getAdsName() {
    return _preferences!.getString("_adsName") ?? "";
  }

  ///set Ads describtion
  static setAdsDescribtion(String adsDescribtion) async {
    await _preferences!.setString("_adsDescribtion", adsDescribtion);
  }

  static String getAdsDescribtion() {
    return _preferences!.getString("_adsDescribtion") ?? "";
  }

  ///set Ads Price

  static setAdsPrice(String adsPrice) async {
    await _preferences!.setString("_adsPrice", adsPrice);
  }

  static String getAdsPrice() {
    return _preferences!.getString("_adsPrice") ?? "";
  }

  ///set Ads Phone Number
  static setAdsPhoneNumber(String _adsPhoneNumber) async {
    await _preferences!.setString("__adsPhoneNumber", _adsPhoneNumber);
  }

  static String getAdsPhoneNumber() {
    return _preferences!.getString("__adsPhoneNumber") ?? "";
  }

  ///set hiden contact
  static setHiddenContact(String _hiddenContact) async {
    await _preferences!.setString("_hiddenContact", _hiddenContact);
  }

  static String getHiddenContact() {
    return _preferences!.getString("_hiddenContact") ?? "";
  }

  ///set hiden comment
  static setHiddenComments(String _hiddenComments) async {
    await _preferences!.setString("_hiddenComments", _hiddenComments);
  }

  static String getHiddenComments() {
    return _preferences!.getString("_hiddenComments") ?? "";
  }
}
