import 'package:flutter/material.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/my%20ads/new/data/model/ad_model.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls/my%20ads%20urls/my_ads_urls.dart';

abstract class MyAdsRemoteDataSource {
  Future<List<AdModel>> getMyActiveAds(BuildContext context, int pageNumber);

  getMyUnactiveAds();

  Future<bool> deleteAd(BuildContext context, int adId);
}

class MyAdsRemoteDataSourcseIMP extends MyAdsRemoteDataSource {
  ApiProvider _apiProvider = ApiProvider();

  @override
  Future<List<AdModel>> getMyActiveAds(
      BuildContext context, int pageNumber) async {
    List<AdModel> _activeAdsList = [];

    final response = await _apiProvider.get(
      "${MyAdsUrls.GET_ACTIVE_AND_UNACTIVE_ADS}active?page=$pageNumber",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _activeAdsList =
          iterable.map((model) => AdModel.fromJson(model)).toList();
    } else if (response["status_code"] == 401) {
      UserData.setUserApiToken("");
      unAuthUser(context);
    } else {
      Commons.showError(context: context, message: response.toString());
    }

    return _activeAdsList;
  }

  @override
  getMyUnactiveAds() {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteAd(BuildContext context, int adId) async {
    print("${MyAdsUrls.DELETE_Ad}$adId");
    final response = await _apiProvider.post(
      "${MyAdsUrls.DELETE_Ad}$adId",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    if (response["status_code"] == 200) {
      return true;
    } else if (response["status_code"] == 401) {
      UserData.setUserApiToken("");
      unAuthUser(context);
      return false;
    } else {
      Commons.showError(context: context, message: response.toString());
      return false;
    }
  }
}
