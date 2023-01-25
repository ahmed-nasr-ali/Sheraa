// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/my%20ads/new/data/model/ad_model.dart';
import 'package:sheraa/ui/new%20Home/data/models/slider_model.dart';
import 'package:sheraa/ui/new%20Home/data/models/store_icon_model.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls/adding%20ad%20url/adding_ad_url.dart';
import 'package:sheraa/utils/urls/home%20screen%20urls/home_screen_urls.dart';

abstract class HomeScreenRemoteDataSource {
  Future<List<SliderModel>> getSliderImage(BuildContext context);

  Future<List<StoreIconModel>> getStoreIcons(BuildContext context);

  Future<List<AdModel>> getAdsList(BuildContext context);

  Future<AdModel> getSpecificAd(BuildContext context, String adId);
}

class HomeScreenRemoteDataSourceIMP implements HomeScreenRemoteDataSource {
  ApiProvider _apiProvider = ApiProvider();

  @override
  Future<List<SliderModel>> getSliderImage(BuildContext context) async {
    List<SliderModel> _sliderImageList = [];

    final response = await _apiProvider.get(
      "${HomeScreenUrls.GET_SLIDER_IMAGE}",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
      },
    );
    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      _sliderImageList =
          iterable.map((model) => SliderModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _sliderImageList;
  }

  @override
  Future<List<StoreIconModel>> getStoreIcons(BuildContext context) async {
    List<StoreIconModel> _storeIconList = [];

    final response = await _apiProvider.get(
      "${HomeScreenUrls.GET_STORE_ICON_LIST}",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
      },
    );
    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      _storeIconList =
          iterable.map((model) => StoreIconModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _storeIconList;
  }

  @override
  Future<List<AdModel>> getAdsList(BuildContext context) async {
    List<AdModel> _adsList = [];

    final response = await _apiProvider.get(
      "${AddingAdUrls.API_ADS}",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      _adsList = iterable.map((model) => AdModel.fromJson(model)).toList();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _adsList;
  }

  @override
  Future<AdModel> getSpecificAd(BuildContext context, String adId) async {
    AdModel _adDetails = AdModel();

    final response = await _apiProvider.get(
      "${AddingAdUrls.API_ADS}/$adId",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response['status_code'] == 200) {
      Map<String, dynamic> iterable = response['response']['data'];

      _adDetails = AdModel.fromJson(iterable);
      print(
          "=========================================================${_adDetails.id}===========${_adDetails.name}");
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _adDetails;
  }
}
