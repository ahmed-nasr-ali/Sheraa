import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/models/slider_data.dart';
import 'package:sheraa/models/store_icon.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/utils/urls.dart';

class AdsProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();

  String _currentLang = '';
  AuthProvider? _authProvider;
  int currentPageSlider = 1;
  int currentPageStoreIcon = 1;
  int currentPageAds = 1;

  late int toPages;
  late int totalAdPages;
  late int totalAllAdPages;

  late RefreshController sliderRefreshController;
  // =
  // RefreshController(initialRefresh: true);
  late RefreshController storeRefreshController;

  // RefreshController(initialRefresh: true);
  late RefreshController adsRefreshController;
  // =
  // RefreshController(initialRefresh: true);
  late RefreshController allAdsRefreshController =
      RefreshController(initialRefresh: true);
  void update(AuthProvider authProvider) {
    _authProvider = authProvider;
    _currentLang = authProvider.currentLang;
  }

  List<Slider> sliderImgList = [];

  Future<bool> getSliderImages(BuildContext context,
      {bool isRefresh = false}) async {
    if (isRefresh) {
      currentPageSlider = 1;
    } else {
      if (currentPageSlider >= toPages) {
        sliderRefreshController.loadNoData();
        return false;
      }
    }

    final response = await _apiProvider.get(
        Urls.ADS_SLIDER + "?page=$currentPageSlider",
        header: {'Accept-Language': _currentLang});
    print(response);
    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      if (isRefresh) {
        sliderImgList =
            iterable.map((model) => Slider.fromJson(model)).toList();
      } else {
        sliderImgList
            .addAll(iterable.map((model) => Slider.fromJson(model)).toList());
      }
      currentPageSlider++;
      toPages = response['response']['meta']['to'];
      print(response);
      print("slider_current_page:$currentPageSlider");
      notifyListeners();
      return true;
    } else {
      print(response);
      return false;
    }
  }

  List<StoreIcon> storeIcons = [];

  Future<bool> getStoreIcons(BuildContext context,
      {bool isRefresh = false}) async {
    print("currentPageStoreIcon:$currentPageStoreIcon");
    if (isRefresh) {
      currentPageStoreIcon = 1;
    } else {
      if (currentPageStoreIcon >= toPages) {
        storeRefreshController.loadNoData();
        return false;
      }
    }

    final response = await _apiProvider.get(
        Urls.STORES_ICONS_URL + "?page=$currentPageStoreIcon",
        header: {'Accept-Language': _currentLang});
    print(response);
    if (response['status_code'] == 200) {
      Iterable iterable = response['response']['data'];

      if (isRefresh) {
        storeIcons =
            iterable.map((model) => StoreIcon.fromJson(model)).toList();
      } else {
        storeIcons.addAll(
            iterable.map((model) => StoreIcon.fromJson(model)).toList());
      }
      currentPageStoreIcon++;
      toPages = response['response']['meta']['to'];
      print("currentPageStoreIcon:$currentPageStoreIcon");
      print("ToPage:$toPages");

      print(response);
      notifyListeners();
      return true;
    } else {
      print(response);
      return false;
    }
  }

  List<Ad> adsList = [];


  Future<bool> getAllAds(BuildContext context, {bool isRefresh = false}) async {
    print("currentPageAds:$currentPageAds");
    if (isRefresh) {
      currentPageAds = 1;
    } else {
      if (currentPageAds >= totalAdPages) {

        allAdsRefreshController.loadNoData();
        return false;
      }
    }
    final response = await _apiProvider.get(
        Urls.ADS_URL + "?page=$currentPageAds",
        header: {'Accept-Language': _currentLang});
    print("ads url :${Urls.ADS_URL + "?page=$currentPageAds"}");
    if (response['status_code'] == 200) {
      totalAllAdPages = response['response']['meta']['last_page'];

      Iterable iterable = response['response']['data'];
      adsList = iterable.map((model) => Ad.fromJson(model)).toList();

      // if (isRefresh) {
      //   adsList = iterable.map((model) => Ad.fromJson(model)).toList();
      // } else {
      //   print("isRefresh:$isRefresh");
      //   adsList.addAll(iterable.map((model) => Ad.fromJson(model)).toList());
      //   print("adsList leng${adsList.length}");
      // }
      // currentPageAds++;
      // totalAdPages = response['response']['meta']['last_page'];
      // print("currentPageAds:$currentPageAds");
      // print("total_ads_pages:$totalAdPages");
      //
       print(response);
      notifyListeners();
      return true;
    } else {
      print(response);
      return false;
    }
  }

  Future<bool> getAllAdsMoreData(BuildContext context, {bool isRefresh = false}) async {
    print("currentPageAds:$currentPageAds");

      if (totalAdPages>=currentPageAds) {

        allAdsRefreshController.loadNoData();
        currentPageAds+=1;
        return false;

    }
    final response = await _apiProvider.get(
        Urls.ADS_URL + "?page=$currentPageAds",
        header: {'Accept-Language': _currentLang});
    print("ads url :${Urls.ADS_URL + "?page=$currentPageAds"}");
    if (response['status_code'] == 200) {
      totalAllAdPages = response['response']['meta']['last_page'];

      Iterable iterable = response['response']['data'];
      // adsList = iterable.map((model) => Ad.fromJson(model)).toList();

      // if (isRefresh) {
      //   adsList = iterable.map((model) => Ad.fromJson(model)).toList();
      // } else {
      //   print("isRefresh:$isRefresh");
       adsList.addAll(iterable.map((model) => Ad.fromJson(model)).toList());
        print("adsList leng${adsList.length}");
      // }
      // currentPageAds++;
      // totalAdPages = response['response']['meta']['last_page'];
      // print("currentPageAds:$currentPageAds");
      // print("total_ads_pages:$totalAdPages");
      //
      print(response);
      notifyListeners();
      return true;
    } else {
      print(response);
      return false;
    }
  }







  int _cityId = 0;

  void setCityId(int id) {
    _cityId = id;
    notifyListeners();
  }

  int get cityId => _cityId;

  String _cityName = '';

  void setCityName(String cityName) {
    _cityName = cityName;
    notifyListeners();
  }

  String get cityName => _cityName;

  int _areaId = 0;

  void setAreaId(int id) {
    _areaId = id;
    notifyListeners();
  }

  int get areaId => _areaId;

  String _areaName = '';

  void setAreaName(String areaName) {
    _areaName = areaName;
    notifyListeners();
  }

  String get areaName => _areaName;

  int _departmentId = 0;

  void setDepartmentId(int id) {
    _departmentId = id;
    notifyListeners();
  }

  int get departmentId => _departmentId;

  String _departmentName = '';

  void setDepartmentName(String departmentName) {
    _departmentName = departmentName;
    notifyListeners();
  }

  String get departmentName => _departmentName;

  int _subDepartmentId = 0;

  void setSubDepartmentId(int id) {
    _subDepartmentId = id;
    notifyListeners();
  }

  int get subDepartmentId => _subDepartmentId;

  String _subDepartmentName = '';

  void setSubDepartmentName(String subDepartmentName) {
    _subDepartmentName = subDepartmentName;
    notifyListeners();
  }

  String get subDepartmentName => _subDepartmentName;

  bool changingAdView = false;
  void setChangingAdView() {
    changingAdView = !changingAdView;
    notifyListeners();
  }

  bool get isChangingAdView => changingAdView;

  bool _theLatestSelected = false;
  void setAdsLatest() {
    _theLatestSelected = !_theLatestSelected;
    notifyListeners();
  }

  bool get adsTheLatestSelected => _theLatestSelected;

  bool _theNearestSelected = false;
  void setAdsNearest() {
    _theNearestSelected = !_theNearestSelected;
    notifyListeners();
  }

  bool get adsTheNearestSelected => _theNearestSelected;

  bool _theLowerPriceSelected = false;
  void setAdsLowerPriceSelected() {
    _theLowerPriceSelected = !_theLowerPriceSelected;
    notifyListeners();
  }

  bool get adsTheLowerPriceSelected => _theLowerPriceSelected;

  bool theMostPriceSelected = false;
  void setAdsMostPriceSelected() {
    theMostPriceSelected = !theMostPriceSelected;
    notifyListeners();
  }

  bool get adsTheMostPriceSelected => theMostPriceSelected;
  bool _adsFavoriteIsSwitched = false;
  void setAdsFavoriteSwitcher(bool isSwitcher) {
    _adsFavoriteIsSwitched = !_adsFavoriteIsSwitched;
    notifyListeners();
  }

  bool get adsFavoriteIsSwitched => _adsFavoriteIsSwitched;

  bool _adsWithImagesIsSwitched = false;
  void setAdsWithImagesIsSwitcher(bool isSwitcher) {
    _adsWithImagesIsSwitched = !_adsWithImagesIsSwitched;
    notifyListeners();
  }

  bool get adsWithImagesIsSwitched => _adsWithImagesIsSwitched;

  bool _adsWithPriceIsSwitched = false;
  void setAdsWithPriceIsSwitcher(bool isSwitcher) {
    _adsWithPriceIsSwitched = !_adsWithPriceIsSwitched;
    notifyListeners();
  }

  bool get adsWithPriceIsSwitched => _adsWithPriceIsSwitched;

  bool _membersAdsIsSwitched = false;
  void setMembersAdIsSwitcher(bool isSwitcher) {
    _membersAdsIsSwitched = !_membersAdsIsSwitched;
    notifyListeners();
  }

  bool get membersAdsIsSwitched => _membersAdsIsSwitched;

  bool _storesAdsIsSwitched = false;
  void setStoresAdIsSwitcher(bool isSwitcher) {
    _storesAdsIsSwitched = !_storesAdsIsSwitched;
    notifyListeners();
  }

  bool get storesAdsIsSwitched => _storesAdsIsSwitched;

  bool _featuredAdsIsSwitched = false;
  void setFeaturedAdsIsSwitcher(bool isSwitcher) {
    _featuredAdsIsSwitched = !_featuredAdsIsSwitched;
    notifyListeners();
  }

  bool get featuredAdsIsSwitched => _featuredAdsIsSwitched;
}
