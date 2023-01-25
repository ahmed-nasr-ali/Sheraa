// // ignore_for_file: unused_field

// import 'package:flutter/material.dart';
// import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
// import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
// import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
// import 'package:sheraa/locale/app_localizations.dart';

// import 'widgets/ads_informations_second_page_body.dart';

// class AdsInformationsSecondPage extends StatefulWidget {
//   const AdsInformationsSecondPage({Key? key}) : super(key: key);

//   @override
//   _AdsInformationsSecondPageState createState() =>
//       _AdsInformationsSecondPageState();
// }

// class _AdsInformationsSecondPageState extends State<AdsInformationsSecondPage> {
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
//           title: AppLocalizations.of(context)!.translate('ads_informations'),
//           hasBackBtn: true,
//             backButtonAction:()=>Navigator.pop(context)
//         ),
//         body: AdsInformationsSecondPageBody(),
//       ),
//     ));
//   }
// }
