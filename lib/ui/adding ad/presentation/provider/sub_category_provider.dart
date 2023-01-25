import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/sub_category_entity.dart';

import 'package:sheraa/ui/adding%20ad/domin/use%20cases/sub_category_use_case.dart';

class SubCategoryProvider extends ChangeNotifier {
  SubCategoryUseCase subCategoryUseCase;

  SubCategoryProvider({
    required this.subCategoryUseCase,
  });

  Future<List<SubCategoryEntity>> getSubCategoryList(
      int mainCategoryId,
      BuildContext context,
      int pageNumber,
      bool isSearching,
      String searchingText) async {
    List<SubCategoryEntity> _subCategoryList = [];

    _subCategoryList = await subCategoryUseCase.call(
        mainCategoryId, context, pageNumber, isSearching, searchingText);

    return _subCategoryList;
  }

  List<SubCategoryEntity> _subCategoryList = [];

  List<SubCategoryEntity> _searchingSubCategoryList = [];

  bool _isLoading = true;

  bool _noMoreData = false;

  bool _noMoreSearchingData = false;

  bool _isFecthData = false;

  bool _isFetchSearchingData = false;

  bool _loadingpagenationApi = true;

  bool _loadingSearchingPagenationnApi = true;

  String _searchingText = "";

  List<SubCategoryEntity> get subCategoryList => _subCategoryList;

  List<SubCategoryEntity> get searchingSubCategoryList =>
      _searchingSubCategoryList;

  bool get isLoading => _isLoading;

  bool get noMoreData => _noMoreData;

  bool get noMoreSearchingData => _noMoreSearchingData;

  bool get isFecthData => _isFecthData;

  bool get isFetchingSearchingData => _isFetchSearchingData;

  bool get loadingpagenationApi => _loadingpagenationApi;

  bool get loadingSearchingPagenationApi => _loadingSearchingPagenationnApi;

  String get searchingText => _searchingText;

  setDataToSubCategoryList(List<SubCategoryEntity> listOfSubCategory) {
    _subCategoryList.addAll(listOfSubCategory);
    print("Sub Category list is : ${_subCategoryList.length}");
    notifyListeners();
  }

  clearSubCategoryList() {
    _subCategoryList.clear();
    print("clear Sub Category list ${_subCategoryList.length}");
    notifyListeners();
  }

  setDataToSearchingSubCategoryList(List<SubCategoryEntity> listOfSubCategory) {
    _searchingSubCategoryList.addAll(listOfSubCategory);
    print(
        "searching sub Category list is : ${_searchingSubCategoryList.length}");
    notifyListeners();
  }

  clearSearchingSubCategoryList() {
    _searchingSubCategoryList.clear();
    print(
        "clear searching sub Category list ${_searchingSubCategoryList.length}");
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
    _subCategoryList.clear();
    _searchingSubCategoryList.clear();
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
