import 'package:shared_preferences/shared_preferences.dart';

class addAddsSharedPreferences {
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // ///set main categry name
  // static setMainCategoryName(String mainCategoryName) async {
  //   await _preferences!.setString("_mainCategoryName", mainCategoryName);
  // }

  // static String getMainCategoryName() {
  //   return _preferences!.getString("_mainCategoryName") ?? "";
  // }

  // ///========================================================

  // ///set main category id
  // static setMainCategoryId(int mainCategoryId) async {
  //   await _preferences!.setInt("_mainCategoryId", mainCategoryId);
  // }

  // static int getMainCategoryId() {
  //   return _preferences!.getInt("_mainCategoryId") ?? 0;
  // }

  // ///===========================================================================
  ///===========================================================================

  // ///set sub categry name
  // static setSubCategoryName(String subCategoryName) async {
  //   await _preferences!.setString("_subCategoryName", subCategoryName);
  // }

  // static String getSubCategoryName() {
  //   return _preferences!.getString("_subCategoryName") ?? "";
  // }

  // ///========================================================

  // ///set sub category id
  // static setSubCategoryId(int subCategoryId) async {
  //   await _preferences!.setInt("_subCategoryId", subCategoryId);
  // }

  // static int getSubCategoryId() {
  //   return _preferences!.getInt("_subCategoryId") ?? 0;
  // }

  // ///===========================================================================
  ///===========================================================================
  ///set country id
  // static setCountryId(int countryId) async {
  //   await _preferences!.setInt("_countryId", countryId);
  // }

  // static int getCountryId() {
  //   return _preferences!.getInt("_countryId") ?? 0;
  // }

  ///===========================================================================
  ///===========================================================================
  ///set area id
  // static setAreaId(int areaId) async {
  //   await _preferences!.setInt("_areaId", areaId);
  // }

  // static int getAreaId() {
  //   return _preferences!.getInt("_areaId") ?? 0;
  // }

  ///===========================================================================
  ///===========================================================================
  ///set Ads Name
  // static setAdsName(String adsName) async {
  //   await _preferences!.setString("_adsName", adsName);
  // }

  // static String getAdsName() {
  //   return _preferences!.getString("_adsName") ?? "";
  // }

  // ///set Ads describtion
  // static setAdsDescribtion(String adsDescribtion) async {
  //   await _preferences!.setString("_adsDescribtion", adsDescribtion);
  // }

  // static String getAdsDescribtion() {
  //   return _preferences!.getString("_adsDescribtion") ?? "";
  // }

  ///===========================================================================
  ///===========================================================================
  ///set Ads Price

  // static setAdsPrice(String adsPrice) async {
  //   await _preferences!.setString("_adsPrice", adsPrice);
  // }

  // static String getAdsPrice() {
  //   return _preferences!.getString("_adsPrice") ?? "";
  // }

  // ///set Ads Phone Number
  // static setAdsPhoneNumber(String _adsPhoneNumber) async {
  //   await _preferences!.setString("__adsPhoneNumber", _adsPhoneNumber);
  // }

  // static String getAdsPhoneNumber() {
  //   return _preferences!.getString("__adsPhoneNumber") ?? "";
  // }
}
