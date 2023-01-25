// // ignore_for_file: unused_field, unused_local_variable

// import 'package:flutter/cupertino.dart';
// import 'package:sheraa/models/ad.dart';
// import 'package:sheraa/models/slider_data.dart';
// import 'package:sheraa/models/store_icon.dart';
// import 'package:sheraa/networking/api_provider.dart';
// import 'package:sheraa/shared_preferences/user_information_data.dart';
// import 'package:sheraa/utils/commons.dart';
// import 'package:sheraa/utils/urls.dart';

// class HomeAdsProviders extends ChangeNotifier {
//   ApiProvider _apiProvider = ApiProvider();

//   bool sliderLoading = false;

//   List<Slider> _sliderImgList = [];

//   int _sliderPage = 1;

//   List<Slider> get sliderImagList => _sliderImgList;

//   int get sliderPage => _sliderPage;

//   Future<void> getSliderImages(BuildContext context) async {
//     sliderLoading = true;

//     final response = await _apiProvider.get(
//       "${Urls.ADS_SLIDER}?page=$_sliderPage",
//       header: {
//         'Accept': 'application/json',
//         "Accept-Language": UserData.getUSerLang(),
//         'Content-Type': 'application/json',
//       },
//     );

//     if (response['status_code'] == 200) {
//       Iterable iterable = response['response']['data'];

//       _sliderImgList = iterable.map((model) => Slider.fromJson(model)).toList();
//     } else {
//       Commons.showError(
//           context: context, message: response['response']["message"]);
//     }
//     sliderLoading = false;
//     notifyListeners();
//   }

//   bool storeIconLoading = false;

//   List<StoreIcon> _storeIconsList = [];

//   int _storeIconPage = 1;

//   List<StoreIcon> get storeIconsList => _storeIconsList;

//   int get storeIconPage => _storeIconPage;

//   Future<void> getStoreIcon(BuildContext context) async {
//     storeIconLoading = true;

//     final response = await _apiProvider.get(
//       "${Urls.STORES_ICONS_URL}?page=$_storeIconPage",
//       header: {
//         'Accept': 'application/json',
//         "Accept-Language": UserData.getUSerLang(),
//         'Content-Type': 'application/json',
//       },
//     );

//     if (response['status_code'] == 200) {
//       Iterable iterable = response['response']['data'];

//       _storeIconsList =
//           iterable.map((model) => StoreIcon.fromJson(model)).toList();
//     } else {
//       Commons.showError(
//           context: context, message: response['response']["message"]);
//     }
//     storeIconLoading = false;
//     notifyListeners();
//   }

//   bool adsLoading = false;

//   List<Ad> _adsList = [];

//   List<Ad> get adsList => _adsList;

//   Future<void> getAllAds(BuildContext context) async {
//     adsLoading = true;

//     final response = await _apiProvider.get(
//       "${Urls.ADS_URL}",
//       header: {
//         'Accept': 'application/json',
//         "Accept-Language": UserData.getUSerLang(),
//         'Content-Type': 'application/json',
//         "Authorization": "Bearer ${UserData.getUserApiToken()}"
//       },
//     );
//     if (response['status_code'] == 200) {
//       Iterable iterable = response['response']['data'];

//       _adsList = iterable.map((model) => Ad.fromJson(model)).toList();
//     } else {
//       Commons.showError(
//           context: context, message: response['response']["message"]);
//     }
//     adsLoading = false;
//     notifyListeners();
//   }
// }
