// ignore_for_file: unused_field, unused_local_variable, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/models/remaining_ads.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class ActiveAdProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  bool isLoading = false;

  List<Ad> _activeAdList = [];

  int _page = 1;

  List<Ad> get activeAdList => _activeAdList;

  int get page => _page;

  Future<void> getActiveAdList(BuildContext context) async {
    isLoading = true;
    final response = await _apiProvider.get(
      "${Urls.GET_MY_AD_TYPE_URL}active?page=$_page",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _activeAdList = iterable.map((model) => Ad.fromJson(model)).toList();
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    isLoading = false;
    notifyListeners();
  }

  bool isremainingLoading = false;

  RemainingAd _remainingAd = RemainingAd();

  RemainingAd get RemainAd => _remainingAd;

  Future<void> getRemainingAd(BuildContext context) async {
    isremainingLoading = true;
    final response = await _apiProvider.get(
      "${Urls.GET_REMAINHING_ADS_URL}",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    print(response["status_code"]);

    if (response["status_code"] == 200) {
      Map<String, dynamic> iterable = response["response"]["data"];

      print(iterable);

      _remainingAd = RemainingAd.fromJson(iterable);
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    isremainingLoading = false;
    notifyListeners();
  }
}
