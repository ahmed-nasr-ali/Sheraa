// ignore_for_file: unused_field, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class GetAllMyFavoriteAdsListProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  bool isLoading = false;

  List<Ad> _myFavoriteAdsList = [];

  int _page = 1;

  List<Ad> get myFavoriteAdsList => _myFavoriteAdsList;

  int get page => _page;

  Future<void> getMyFavoriteAdsList(BuildContext context) async {
    isLoading = true;
    final response = await _apiProvider.get(
      "${Urls.GET_FAVORITE_AD_URL}?page=$_page",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );
    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _myFavoriteAdsList = iterable.map((model) => Ad.fromJson(model)).toList();
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

//todo needed this class
class AddAdToFavoriteAdList extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  bool methodCompelet = false;

  Future<void> addingAdToFavoriteAdList(BuildContext context, Map body) async {
    // print("add to faviorte ad List");

    methodCompelet = false;
    final response = await _apiProvider.post(
      "${Urls.ADD_AND_DELETE_AD_FORM_FAVORITE_AD_LIST_URL}create",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: body,
    );

    if (response["status_code"] == 200) {
      snakBarWidget(
        context: context,
        content: AppLocalizations.of(context)!
            .translate("The ad has been added to your favorit ads"),
      );
      methodCompelet = true;
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    notifyListeners();
  }
}

//todo needed this class
class DeleteAdFromFavoriteAdList extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  bool methodCompelet = false;

  Future<void> deletingAdFromFavoriteAdList(
      BuildContext context, Map body) async {
    methodCompelet = false;
    final response = await _apiProvider.post(
      "${Urls.ADD_AND_DELETE_AD_FORM_FAVORITE_AD_LIST_URL}delete",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
      body: body,
    );

    if (response["status_code"] == 200) {
      snakBarWidget(
        context: context,
        content: AppLocalizations.of(context)!
            .translate("The ad has been deleted from your favorit ads"),
      );
      methodCompelet = true;
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }

    notifyListeners();
  }
}

//todo needed this class
class FavoriteAdUpdateUiProvider extends ChangeNotifier {
  List _addingAdToFavoriteAdList = [];
  List _deletingAdFromFavoriteAdList = [];

  methodAddingAdToFavoriteAddList(int adId) {
    if (_deletingAdFromFavoriteAdList.contains(adId)) {
      _deletingAdFromFavoriteAdList.removeWhere((item) => item == adId);
    }

    _addingAdToFavoriteAdList.contains(adId)
        ? _addingAdToFavoriteAdList.removeWhere((item) => item == adId)
        : _addingAdToFavoriteAdList.add(adId);

    // print("favorite ad is :  $_addingAdToFavoriteAdList");
  }

  List get addingAdToFavoriteAdList => _addingAdToFavoriteAdList;

  ///========================================================================

  methodDeletingAdFromFavoriteAddList(int adId) {
    if (_addingAdToFavoriteAdList.contains(adId)) {
      _addingAdToFavoriteAdList.removeWhere((item) => item == adId);
    }

    _deletingAdFromFavoriteAdList.contains(adId)
        ? _deletingAdFromFavoriteAdList.removeWhere((item) => item == adId)
        : _deletingAdFromFavoriteAdList.add(adId);

    // print("delete ad from favorite List is :  $_deletingAdFromFavoriteAdList");
  }

  List get deleteingAdfromFavoriteAdList => _deletingAdFromFavoriteAdList;
}
