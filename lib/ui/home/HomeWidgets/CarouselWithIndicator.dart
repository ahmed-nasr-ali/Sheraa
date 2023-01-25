// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sheraa/providers/theme_provider.dart';
// import 'package:sheraa/ui/new%20Home/domine/entity/slider_entity.dart';
// import 'dart:math' as math;

// import '../../../utils/app_colors.dart';

// //import 'package:sheraa/utils/app_colors.dart';

// List<T> map<T>(List list, Function handler) {
//   List<T> result = [];
//   for (var i = 0; i < list.length; i++) {
//     result.add(handler(i, list[i]));
//   }

//   return result;
// }

// class CarouselWithIndicator extends StatefulWidget {
//   final List<SliderEntity> imgList;

//   const CarouselWithIndicator({
//     required this.imgList,
//   });
//   @override
//   _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
// }

// class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
//   int _current = 0;
//   @override
//   Widget build(BuildContext context) {
//     // final _width = MediaQuery.of(context).size.width;
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return //Stack(children:[
//             Column(
//           children: [
//             SizedBox(height: MediaQuery.of(context).size.height / 77.2), //10

//             CarouselSlider(
//               options: CarouselOptions(
//                 height: MediaQuery.of(context).size.height / 5.1467, //150
//                 autoPlay: true,
//                 autoPlayInterval: Duration(seconds: 10),
//                 viewportFraction: 1,
//                 // aspectRatio: MediaQuery.of(context).size.aspectRatio * 5.5,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _current = index;
//                   });
//                 },
//                 scrollDirection: Axis.horizontal,
//               ),
//               items: map<Widget>(
//                 widget.imgList,
//                 (index, i) {
//                   return //Stack(children: [
//                       Container(
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(
//                       // borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       // color: const Color(0xff7c94b6),
//                       //color: Colors.cyanAccent,
//                       image: DecorationImage(
//                         image: NetworkImage(i.image),
//                         fit: BoxFit.cover,
//                         // colorFilter: new ColorFilter.mode(
//                         //     Colors.black.withOpacity(0.3),
//                         // BlendMode.dstATop),
//                       ),
//                     ),
//                     // margin: EdgeInsets.symmetric(horizontal: 10),
//                     // child: ClipRRect(
//                     //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     //   child: Image.network(
//                     //     i.image,
//                     //     width: width,
//                     //     fit: BoxFit.cover,
//                     //   ),
//                     // ),
//                     // child: Container(
//                     // padding: EdgeInsets.symmetric(vertical: 20),
//                     //child: Column(
//                     //mainAxisAlignment: MainAxisAlignment.center,
//                     //children: [
//                     //SizedBox(
//                     //height: 20,
//                     //),
//                     //Text(
//                     // i.name,
//                     //textAlign: TextAlign.center,
//                     //style: TextStyle(
//                     //  color: whiteColor,
//                     //fontWeight: FontWeight.bold,
//                     //fontSize: 15),
//                     //),
//                     // Container(
//                     //   width: width * 0.9,
//                     //   margin: EdgeInsets.symmetric(horizontal: 2),
//                     //   child: Text(
//                     //     i.content,
//                     //     // maxLines: 6,
//                     //     textAlign: TextAlign.center,
//                     //     style: TextStyle(
//                     //         color: whiteColor, fontSize: 11),
//                     //   ),
//                     // )
//                     //],
//                     //),

//                     // Positioned(
//                     //     top: 10,
//                     //     right: 10,
//                     //     left: 10,
//                     //     child: Container(
//                     //       child: Column(
//                     //         mainAxisAlignment: MainAxisAlignment.center,
//                     //         children: [
//                     //           Text(
//                     //             i.title,
//                     //             textAlign: TextAlign.center,
//                     //             style: TextStyle(
//                     //                 color: accentColor,
//                     //                 fontWeight: FontWeight.bold,
//                     //                 fontSize: 15),
//                     //           ),
//                     //           Container(
//                     //             width: width * 0.9,
//                     //             child: Text(
//                     //               i.content,
//                     //               // maxLines: 6,
//                     //               textAlign: TextAlign.center,
//                     //               style: TextStyle(color: accentColor),
//                     //             ),
//                     //           )
//                     //         ],
//                     //       ),
//                     //     ))
//                     //)
//                   );
//                 },
//               ).toList(),
//             ),
//             //   Positioned(
//             // bottom: -10,
//             //left: MediaQuery.of(context).size.width * 0.45,
//             //child:
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: map<Widget>(
//                 widget.imgList,
//                 (index, url) {
//                   return Container(
//                     width: MediaQuery.of(context).size.width / 12, //30
//                     height: MediaQuery.of(context).size.height / 154.4, //5
//                     margin: EdgeInsets.only(
//                       left: MediaQuery.of(context).size.width / 72, //5
//                       right: MediaQuery.of(context).size.width / 72, //5
//                       top: MediaQuery.of(context).size.height / 77.2,
//                     ), //5,5,10

//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                             MediaQuery.of(context).size.height / 154.4), //5
//                         shape: BoxShape.rectangle,
//                         color: -_current == -index
//                             ? themeProvider.isDarkMode
//                                 ? Colors.white
//                                 : mainAppColor
//                             : themeProvider.isDarkMode
//                                 ? Colors.grey[850]
//                                 : Color(0xFFEEEEEE)),
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
