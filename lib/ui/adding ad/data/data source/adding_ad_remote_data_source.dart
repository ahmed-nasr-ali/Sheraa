// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/data/models/area_model.dart';
import 'package:sheraa/ui/adding%20ad/data/models/cities_model.dart';
import 'package:sheraa/ui/adding%20ad/data/models/feature_option_model.dart';
import 'package:sheraa/ui/adding%20ad/data/models/fetures_model.dart';
import 'package:sheraa/ui/adding%20ad/data/models/main_category_model.dart';
import 'package:sheraa/ui/adding%20ad/data/models/sub_category_model.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls/adding%20ad%20url/adding_ad_url.dart';

abstract class AddingAdRemoteDataSource {
  Future<List<MainCategoryModel>> getMainCategoryList(BuildContext context,
      int pageNumber, bool isSearching, String searchingText);

  Future<List<SubCategoryModel>> getSubCategoryList(
      int mainCategoryId,
      BuildContext context,
      int pageNumber,
      bool isSearching,
      String searchingText);

  Future<List<CitiesModel>> getCitiesList(BuildContext context, int pageNumber,
      bool isSearching, String searchingText);

  Future<List<AreaModel>> getAreasList(BuildContext context, int pageNumber,
      bool isSearching, String searchingText);

  Future<List<FeatureModel>> getFeatureList(
      BuildContext context, int pageNumber, int categoryId);

  Future<List<FeatureOptionModel>> getFeatureOptionList(
      BuildContext context, int pageNumber, int featureId);

  Future<bool> addingAdMethod(BuildContext context, Map<String, dynamic> body);
}

class AddingAdRemoteDataSourceIMP implements AddingAdRemoteDataSource {
  ApiProvider _apiProvider = ApiProvider();
  @override
  Future<List<MainCategoryModel>> getMainCategoryList(BuildContext context,
      int pageNumber, bool isSearching, String searchingText) async {
    List<MainCategoryModel> _mainCategoryList = [];

    print(
      isSearching
          ? "${AddingAdUrls.GET_ADDING_AD_CATEGORIES}main&page=$pageNumber&name=$searchingText"
          : "${AddingAdUrls.GET_ADDING_AD_CATEGORIES}main&page=$pageNumber",
    );

    final response = await _apiProvider.get(
      isSearching
          ? "${AddingAdUrls.GET_ADDING_AD_CATEGORIES}main&page=$pageNumber&name=$searchingText"
          : "${AddingAdUrls.GET_ADDING_AD_CATEGORIES}main&page=$pageNumber",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _mainCategoryList =
          iterable.map((model) => MainCategoryModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _mainCategoryList;
  }

  @override
  Future<List<SubCategoryModel>> getSubCategoryList(
      int mainCategoryId,
      BuildContext context,
      int pageNumber,
      bool isSearching,
      String searchingText) async {
    List<SubCategoryModel> _subCategoryList = [];

    print(isSearching
        ? "${AddingAdUrls.GET_ADDING_AD_CATEGORIES}$mainCategoryId&page=$pageNumber&name=$searchingText"
        : "${AddingAdUrls.GET_ADDING_AD_CATEGORIES}1&page=$pageNumber");

    final response = await _apiProvider.get(
      isSearching
          ? "${AddingAdUrls.GET_ADDING_AD_CATEGORIES}1&page=$pageNumber&name=$searchingText"
          : "${AddingAdUrls.GET_ADDING_AD_CATEGORIES}1&page=$pageNumber",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _subCategoryList =
          iterable.map((model) => SubCategoryModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _subCategoryList;
  }

  @override
  Future<List<AreaModel>> getAreasList(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    List<AreaModel> _areaList = [];

    print(isSearching
        ? "${AddingAdUrls.API_SELECT}areas?page=$pageNumber&name=$searchingText"
        : "${AddingAdUrls.API_SELECT}areas?page=$pageNumber");

    final response = await _apiProvider.get(
      isSearching
          ? "${AddingAdUrls.API_SELECT}areas?page=$pageNumber&name=$searchingText"
          : "${AddingAdUrls.API_SELECT}areas?page=$pageNumber",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _areaList = iterable.map((model) => AreaModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _areaList;
  }

  @override
  Future<List<CitiesModel>> getCitiesList(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    List<CitiesModel> _citiesList = [];

    print(isSearching
        ? "${AddingAdUrls.API_SELECT}cities?page=$pageNumber&name=$searchingText"
        : "${AddingAdUrls.API_SELECT}cities?page=$pageNumber");

    final response = await _apiProvider.get(
      isSearching
          ? "${AddingAdUrls.API_SELECT}cities?page=$pageNumber&name=$searchingText"
          : "${AddingAdUrls.API_SELECT}cities?page=$pageNumber",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _citiesList =
          iterable.map((model) => CitiesModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _citiesList;
  }

  @override
  Future<List<FeatureModel>> getFeatureList(
      BuildContext context, int pageNumber, int categoryId) async {
    List<FeatureModel> _featureList = [];

    print(
        "${AddingAdUrls.API_SELECT}features?category_id=$categoryId&page=$pageNumber");

    final response = await _apiProvider.get(
      "${AddingAdUrls.API_SELECT}features?category_id=$categoryId&page=$pageNumber",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _featureList =
          iterable.map((model) => FeatureModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _featureList;
  }

  @override
  Future<List<FeatureOptionModel>> getFeatureOptionList(
      BuildContext context, int pageNumber, int featureId) async {
    List<FeatureOptionModel> _featureOptioList = [];

    final response = await _apiProvider.get(
      "${AddingAdUrls.API_SELECT}options?feature_id=$featureId&page=$pageNumber",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _featureOptioList =
          iterable.map((model) => FeatureOptionModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]());
    }

    return _featureOptioList;
  }

  @override
  Future<bool> addingAdMethod(
      BuildContext context, Map<String, dynamic> body) async {
    final response = await _apiProvider.post(
      "${AddingAdUrls.API_ADS}",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: body,
    );
    print(response["status_code"]);

    if (response["status_code"] == 201) {
      return true;
    } else {
      Commons.showError(
          context: context, message: response['response'].toString());
      return false;
    }
  }
}
