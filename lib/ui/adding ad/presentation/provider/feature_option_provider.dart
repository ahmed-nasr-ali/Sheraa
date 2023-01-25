import 'package:flutter/material.dart';

import 'package:sheraa/ui/adding%20ad/domin/entities/feature_options_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/use%20cases/feature_option_use_case.dart';

class FeatureOptionProvider extends ChangeNotifier {
  FeatureOptionUseCase featureOptionUseCase;

  FeatureOptionProvider({
    required this.featureOptionUseCase,
  });

  Future<List<FeatureOptionEntity>> getFeatureOptionList(
      BuildContext context, int pageNumber, int featureId) async {
    List<FeatureOptionEntity> _featureOptionList = [];

    _featureOptionList =
        await featureOptionUseCase.call(context, pageNumber, featureId);

    return _featureOptionList;
  }

  List<FeatureOptionEntity> _featureOptionList = [];

  bool _isLoading = true;

  bool _noMoreData = false;

  bool _noMoreSearchingData = false;

  bool _isFecthData = false;

  bool _isFetchSearchingData = false;

  bool _loadingpagenationApi = true;

  bool _loadingSearchingPagenationnApi = true;

  List<FeatureOptionEntity> get featureOptionList => _featureOptionList;

  bool get isLoading => _isLoading;

  bool get noMoreData => _noMoreData;

  bool get noMoreSearchingData => _noMoreSearchingData;

  bool get isFecthData => _isFecthData;

  bool get isFetchingSearchingData => _isFetchSearchingData;

  bool get loadingpagenationApi => _loadingpagenationApi;

  bool get loadingSearchingPagenationApi => _loadingSearchingPagenationnApi;

  setDataToFeatureOptionList(List<FeatureOptionEntity> listOfFeatureOption) {
    _featureOptionList.addAll(listOfFeatureOption);
    print("feature option list is : ${_featureOptionList.length}");
    notifyListeners();
  }

  clearFeatureOptionList() {
    _featureOptionList.clear();
    print("clear feature list ${_featureOptionList.length}");
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
    _featureOptionList.clear();
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
