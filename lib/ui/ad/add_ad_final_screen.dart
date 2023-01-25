// // ignore_for_file: unused_field

// import 'package:flutter/material.dart';
// import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
// import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
// import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/ui/ad/widgets/adding_ads_final_screen_body.dart';

// class AddingAdsFinalScreen extends StatefulWidget {
//   const AddingAdsFinalScreen({Key? key}) : super(key: key);

//   @override
//   _AddingAdsFinalScreenState createState() => _AddingAdsFinalScreenState();
// }

// class _AddingAdsFinalScreenState extends State<AddingAdsFinalScreen> {
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
//             title: AppLocalizations.of(context)!.translate('ads_informations'),
//             hasBackBtn: true,
//             backButtonAction: () => Navigator.pop(context)),
//         body: AddingAdsFinalScreenBody(),
//       ),
//     ));
//   }
// }
