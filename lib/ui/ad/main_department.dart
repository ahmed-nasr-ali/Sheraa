// // ignore_for_file: unused_field

// import 'package:flutter/material.dart';
// import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
// import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
// import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/ui/ad/widgets/main_department_body.dart';

// class MainDepartment extends StatefulWidget {
//   final bool chooseDepartmentFilter;
//   const MainDepartment({Key? key, required this.chooseDepartmentFilter})
//       : super(key: key);

//   @override
//   _MainDepartmentState createState() => _MainDepartmentState();
// }

// class _MainDepartmentState extends State<MainDepartment> {
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
//             title: widget.chooseDepartmentFilter
//                 ? AppLocalizations.of(context)!.translate('departments')
//                 : AppLocalizations.of(context)!.translate('main_department'),
//             hasBackBtn: true,
//             backButtonAction: () => Navigator.pop(context)),
//         body: MainDepartmentBody(
//           chooseDepartmentForFilter: widget.chooseDepartmentFilter,
//         ),
//       ),
//     ));
//   }
// }
