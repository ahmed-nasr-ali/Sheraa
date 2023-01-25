// // ignore_for_file: unused_field, must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
// import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
// import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/ui/ad/widgets/other_details_body.dart';

// class OtherDetails extends StatefulWidget {
//   int id;
//   OtherDetails({
//     Key? key,
//     required this.id,
//   }) : super(key: key);

//   @override
//   _OtherDetailsState createState() => _OtherDetailsState();
// }

// class _OtherDetailsState extends State<OtherDetails> {
//   double _width = 0, _height = 0;
//   @override
//   @override
//   Widget build(BuildContext context) {
//     _width = MediaQuery.of(context).size.width;
//     _height = MediaQuery.of(context).size.height;
//     return NetworkIndicator(
//         child: PageContainer(
//             child: Scaffold(
//       appBar: CustomAppbar(
//         hasCenterLogo: false,
//         title: AppLocalizations.of(context)!.translate('Other_Details'),
//         hasBackBtn: true,
//           backButtonAction:()=>Navigator.pop(context)
//       ),
//       body: OtherDetailsBody(id: widget.id),
//     )));
//   }
// }
