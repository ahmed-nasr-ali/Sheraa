// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_adjacent_string_concatenation

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/providers/auth_provider.dart';
// import 'package:sheraa/providers/favorite%20ad/adding_ad_to_favorite_ad_list.dart';
// import 'package:sheraa/providers/theme_provider.dart';
// import 'package:sheraa/ui/home/HomeWidgets/ad_widget.dart';
// import '../../utils/app_colors.dart';
// import 'HomeWidgets/search_bar.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   ThemeProvider? themeProvider;
//   bool _initalRun = true;
//   AuthProvider? _authProvider;
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_initalRun) {
//       _authProvider = Provider.of<AuthProvider>(context);

//       _initalRun = false;
//     }

//     ///(api call من غير ما اعمل Ui عشان لو المستخدم ضاف  الاعلان لي اعلاناته المفضله احدث)
//     ///(بستخدم الجزء دا في اي مكان بيظهر في الاعلانات زي)
//     ///Home page , My ads , favorite Ad
//     final _favoriteAdUpdateUiProvider =
//         Provider.of<FavoriteAdUpdateUiProvider>(context, listen: false);

//     _favoriteAdUpdateUiProvider.addingAdToFavoriteAdList.clear();
//   }

// // tab bar widget
//   Widget tabBar() {
//     return Container(
//       //  height: _height * 0.7,
//       height: MediaQuery.of(context).size.height,
//       child: Stack(
//         children: <Widget>[
//           Container(
//             margin:
//                 EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
//             child: TabBarView(
//               children: [
//                 HomeAds(),
//                 Container()

//                 //  AllAdvertisementProduct(),

//                 //  HomeAds()
//                 // adWidget()
//               ],
//             ),
//           ),
//           TabBar(
//               indicatorColor: mainAppColor,
//               labelColor: mainAppColor,
//               unselectedLabelColor: textGrayColor,
//               tabs: [
//                 Tab(
//                   text: AppLocalizations.of(context)!.translate('ads'),
//                 ),
//                 Tab(
//                   text: AppLocalizations.of(context)!.translate('stores'),
//                 ),
//               ]),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     themeProvider = Provider.of<ThemeProvider>(context);
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         body: ListView(
//           padding: EdgeInsets.only(top: 0.1),
//           children: [
//             Column(
//               children: [
//                 SizedBox(
//                     height: MediaQuery.of(context).size.height / 19.3), //40

//                 //this for Searched Bar
//                 SearchBar(
//                     hint: AppLocalizations.of(context)!
//                         .translate("search_for_ads_to_buy"),
//                     prefixwidget: Image.asset('assets/images/search.png'), //30
//                     suffixwidget: Container(
//                       // height: 10,
//                       // width: 10,
//                       margin: EdgeInsets.symmetric(horizontal: 10),
//                       child: CircleAvatar(
//                         radius: 5,
//                         // minRadius: 5,
//                         // maxRadius: 5,
//                         backgroundImage:
//                             NetworkImage(_authProvider!.currentCountry.image),
//                       ),
//                     )
//                     // Image.network(
//                     //  // 'assets/images/saudi-arabia.png',
//                     //   _authProvider!.currentCountry.image
//                     //   //   scale: MediaQuery.of(context).size.height / 38.6, //20
//                     // )
//                     ),
//                 // this for Text Bar (الاعلانات و المتاجر)
//                 // TabBarWidget(context, themeProvider),
//                 tabBar(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
