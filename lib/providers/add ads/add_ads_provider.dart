// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:sheraa/models/adding_ad.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class AddingAdsProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  Future<List<AddingAdModel>> getallCities(
      BuildContext context, int page) async {
    List<AddingAdModel> _cityList = [];
    print("${Urls.GET_ALL_CITIES_URL}$page");

    final response = await _apiProvider.get(
      "${Urls.GET_ALL_CITIES_URL}$page",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _cityList =
          iterable.map((model) => AddingAdModel.fromJson(model)).toList();
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }
    return _cityList;
  }

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  setIsLoading(bool loading) {
    _isLoading = loading;
    print("isLoading state is :$_isLoading");
    notifyListeners();
  }

  int _page = 2;

  int get page => _page;

  setPage(int pageNo) {
    _page = pageNo;
    print("page is $_page");
    notifyListeners();
  }

  bool _isFecthData = false;

  bool get isFecthData => _isFecthData;

  setIsFetchingData(bool isFetch) {
    _isFecthData = isFetch;
    print("is fetch state is : $_isFecthData");
    notifyListeners();
  }

  bool _doNotFethcNewData = false;

  bool get doNotFethcNewData => _doNotFethcNewData;

  setDonotFetchNewData(bool donotFetch) {
    _doNotFethcNewData = donotFetch;
    print("do not fetch new data from server : $_doNotFethcNewData");
    notifyListeners();
  }

  bool _hasMoreData = true;

  bool get hasMoreData => _hasMoreData;

  setHasMoreData(bool hasMoreDate) {
    _hasMoreData = hasMoreDate;
    print("has more data state is : $_hasMoreData");
    notifyListeners();
  }

  List<AddingAdModel> _listOfCities = [];

  List<AddingAdModel> get listOfCities => _listOfCities;

  setListOfCities(List<AddingAdModel> newCities) {
    _listOfCities.addAll(newCities);
    print("length of list of cities is : ${_listOfCities.length}");
    notifyListeners();
  }

  clearListOfCities() {
    _listOfCities.clear();
    notifyListeners();
  }

  ///searching part

  TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  clearController() {
    _controller.clear();
    notifyListeners();
  }

  Future<List<AddingAdModel>> getSearchingCities(
      BuildContext context, int page, String searchingText) async {
    List<AddingAdModel> _searchingCityList = [];
    print("${Urls.GET_ALL_CITIES_URL}$page&name=$searchingText");

    final response = await _apiProvider.get(
      "${Urls.GET_ALL_CITIES_URL}$page&name=$searchingText",
      header: {
        'Accept': 'application/json',
        "Accept-Language": UserData.getUSerLang(),
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${UserData.getUserApiToken()}"
      },
    );

    if (response["status_code"] == 200) {
      Iterable iterable = response["response"]["data"];

      _searchingCityList =
          iterable.map((model) => AddingAdModel.fromJson(model)).toList();
    } else if (response["status_code"] == 401) {
      Auth401Error(context);
    } else {
      Commons.showError(
          context: context, message: response['response']["message"]);
    }
    return _searchingCityList;
  }

  List<AddingAdModel> _searchingListOfCities = [];

  List<AddingAdModel> get searchingListOfCities => _searchingListOfCities;

  setSearchingListOfCities(List<AddingAdModel> newCities) {
    _searchingListOfCities.addAll(newCities);
    print(
        "length of searching list of cities is : ${_searchingListOfCities.length}");
    notifyListeners();
  }

  clearSearchingListOfCities() {
    _searchingListOfCities.clear();
    print(_searchingListOfCities);
    notifyListeners();
  }
}
