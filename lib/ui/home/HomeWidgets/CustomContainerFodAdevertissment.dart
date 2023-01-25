// // ignore_for_file: prefer_const_constructors, must_be_immutable, file_names

// import 'package:flutter/material.dart';

// class CustomContainerFodAdevertissment extends StatelessWidget {
//   String img;
//   Color? color;
//   double leftMagin;
//   double rightMagin;

//   CustomContainerFodAdevertissment({
//     Key? key,
//     required this.leftMagin,
//     required this.rightMagin,
//     this.color,
//     required this.img,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.only(left: leftMagin, right: rightMagin),
//         height: MediaQuery.of(context).size.height / 7, //100
//         width: MediaQuery.of(context).size.width / 3.43,
//         // width: 100,
//         // height: 100,
//         //105
//         decoration: BoxDecoration(

//             borderRadius: BorderRadius.all(Radius.circular(15)),

//             color: color,

//             image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(img))));
//   }
// }
