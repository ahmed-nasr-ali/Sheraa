import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/main_category_entity.dart';

import 'package:sheraa/ui/adding%20ad/domin/use%20cases/main_category_usecase.dart';

class MainCategoryProvider extends ChangeNotifier {
  MainCategoryUseCase getMainCategoryUseCase;

  MainCategoryProvider({
    required this.getMainCategoryUseCase,
  });

  Future<List<MainCategoryEntity>> getMainCategoryList(BuildContext context,
      int pageNumber, bool isSearching, String searchingText) async {
    List<MainCategoryEntity> _mainCategoryList = [];
    _mainCategoryList = await getMainCategoryUseCase.call(
        context, pageNumber, isSearching, searchingText);

    return _mainCategoryList;
  }

  List<MainCategoryEntity> _mainCategoryList = [];

  List<MainCategoryEntity> _searchingMainCategoryList = [];

  bool _isLoading = true;

  bool _noMoreData = false;

  bool _noMoreSearchingData = false;

  bool _isFecthData = false;

  bool _isFetchSearchingData = false;

  bool _loadingpagenationApi = true;

  bool _loadingSearchingPagenationnApi = true;

  String _searchingText = "";

  List<MainCategoryEntity> get mainCategoryList => _mainCategoryList;

  List<MainCategoryEntity> get searchingMainCategoryList =>
      _searchingMainCategoryList;

  bool get isLoading => _isLoading;

  bool get noMoreData => _noMoreData;

  bool get noMoreSearchingData => _noMoreSearchingData;

  bool get isFecthData => _isFecthData;

  bool get isFetchingSearchingData => _isFetchSearchingData;

  bool get loadingpagenationApi => _loadingpagenationApi;

  bool get loadingSearchingPagenationApi => _loadingSearchingPagenationnApi;

  String get searchingText => _searchingText;

  setDataToMainCategoryList(List<MainCategoryEntity> listOfMainCategory) {
    _mainCategoryList.addAll(listOfMainCategory);
    print("Main Category list is : ${_mainCategoryList.length}");
    notifyListeners();
  }

  clearMainCategoryList() {
    _mainCategoryList.clear();
    print("clear Main Category list ${_mainCategoryList.length}");
    notifyListeners();
  }

  setDataToSearchingMainCategoryList(
      List<MainCategoryEntity> listOfMainCategory) {
    _searchingMainCategoryList.addAll(listOfMainCategory);
    print(
        "searching Main Category list is : ${_searchingMainCategoryList.length}");
    notifyListeners();
  }

  clearSearchingMainCategoryList() {
    _searchingMainCategoryList.clear();
    print(
        "clear searching Main Category list ${_searchingMainCategoryList.length}");
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
    _mainCategoryList.clear();
    _searchingMainCategoryList.clear();
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
