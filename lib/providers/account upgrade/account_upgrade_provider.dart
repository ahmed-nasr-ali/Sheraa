// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:sheraa/models/account_upgrade.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class AccountUpgradeProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  bool isLoading = false;

  List<AccountUpgradeModel> _accountUpgradeList = [];

  List<AccountUpgradeModel> get accountUpgradeList => _accountUpgradeList;

  Future<void> accountUpgradedata(BuildContext context) async {
    isLoading = true;
    final response = await _apiProvider.get(
      "${Urls.ACCOUNT_UPGRADE_URL}",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _accountUpgradeList =
          iterable.map((model) => AccountUpgradeModel.fromJson(model)).toList();
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

class AccountUpgradePakageId extends ChangeNotifier {
  ///for seller

  int _sellerPackage_Id = 0;

  setSellerPackageId(int packageId) {
    _sellerPackage_Id = packageId;
    notifyListeners();
  }

  int get sellerPackageId => _sellerPackage_Id;

  ///for store

  int _storePackage_Id = 0;

  setStorePackageId(int packageId) {
    _storePackage_Id = packageId;
    notifyListeners();
  }

  int get storePackageId => _storePackage_Id;
}

class AccountUpgradeToSellerOrStore extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  Future<bool> accountUpgradedataToSellerOrStore(
      BuildContext context, Map _body) async {
    final response = await _apiProvider.post(
      "${Urls.ACCOUNT_UPGRADE_TO_SELLER_OR_STORE_URL}",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}",
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
