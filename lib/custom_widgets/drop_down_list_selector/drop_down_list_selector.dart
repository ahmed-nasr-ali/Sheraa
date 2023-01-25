// import 'package:flutter/material.dart';
// import 'package:MotqenAcademy/utils/app_colors.dart';
// import 'package:matrix_client/utils/app_colors.dart';

// class DropDownListSelector extends StatefulWidget {
//   final List<dynamic> dropDownList;
//   final String hint;
//   final dynamic value;
//   final Function onChangeFunc;
//   final bool elementHasDefaultMargin;

//   const DropDownListSelector(
//       {Key? key,
//       this.dropDownList,
//       this.hint='',
//       this.value,
//       this.onChangeFunc,
//       this.elementHasDefaultMargin: true})
//       : super(key: key);
//   @override
//   _DropDownListSelectorState createState() => _DropDownListSelectorState();
// }

// class _DropDownListSelectorState extends State<DropDownListSelector> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//            height: 48,
//         padding: const EdgeInsets.all(8.0),
//         margin: widget.elementHasDefaultMargin
//             ? EdgeInsets.symmetric(
//                 horizontal: MediaQuery.of(context).size.width * 0.07)
//             : EdgeInsets.symmetric(horizontal: 0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           border: Border.all(color: hintColor),
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<dynamic>(
//             isExpanded: true,
//             hint: Text(
//               widget.hint,
//               style: TextStyle(
//                   color: mainAppColor,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   fontFamily: 'Tajawal'),
//             ),
//             focusColor: mainAppColor,
//             icon: Image.asset(
//               'assets/images/downgrey.png',
//               color: hintColor,
//             ),
//             style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//                 fontFamily: 'Tajawal'),
//             items: widget.dropDownList,
//             onChanged: widget.onChangeFunc,
//             value: widget.value,
//           ),
//         ));
//   }
// }
