// ignore_for_file: prefer_final_fields, unused_field, unnecessary_string_interpolations, avoid_print, non_constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_function_literals_in_foreach_calls

import 'package:flutter/cupertino.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class GetSpecificAdAndUserAdsProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  Ad _adDetails = Ad();

  Future<Ad> getAllAds(BuildContext context, String ad_Id) async {
    final response = await _apiProvider.get(
      "${Urls.ADS_URL}/$ad_Id",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    if (response['status_code'] == 200) {
      Map<String, dynamic> iterable = response['response']['data'];

      _adDetails = Ad.fromJson(iterable);
      print(
          "=========================================================${_adDetails.id}===========${_adDetails.name}");

      notifyListeners();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _adDetails;
  }

  List<Ad> _userAdsList = [];

  List<Ad> get userAdsList => _userAdsList;

  Future<bool> getUserAdsList(BuildContext context, int userId) async {
    final response = await _apiProvider.get(
      "${Urls.ADS_URL}?user_id=$userId",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      _userAdsList = iterable.map((model) => Ad.fromJson(model)).toList();

      notifyListeners();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }
    return false;
  }
}
