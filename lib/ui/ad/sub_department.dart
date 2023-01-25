// // ignore_for_file: unused_field, must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
// import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
// import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/ui/ad/widgets/sub_department_body.dart';

// class SubDepartment extends StatefulWidget {
//   final bool chooseSubDepartmentFilter;
//   int id;
//   SubDepartment(
//       {Key? key, required this.id, required this.chooseSubDepartmentFilter})
//       : super(key: key);

//   @override
//   _SubDepartmentState createState() => _SubDepartmentState();
// }

// class _SubDepartmentState extends State<SubDepartment> {
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
//         title: AppLocalizations.of(context)!.translate('sub_department'),
//         hasBackBtn: true,
//           backButtonAction:()=>Navigator.pop(context)
//       ),
//       body: SubDepartmentBody(
//           chooseSubDepartmentFilter: widget.chooseSubDepartmentFilter,
//           id: widget.id),
//     )));
//   }
// }
