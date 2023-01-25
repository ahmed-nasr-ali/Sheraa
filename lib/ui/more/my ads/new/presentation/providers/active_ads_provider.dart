import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';

import 'package:sheraa/ui/more/my%20ads/new/domin/use%20case/get_active_ads_use_case.dart';

class MyActiveAdsProvider extends ChangeNotifier {
  MyAdsGetActiveAdsUseCase myAdsGetActiveAdsUseCase;

  MyActiveAdsProvider({
    required this.myAdsGetActiveAdsUseCase,
  });

  Future<List<AdEntity>> getMyActiveAds(
      BuildContext context, int pageNumber) async {
    return await myAdsGetActiveAdsUseCase.call(context, pageNumber);
  }

  List<AdEntity> _myActiveAdsList = [];

  bool _isLoading = true;

  bool _noMoreData = false;

  bool _noMoreSearchingData = false;

  bool _isFecthData = false;

  bool _isFetchSearchingData = false;

  bool _loadingpagenationApi = true;

  bool _loadingSearchingPagenationnApi = true;

  List<AdEntity> get myActiveAdsList => _myActiveAdsList;

  bool get isLoading => _isLoading;

  bool get noMoreData => _noMoreData;

  bool get noMoreSearchingData => _noMoreSearchingData;

  bool get isFecthData => _isFecthData;

  bool get isFetchingSearchingData => _isFetchSearchingData;

  bool get loadingpagenationApi => _loadingpagenationApi;

  bool get loadingSearchingPagenationApi => _loadingSearchingPagenationnApi;

  setDataToMyActiveAdsList(List<AdEntity> listOfMyActiveAdsList) {
    _myActiveAdsList.addAll(listOfMyActiveAdsList);
    print("my active ad list is : ${_myActiveAdsList.length}");
    notifyListeners();
  }

  clearMyActiveAdsList() {
    _myActiveAdsList.clear();
    print("clear my active ad list ${_myActiveAdsList.length}");
    notifyListeners();
  }

  setIsLoading(bool loading) {
    _isLoading = loading;
    print("is loading state is : $_isLoading");
    notifyListeners();
  }

  setNoMoreData(bool donotFetch) {
    _noMoreData = donotFetch;
    print("do not fetch new data from server : $_noMoreData");
    notifyListeners();
  }

  setNoMoreSearchingData(bool donotFetch) {
    _noMoreSearchingData = donotFetch;
    print(
        "do not fetch new searching data from server : $_noMoreSearchingData");
    notifyListeners();
  }

  setIsFetchingData(bool isFetch) {
    _isFecthData = isFetch;
    print("is fetch state is : $_isFecthData");
    notifyListeners();
  }

  setIsFetchingSearchingData(bool isFetch) {
    _isFetchSearchingData = isFetch;
    print("is fetch  Searching state is : $_isFetchSearchingData");
    notifyListeners();
  }

  setPagenationApiLoading(bool loading) {
    _loadingpagenationApi = loading;
    print("pagenation loading state is $_loadingpagenationApi");
    notifyListeners();
  }

  setSearchingPagenationApiLoading(bool loading) {
    _loadingSearchingPagenationnApi = loading;
    print(
        "searching pagenation loading state is $_loadingSearchingPagenationnApi");
    notifyListeners();
  }

  setAllDateToDefault() {
    _myActiveAdsList.clear();
    _isLoading = true;
    _noMoreData = false;
    _noMoreSearchingData = false;
    _isFecthData = false;
    _isFetchSearchingData = false;
    _loadingpagenationApi = true;
    _loadingSearchingPagenationnApi = true;
    notifyListeners();
  }
}
