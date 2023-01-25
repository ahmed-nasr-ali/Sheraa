// ignore_for_file: non_constant_identifier_names, unused_field

import 'package:flutter/cupertino.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class IncreaseVeiwsProvider extends ChangeNotifier {
  ///vip ads
  int _vipAdsNumber = 1;

  increaseVipNo() {
    _vipAdsNumber++;
    notifyListeners();
  }

  dereaseVipNo() {
    _vipAdsNumber--;
    notifyListeners();
    if (_vipAdsNumber < 1) {
      _vipAdsNumber = 1;
      notifyListeners();
    }
  }

  int get vipAdsNumber => _vipAdsNumber;

  ///special ads
  int _specialAdsNumber = 1;

  increaseSpecialNo() {
    _specialAdsNumber++;
    notifyListeners();
  }

  dereaseSpeicalNo() {
    _specialAdsNumber--;
    notifyListeners();
    if (_specialAdsNumber < 1) {
      _specialAdsNumber = 1;
      notifyListeners();
    }
  }

  int get specialAdsNumber => _specialAdsNumber;

  ///increase views to seller or store
  ApiProvider _apiProvider = ApiProvider();

  Future<bool> increaseViewsforAdtoSellerOrStore(
      BuildContext context, Map _body) async {
    final response = await _apiProvider.post(
      "${Urls.AD_PROMOTION_URL}sellerAndCertifiedStore",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: _body,
    );
    print(response["status_code"]);

    print(response["response"]["date"]);
    if (response["status_code"] == 200) {
      return true;
    } else if (response["status_code"] == 401) {
      Auth401Error(context);

      return false;
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
      return false;
    }
  }

  Future<bool> increaseViewsforAdtoCustomer(
      BuildContext context, Map _body) async {
    final response = await _apiProvider.post(
      "${Urls.AD_PROMOTION_URL}customer",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: _body,
    );

    if (response["status_code"] == 200) {
      return true;
    } else if (response["status_code"] == 401) {
      Auth401Error(context);

      return false;
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
      return false;
    }
  }
}
