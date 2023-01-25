import 'package:flutter/cupertino.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls/favorite%20ad%20urls/favorite_ads_urls.dart';

abstract class FavoriteAdRemoteDataSource {
  Future<bool> addingAdToFavoriteAdList(
      BuildContext context, Map<String, dynamic> body);

  Future<bool> deletingAdFromFavoriteAdList(
      BuildContext context, Map<String, dynamic> body);
}

class FavoriteAdReomteDataSourceIMP implements FavoriteAdRemoteDataSource {
  ApiProvider _apiProvider = ApiProvider();

  @override
  Future<bool> addingAdToFavoriteAdList(
      BuildContext context, Map<String, dynamic> body) async {
    final response = await _apiProvider.post(
      "${FavoriteAdsUrls.FAVORITE_ADS_URLS}create",
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

  @override
  Future<bool> deletingAdFromFavoriteAdList(
      BuildContext context, Map<String, dynamic> body) async {
    final response = await _apiProvider.post(
      "${FavoriteAdsUrls.FAVORITE_ADS_URLS}delete",
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
