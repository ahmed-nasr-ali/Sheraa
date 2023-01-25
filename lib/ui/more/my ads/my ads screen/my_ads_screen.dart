// // ignore_for_file: unused_local_variable, unused_field

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
// import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
// import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
// import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/providers/active%20and%20unactive%20ad%20provider/active_ad_provider.dart';
// import 'package:sheraa/providers/active%20and%20unactive%20ad%20provider/inactive_ad_provider.dart';
// import 'package:sheraa/providers/favorite%20ad/adding_ad_to_favorite_ad_list.dart';
// import 'package:sheraa/ui/more/my%20ads/effective%20ads%20screen/effective_ads_screen.dart';
// import 'package:sheraa/ui/more/my%20ads/ineffective%20ads%20screen/ineffective_ads_screen.dart';
// import 'package:sheraa/utils/app_colors.dart';

// class MyAdsScreen extends StatefulWidget {
//   const MyAdsScreen({Key? key}) : super(key: key);

//   @override
//   State<MyAdsScreen> createState() => _MyAdsScreenState();
// }

// class _MyAdsScreenState extends State<MyAdsScreen> {
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     Provider.of<ActiveAdProvider>(context, listen: false)
//         .getActiveAdList(context);

//     Provider.of<UnActiveAdProvider>(context, listen: false)
//         .getUnActiveAdList(context);

//     Provider.of<ActiveAdProvider>(context, listen: false)
//         .getRemainingAd(context);

//     final _favoriteAdUpdateUiProvider =
//         Provider.of<FavoriteAdUpdateUiProvider>(context, listen: false);

//     _favoriteAdUpdateUiProvider.addingAdToFavoriteAdList.clear();

//     _favoriteAdUpdateUiProvider.deleteingAdfromFavoriteAdList.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double _height = MediaQuery.of(context).size.height;
//     double _width = MediaQuery.of(context).size.width;

//     return NetworkIndicator(
//       child: PageContainer(
//         child: DefaultTabController(
//           length: 2,
//           child: Scaffold(
//             body: NestedScrollView(
//               headerSliverBuilder: (context, innerBoxIsScrolled) => [
//                 SliverOverlapAbsorber(
//                   handle:
//                       NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//                   sliver: SliverAppBar(
//                     pinned: true,
//                     floating: true,
//                     snap: true,
//                     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//                     elevation: 0,
//                     centerTitle: true,
//                     leading: IconButton(
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: Image.asset(
//                             "assets/images/arrow_simple_chock.png")),
//                     title: SmallText(
//                         color: blackColor,
//                         size: _height / 50.75, //16
//                         typeOfFontWieght: 1,
//                         text:
//                             AppLocalizations.of(context)!.translate("my_ads")),
//                     bottom: TabBar(
//                         indicatorWeight: 3,
//                         indicatorColor: mainAppColor,
//                         indicatorPadding:
//                             EdgeInsets.symmetric(horizontal: _width / 12.5),
//                         labelColor: mainAppColor,
//                         unselectedLabelColor: textGrayColor,
//                         labelStyle: TextStyle(
//                           fontFamily: 'RB',
//                           fontWeight: FontWeight.bold,
//                           fontSize: _height / 58, //14
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         unselectedLabelStyle: TextStyle(
//                           fontFamily: 'RB',
//                           fontWeight: FontWeight.normal,
//                           fontSize: _height / 58, //14
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         tabs: [
//                           Tab(
//                             text: AppLocalizations.of(context)!
//                                 .translate("Effective Ads"),
//                           ),
//                           Tab(
//                             text: AppLocalizations.of(context)!
//                                 .translate("Ineffective Ads"),
//                           )
//                         ]),
//                   ),
//                 ),
//               ],
//               body: TabBarView(
//                 children: [
//                   buildActiveAd(),
//                   buildUnActiveAd(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildActiveAd() {
//     return Consumer<ActiveAdProvider>(builder: (context, value, child) {
//       print("refresh Active Ad");
//       print(value.isLoading);
//       return value.isLoading || value.isremainingLoading
//           ? SpinKitFadingCircle(color: mainAppColor)
//           : EffectiveAdsScreen(
//               remainingAdSpecial: value.RemainAd.mySpecialAdsRemain ?? 999,
//               remaingAdVip: value.RemainAd.myVipAdsRemain ?? 999,
//               activeAd: value.activeAdList.isEmpty ? [] : value.activeAdList,
//             );
//     });
//   }

//   Widget buildUnActiveAd() {
//     return Consumer<UnActiveAdProvider>(builder: (context, value, child) {
//       print("refresh unActive Ad");
//       print(value.isLoading);
//       return value.isLoading
//           ? SpinKitFadingCircle(color: mainAppColor)
//           : IneffectiveAdsScreen(
//               inActiveAd:
//                   value.unActiveAdList.isEmpty ? [] : value.unActiveAdList,
//             );
//     });
//   }
// }
