import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/add_ads_provider.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/feature_entity.dart';

import 'package:sheraa/ui/adding%20ad/domin/use%20cases/features_use_case.dart';

class FeatureProvider extends ChangeNotifier {
  FeatureUseCase featureUseCase;

  FeatureProvider({
    required this.featureUseCase,
  });

  Future<List<FeatureEntity>> getFeatureList(
      BuildContext context, int pageNumber, int categoryId) async {
    List<FeatureEntity> _featureList = [];

    _featureList = await featureUseCase.call(context, pageNumber, categoryId);

    return _featureList;
  }

  List<FeatureEntity> _featureList = [];

  bool _isLoading = true;

  bool _noMoreData = false;

  bool _noMoreSearchingData = false;

  bool _isFecthData = false;

  bool _isFetchSearchingData = false;

  bool _loadingpagenationApi = true;

  bool _loadingSearchingPagenationnApi = true;

  List<FeatureEntity> get featureList => _featureList;

  bool get isLoading => _isLoading;

  bool get noMoreData => _noMoreData;

  bool get noMoreSearchingData => _noMoreSearchingData;

  bool get isFecthData => _isFecthData;

  bool get isFetchingSearchingData => _isFetchSearchingData;

  bool get loadingpagenationApi => _loadingpagenationApi;

  bool get loadingSearchingPagenationApi => _loadingSearchingPagenationnApi;

  setDataToFeatureList(List<FeatureEntity> listOfFeature) {
    _featureList.addAll(listOfFeature);
    print("feature list is : ${_featureList.length}");
    notifyListeners();
  }

  clearFeatureList() {
    _featureList.clear();
    print("clear feature list ${_featureList.length}");
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
    _featureList.clear();
    _isLoading = true;
    _noMoreData = false;
    _noMoreSearchingData = false;
    _isFecthData = false;
    _isFetchSearchingData = false;
    _loadingpagenationApi = true;
    _loadingSearchingPagenationnApi = true;

    notifyListeners();
  }

  ///==========================================

  List _compare = [];

  List get compare => _compare;

  List _showMessageErro = [];

  List get showMessageErro => _showMessageErro;

  String _showMessage = "1";

  String get showMessage => _showMessage;

  setCheckFeatureSelecttoDefault() {
    _compare.clear();
    _showMessageErro.clear();
    _showMessage = "";
  }

  checkSelect(BuildContext context) {
    if (!isLoading) {
      _compare.clear();
      _showMessageErro.clear();

      Provider.of<AddOptionsIdAndFeatureName>(context, listen: false)
          .opttinName
          .forEach((item) {
        _compare.add(item["Feature_Name"]);
      });

      print(_compare.toString());

      _featureList.forEach((element) {
        if (!_compare.contains(element.name)) {
          _showMessageErro.add(element.name);
        }
      });

      if (_showMessageErro.isNotEmpty) {
        _showMessage = _showMessageErro[0];
        notifyListeners();
      } else {
        _showMessage = "";
        notifyListeners();
      }
    }
  }
}
