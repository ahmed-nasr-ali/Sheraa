// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class UnActiveAdProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  bool isLoading = false;

  setIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  List<Ad> _unActiveAdList = [];

  int _page = 1;

  List<Ad> get unActiveAdList => _unActiveAdList;

  int get page => _page;

  Future<void> getUnActiveAdList(BuildContext context) async {
    isLoading = true;
    final response = await _apiProvider.get(
      "${Urls.GET_MY_AD_TYPE_URL}inactive?page=$_page",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    print(response["status_code"]);
    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _unActiveAdList = iterable.map((model) => Ad.fromJson(model)).toList();
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    isLoading = false;
    notifyListeners();
  }
}
