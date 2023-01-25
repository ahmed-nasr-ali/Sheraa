// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:sheraa/models/age.dart';
import 'package:sheraa/models/country.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class CountriesProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  String _currentLang = '';
  AuthProvider? _authProvider;
  void update(AuthProvider authProvider) {
    _authProvider = authProvider;
    _currentLang = authProvider.currentLang;
  }

  List<Country> countriesList = [];
  Future<List<Country>> getCountriesList(BuildContext context) async {
    final response = await _apiProvider
        .get(Urls.COUNTRIES_URL, header: {'Accept-Language': _currentLang});

    print(response['status_code']);
    print(response);
    if (response['status_code'] == 200) {
      print(response);
      Iterable iterable = response['response']['data'];

      countriesList = iterable.map((model) => Country.fromJson(model)).toList();
      notifyListeners();
    }else if( response['status_cod']==422){
      Commons.showError(context: context, message: response['response']['message']);
    }

    else
      Commons.showError(
          context: context, message: response['response']["message"]);
    return countriesList;
  }

  List<Age> agesList = [];
  Future<List<Age>> getAgesList(BuildContext context) async {
    final response = await _apiProvider
        .get(Urls.AGE_GROUP_URL, header: {'Accept-Language': _currentLang});

    print(response['status_code']);
    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      agesList = iterable.map((model) => Age.fromJson(model)).toList();
      notifyListeners();
    } else
      Commons.showError(
          context: context, message: response['response']["message"]);
    return agesList;
  }
}
