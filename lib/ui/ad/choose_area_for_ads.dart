// // ignore_for_file: unused_field

// import 'package:flutter/material.dart';
// import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
// import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
// import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/shared_preferences/add_adds.dart';

// import 'widgets/choose_area_for_ads_body.dart';

// class ChooseAreaForAds extends StatefulWidget {
//  final bool chooseAreaFromFilter;
//   const ChooseAreaForAds({Key? key, required this.chooseAreaFromFilter}) : super(key: key);

//   @override
//   _ChooseAreaForAdsState createState() => _ChooseAreaForAdsState();
// }

// class _ChooseAreaForAdsState extends State<ChooseAreaForAds> {
//   @override
//   void initState() {
//     super.initState();

//     setState(() {
//       addAddsSharedPreferences.setAreaId(0);
//       addAddsSharedPreferences.setAdsName("");
//       addAddsSharedPreferences.setAdsDescribtion("");
//     });
//   }

//   double _width = 0, _height = 0;

//   @override
//   Widget build(BuildContext context) {
//     _width = MediaQuery.of(context).size.width;
//     _height = MediaQuery.of(context).size.height;
//     return NetworkIndicator(
//         child: PageContainer(
//       child: Scaffold(
//         appBar: CustomAppbar(
//           hasCenterLogo: false,
//           title: AppLocalizations.of(context)!.translate('choose_area'),
//           hasBackBtn: true,
//             backButtonAction:()=>Navigator.pop(context)
//         ),
//         body: ChooseAreaForAdsBody(chooseAreaFromFilter: widget.chooseAreaFromFilter,),
//       ),
//     ));
//   }
// }
