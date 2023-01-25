// ignore_for_file: unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class UserProfileProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  User _user = User();

  Future<User> getUserProfileData(BuildContext context) async {
    final response = await _apiProvider.get(
      "${Urls.USER_PROFILE_URL}",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    print(response['status_code']);
    print(response);

    if (response['status_code'] == 200) {
      Map<String, dynamic> iterable = response['response']['data'];

      _user = User.fromJson(iterable);

      notifyListeners();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _user;
  }

  Future<User> getUserDataById(BuildContext context, String id) async {
    final response = await _apiProvider.get(
      "${Urls.GET_USER_BY_ID_URl}$id",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    print(response['status_code']);
    print(response['response']['data'][0]);

    if (response['status_code'] == 200) {
      Map<String, dynamic> iterable = response['response']['data'];

      _user = User.fromJson(iterable);

      notifyListeners();
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    return _user;
  }
}
