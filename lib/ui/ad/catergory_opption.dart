// // ignore_for_file: unused_field, must_be_immutable, non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
// import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
// import 'package:sheraa/custom_widgets/safe_area/page_container.dart';

// import 'widgets/catergory_opption_body.dart';

// class CatergoryOpption extends StatefulWidget {
//   int id;
//   String appBarTitle;
//   String selection_type;
//   CatergoryOpption({
//     Key? key,
//     required this.selection_type,
//     required this.id,
//     required this.appBarTitle,
//   }) : super(key: key);

//   @override
//   _CatergoryOpptionState createState() => _CatergoryOpptionState();
// }

// class _CatergoryOpptionState extends State<CatergoryOpption> {
//   @override
//   void initState() {
//     super.initState();

//     print(widget.selection_type);
//   }

//   double _width = 0, _height = 0;

//   @override
//   Widget build(BuildContext context) {
//     _width = MediaQuery.of(context).size.width;
//     _height = MediaQuery.of(context).size.height;
//     return NetworkIndicator(
//         child: PageContainer(
//             child: Scaffold(
//       appBar: CustomAppbar(
//         hasCenterLogo: false,
//         title: widget.appBarTitle,
//         hasBackBtn: true,
//           backButtonAction:()=>Navigator.pop(context)
//       ),
//       body: CatergoryOpptionBody(
//         id: widget.id,
//         featureName: widget.appBarTitle,
//         selection_type: widget.selection_type,
//       ),
//     )));
//   }
// }
