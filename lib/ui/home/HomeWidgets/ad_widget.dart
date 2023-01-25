// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
// import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/providers/ads_provider.dart';
// import 'package:sheraa/providers/navigation_provider.dart';
// import 'package:sheraa/providers/theme_provider.dart';
// import 'package:sheraa/ui/home/HomeWidgets/AllAdvertisermentProduct.dart';
// import 'package:sheraa/ui/home/HomeWidgets/CarouselWithIndicator.dart';
// import 'package:sheraa/ui/home/HomeWidgets/CustomContainerFodAdevertissment.dart';
// import 'package:sheraa/utils/app_colors.dart';

// class HomeAds extends StatefulWidget {
//   const HomeAds({Key? key}) : super(key: key);

//   @override
//   _HomeAdsState createState() => _HomeAdsState();
// }

// class _HomeAdsState extends State<HomeAds> {
//   ThemeProvider? themeProvider;
//   double width = 0;
//   double height = 0;
//   AdsProvider? _adsProvider;
//   NavigationProvider? _navigationProvider;

//   final List<String> imgList = [
//     "assets/images/slider.png",
//     "assets/images/slider.png",
//     "assets/images/slider.png",
//     "assets/images/slider.png"
//   ];

//   bool _initialRun = true;

//   @override
//   void initState() {
//     //HomeCubit.get(context).refreshController = RefreshController(initialRefresh: false);
//     // _adsProvider = Provider.of<AdsProvider>(context);

//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_initialRun) {
//       _adsProvider = Provider.of<AdsProvider>(context);
//       _adsProvider!.sliderRefreshController =
//           RefreshController(initialRefresh: true);
//       _adsProvider!.storeRefreshController =
//           RefreshController(initialRefresh: true);
//       //_adsProvider!.adsRefreshController= RefreshController(initialRefresh: true);
//       _initialRun = false;
//     }
//   }

//   @override
//   void dispose() {
//     _adsProvider!.storeRefreshController.dispose();
//     _adsProvider!.sliderRefreshController.dispose();
//     //_adsProvider!.adsRefreshController.dispose();

//     super.dispose();
//   }

//   // may be chnage to be scrollable
//   Widget simpleStoreAdvertisement(BuildContext context) {
//     return Container(
//       height: 100,
//       child: SmartRefresher(
//           controller: _adsProvider!.storeRefreshController,
//           enablePullUp: true,
//           onRefresh: () async {
//             final result =
//                 await _adsProvider!.getStoreIcons(context, isRefresh: true);
//             if (result) {
//               _adsProvider!.storeRefreshController.refreshCompleted();
//             } else {
//               _adsProvider!.storeRefreshController.refreshFailed();
//             }
//           },
//           onLoading: () async {
//             final result = await _adsProvider!.getStoreIcons(context);
//             if (result) {
//               _adsProvider!.storeRefreshController.loadComplete();
//             } else {
//               _adsProvider!.storeRefreshController.loadFailed();
//             }
//           },
//           child: Container(
//               height: 90,
//               width: 90,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: _adsProvider!.storeIcons.length,
//                   itemBuilder: (context, index) {
//                     final storeIcon = _adsProvider!.storeIcons[index];
//                     return CustomContainerFodAdevertissment(
//                       leftMagin: MediaQuery.of(context).size.width / 36, //10
//                       rightMagin: MediaQuery.of(context).size.width / 72, //5
//                       // color: mainAppColor,
//                       img: storeIcon.icon,
//                       // color: Colors.grey[200],
//                     );
//                   }))),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     themeProvider = Provider.of<ThemeProvider>(context);
//     _navigationProvider = Provider.of<NavigationProvider>(context);
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     return ListView(
//       children: [
//         Container(
//           height: height * 0.25,
//           child: SmartRefresher(
//               controller: _adsProvider!.sliderRefreshController,
//               enablePullUp: true,
//               onRefresh: () async {
//                 print("onrefreshing");
//                 final result = await _adsProvider!
//                     .getSliderImages(context, isRefresh: true);
//                 if (result) {
//                   _adsProvider!.sliderRefreshController.refreshCompleted();
//                 } else {
//                   _adsProvider!.sliderRefreshController.refreshFailed();
//                 }
//               },
//               onLoading: () async {
//                 print("onloading");
//                 final result = await _adsProvider!.getSliderImages(context);
//                 if (result) {
//                   _adsProvider!.sliderRefreshController.loadComplete();
//                 } else {
//                   _adsProvider!.sliderRefreshController.loadFailed();
//                 }
//               },
//               child: Container(
//                 //  height: height*0.3,
//                 child:
//                     CarouselWithIndicator(imgList: _adsProvider!.sliderImgList),
//               )),
//         ),

//         SizedBox(height: height * 0.01), //15
//         // store icons;
//         simpleStoreAdvertisement(context),

//         Container(
//           margin: EdgeInsets.only(
//             right: MediaQuery.of(context).size.width / 36, //10
//             left: MediaQuery.of(context).size.width / 24, //15
//             top: MediaQuery.of(context).size.height / 77.2, //10
//             bottom: MediaQuery.of(context).size.height / 77.2, //10
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               BigText(
//                 text: AppLocalizations.of(context)!.translate('all_ads'),
//                 typeOfFontWieght: 1,
//                 size: MediaQuery.of(context).size.height / 48.25, //16
//                 color: themeProvider!.isDarkMode ? whiteColor : blackColor,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   _navigationProvider!.setAllAdsTapping(true);

//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => AllAdsScreen()));
//                 },
//                 child: SmallText(
//                   text: AppLocalizations.of(context)!.translate('show_all'),
//                   color: themeProvider!.isDarkMode ? whiteColor : mainAppColor,
//                   size: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),

//         ///(عرض كل الاعلانات)
//         AllAdvertisementProduct(),

//         SizedBox(
//           height: 5,
//         ),
//       ],
//     );
//   }
// }
