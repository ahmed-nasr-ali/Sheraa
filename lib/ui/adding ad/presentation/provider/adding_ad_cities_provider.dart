import 'package:flutter/material.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/cities_entities.dart';
import 'package:sheraa/ui/adding%20ad/domin/use%20cases/cities_use_case.dart';

class AddingAdCitiesProvider extends ChangeNotifier {
  CitiesUseCase citiesUseCase;

  AddingAdCitiesProvider({
    required this.citiesUseCase,
  });

  Future<List<CitiesEntity>> getCitiesList(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    List<CitiesEntity> _citiesList = [];

    _citiesList = await citiesUseCase.call(
        context, pageNumber, isSearching, searchingText);

    return _citiesList;
  }

  List<CitiesEntity> _citiesList = [];

  List<CitiesEntity> _searchingCitiesList = [];

  bool _isLoading = true;

  bool _noMoreData = false;

  bool _noMoreSearchingData = false;

  bool _isFecthData = false;

  bool _isFetchSearchingData = false;

  bool _loadingpagenationApi = true;

  bool _loadingSearchingPagenationnApi = true;

  String _searchingText = "";

  List<CitiesEntity> get citiesList => _citiesList;

  List<CitiesEntity> get searchingCitiesList => _searchingCitiesList;

  bool get isLoading => _isLoading;

  bool get noMoreData => _noMoreData;

  bool get noMoreSearchingData => _noMoreSearchingData;

  bool get isFecthData => _isFecthData;

  bool get isFetchingSearchingData => _isFetchSearchingData;

  bool get loadingpagenationApi => _loadingpagenationApi;

  bool get loadingSearchingPagenationApi => _loadingSearchingPagenationnApi;

  String get searchingText => _searchingText;

  setDataToCitiesList(List<CitiesEntity> listOfCities) {
    _citiesList.addAll(listOfCities);
    print("cities list is : ${_citiesList.length}");
    notifyListeners();
  }

  clearCitiesList() {
    _citiesList.clear();
    print("clear cities list ${_citiesList.length}");
    notifyListeners();
  }

  setDataToSearchingCitiesList(List<CitiesEntity> listOfCities) {
    _searchingCitiesList.addAll(listOfCities);
    print("searching cities list is : ${_searchingCitiesList.length}");
    notifyListeners();
  }

  clearSearchingCitiesList() {
    _searchingCitiesList.clear();
    print("clear searching cities list ${_searchingCitiesList.length}");
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
    _citiesList.clear();
    _searchingCitiesList.clear();
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
