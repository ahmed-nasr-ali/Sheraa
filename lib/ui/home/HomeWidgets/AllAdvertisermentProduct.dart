// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/models/ad.dart';
// import 'package:sheraa/providers/ads_provider.dart';
// import 'package:sheraa/providers/theme_provider.dart';
// import 'package:sheraa/ui/specific%20ad%20screen/specific%20ad%20screen/specific_ad_screen.dart';

// class AllAdvertisementProduct extends StatefulWidget {
//   const AllAdvertisementProduct({Key? key}) : super(key: key);

//   @override
//   State<AllAdvertisementProduct> createState() =>
//       _AllAdvertisementProductState();
// }

// class _AllAdvertisementProductState extends State<AllAdvertisementProduct> {
//   bool _initialRun = true;
//   late AdsProvider adsProvider;
//   @override
//   void initState() {
//     // _adsProvider = Provider.of<AdsProvider>(context);

//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_initialRun) {
//       adsProvider = Provider.of<AdsProvider>(context);
//       adsProvider.adsRefreshController =
//           RefreshController(initialRefresh: true);
//       _initialRun = false;
//     }
//   }

//   @override
//   void dispose() {
//     adsProvider.adsRefreshController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Container(
//         height: height * 0.9,
//         child: SmartRefresher(
//             controller: adsProvider.adsRefreshController,
//             enablePullUp: true,
//             onRefresh: () async {
//               final result =
//                   await adsProvider.getAllAds(context, isRefresh: true);
//               if (result) {
//                 adsProvider.adsRefreshController.refreshCompleted();
//               } else {
//                 adsProvider.adsRefreshController.refreshFailed();
//               }
//             },
//             onLoading: () async {
//               final result = await adsProvider.getAllAds(context);
//               if (result) {
//                 adsProvider.adsRefreshController.loadComplete();
//               } else {
//                 adsProvider.adsRefreshController.loadFailed();
//               }
//             },
//             child: Container(
//               padding: EdgeInsets.only(
//                   right: MediaQuery.of(context).size.width / 72), //5
//               width: double.maxFinite,
//               height: MediaQuery.of(context).size.height / 4.54, //170
//               //  color: Colors.red,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   reverse: true,
//                   itemCount: adsProvider.adsList.length,
//                   itemBuilder: (context, index) {
//                     return buildCard(
//                         index, context, adsProvider.adsList[index]);
//                   }),
//             )));
//   }
// }

// Widget buildCard(int index, BuildContext context, Ad ad) {
//   final themeProvider = Provider.of<ThemeProvider>(context);
//   return Container(
//     width: MediaQuery.of(context).size.width / 2.769,
//     height: 100, //130
//     margin: EdgeInsets.only(
//         left: MediaQuery.of(context).size.width / 72,
//         right: MediaQuery.of(context).size.width / 72), //5,5
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(
//           MediaQuery.of(context).size.height / 30.88), //25
//       border: Border.all(
//           color:
//               themeProvider.isDarkMode ? Colors.grey[850]! : Color(0xFFEBEBEB)),
//       color: Colors.white,
//     ),
//     child: GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => SpecificAdScreenDetails(
//               pageName: "notmoreInformation", //moreInformation (second case)
//               isMyAd: false,
//               adDetails: ad,
//             ),
//           ),
//         );
//       },
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Positioned(
//                 child: Container(
//                   width: double.maxFinite,

//                   height: MediaQuery.of(context).size.height / 7, //130
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(
//                             MediaQuery.of(context).size.height / 30.88), //25
//                         topLeft: Radius.circular(
//                             MediaQuery.of(context).size.height / 30.88)), //25
//                     //  color: Colors.red,
//                     image: ad.image!.length != 0
//                         ? DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(ad.image![0]))
//                         : DecorationImage(
//                             //fit: BoxFit.cover,
//                             image: AssetImage("assets/images/logo.png")),
//                   ),
//                 ),
//               ),
//               ad.type != "normal"
//                   ? Positioned(
//                       right: 0,
//                       top: MediaQuery.of(context).size.height / 38.6, //20
//                       child: Container(
//                         width: MediaQuery.of(context).size.width / 8, //45
//                         height: MediaQuery.of(context).size.height / 40,
//                         margin: EdgeInsets.symmetric(vertical: 1), //20
//                         decoration: BoxDecoration(
//                             color: Colors
//                                 .yellow[700], //todo color depend on data base
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(
//                                   MediaQuery.of(context).size.height / 77.2),
//                               bottomLeft: Radius.circular(
//                                   MediaQuery.of(context).size.height /
//                                       77.2), //10
//                             )),
//                         child: Center(
//                           child: SmallText(
//                             text: 'VIP',
//                             color: Colors.black54,
//                             size: 13,
//                             //  size: MediaQuery.of(context).size.height / 55.14, //14
//                           ),
//                         ),
//                       ),
//                     )
//                   : Container(),
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.only(
//                 top: MediaQuery.of(context).size.height / 154.4), //5
//             width: MediaQuery.of(context).size.width / 4.235, //85
//             height: MediaQuery.of(context).size.height / 30.6, //20
//             decoration: BoxDecoration(
//               color: Colors.grey[50],
//               borderRadius: BorderRadius.all(
//                 Radius.circular(MediaQuery.of(context).size.height / 77.2), //10
//               ),
//             ),
//             child: Center(
//                 child: SmallText(
//               text: ad.price.toString() +
//                   AppLocalizations.of(context)!.translate("rial"),
//               color: Color(0xFF392D78),
//               fontWeight: FontWeight.bold,
//             )),
//           ),
//         ],
//       ),
//     ),
//   );
// }
