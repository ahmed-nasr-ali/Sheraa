import 'package:flutter/material.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/area_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/use%20cases/area_use_case.dart';

class AddingAdAreaProvider extends ChangeNotifier {
  AreaUseCase areaUseCase;

  AddingAdAreaProvider({
    required this.areaUseCase,
  });

  Future<List<AreaEntity>> getAreaList(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    List<AreaEntity> _areaList = [];

    _areaList =
        await areaUseCase.call(context, pageNumber, isSearching, searchingText);

    return _areaList;
  }

  List<AreaEntity> _areaList = [];

  List<AreaEntity> _searchingAreaList = [];

  bool _isLoading = true;

  bool _noMoreData = false;

  bool _noMoreSearchingData = false;

  bool _isFecthData = false;

  bool _isFetchSearchingData = false;

  bool _loadingpagenationApi = true;

  bool _loadingSearchingPagenationnApi = true;

  String _searchingText = "";

  List<AreaEntity> get areasList => _areaList;

  List<AreaEntity> get searchingAreasList => _searchingAreaList;

  bool get isLoading => _isLoading;

  bool get noMoreData => _noMoreData;

  bool get noMoreSearchingData => _noMoreSearchingData;

  bool get isFecthData => _isFecthData;

  bool get isFetchingSearchingData => _isFetchSearchingData;

  bool get loadingpagenationApi => _loadingpagenationApi;

  bool get loadingSearchingPagenationApi => _loadingSearchingPagenationnApi;

  String get searchingText => _searchingText;

  setDataToAreaList(List<AreaEntity> listOfAreas) {
    _areaList.addAll(listOfAreas);
    print("area list is : ${_areaList.length}");
    notifyListeners();
  }

  clearAreaList() {
    _areaList.clear();
    print("clear area list ${_areaList.length}");
    notifyListeners();
  }

  setDataToSearchingAreaList(List<AreaEntity> listOfAreas) {
    _searchingAreaList.addAll(listOfAreas);
    print("searching area list is : ${_searchingAreaList.length}");
    notifyListeners();
  }

  clearSearchingAreaList() {
    _searchingAreaList.clear();
    print("clear searching area list ${_searchingAreaList.length}");
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

  setSearchingText(String value) {
    _searchingText = value;
    print("Searching text is $_searchingText");
    notifyListeners();
  }

  setAllDateToDefault() {
    _areaList.clear();
    _searchingAreaList.clear();
    _isLoading = true;
    _noMoreData = false;
    _noMoreSearchingData = false;
    _isFecthData = false;
    _isFetchSearchingData = false;
    _loadingpagenationApi = true;
    _loadingSearchingPagenationnApi = true;
    _searchingText = "";
    notifyListeners();
  }
}
