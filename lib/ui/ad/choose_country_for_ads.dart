// // ignore_for_file: unused_field

// import 'package:flutter/material.dart';
// import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
// import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
// import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/shared_preferences/add_adds.dart';

// import 'widgets/choose_country_for_ads_body.dart';

// class ChooseCountryForAds extends StatefulWidget {
//   final bool fromFilter;
//   const ChooseCountryForAds({Key? key, required this.fromFilter})
//       : super(key: key);

//   @override
//   _ChooseCountryForAdsState createState() => _ChooseCountryForAdsState();
// }

// class _ChooseCountryForAdsState extends State<ChooseCountryForAds> {
//   @override
//   void initState() {
//     super.initState();

//     setState(() {
//       addAddsSharedPreferences.setCountryId(0);
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
//             hasCenterLogo: false,
//             title: widget.fromFilter
//                 ? AppLocalizations.of(context)!.translate('city')
//                 : AppLocalizations.of(context)!.translate('choose_city'),
//             hasBackBtn: true,
//             backButtonAction: () => Navigator.pop(context)),
//         body: ChooseCountryForAdsBody(
//           ChooseCityFromFilter: widget.fromFilter,
//         ),
//       ),
//     ));
//   }
// }
