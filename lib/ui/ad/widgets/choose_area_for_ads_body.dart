// // ignore_for_file: unused_field, unused_element, unused_local_variable, unnecessary_statements, non_constant_identifier_names, unnecessary_brace_in_string_interps

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
// import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
// import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/networking/api%20error/error%20403/403_error.dart';
// import 'package:sheraa/networking/api%20error/server%20error/server_error.dart';
// import 'package:sheraa/providers/add_ads_provider.dart';
// import 'package:sheraa/providers/ads_provider.dart';
// import 'package:sheraa/shared_preferences/add_adds.dart';
// import 'package:sheraa/shared_preferences/user_information_data.dart';
// import 'package:sheraa/ui/ad/ads_informations.dart';
// import 'package:sheraa/utils/app_colors.dart';
// import 'package:sheraa/utils/urls.dart';
// import 'package:http/http.dart' as http;

// class ChooseAreaForAdsBody extends StatefulWidget {
//   final bool chooseAreaFromFilter;
//   const ChooseAreaForAdsBody({Key? key, required this.chooseAreaFromFilter})
//       : super(key: key);

//   @override
//   State<ChooseAreaForAdsBody> createState() => _ChooseAreaForAdsBodyState();
// }

// class _ChooseAreaForAdsBodyState extends State<ChooseAreaForAdsBody> {
//   late FocusNode _searchFocusNode;
//   String searchContent = '';

//   final TextEditingController searchController = TextEditingController();

//   late ScrollController _searchController;
//   late ScrollController _controller;
//   int searchPage = 1;

//   bool _isSearchLoading = false;
//   List<dynamic> _allArea = [];
//   List<dynamic> _searchedResult = [];

//   int _page = 1;
//   bool _isLoading = false;
//   bool _hasNextPage = true;
//   bool _isLoadMoreRunning = false;
//   bool _initialRun = true;
//   AdsProvider? _adsProvider;
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_initialRun) {
//       _adsProvider = Provider.of<AdsProvider>(context);

//       _initialRun = false;
//     }
//   }

//   void _getAllArea() async {
//     final homeServerError =
//         Provider.of<HomeServerError>(context, listen: false);

//     final erro403 = Provider.of<Error403>(context, listen: false);

//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.get(
//         Uri.parse(
//           "${Urls.GET_ALL_AREA_URL}$_page",
//         ),
//         headers: <String, String>{
//           'Accept': 'application/json',
//           "Accept-Language": UserData.getUSerLang(),
//           'Content-Type': 'application/json',
//         });

//     if (response.statusCode == 200) {
//       setState(() {
//         Map<String, dynamic> map = json.decode(response.body);

//         _allArea = map["data"];
//       });
//     } else if (response.statusCode == 422) {
//       Navigator.of(context).popUntil((route) => route.isFirst);

//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               backgroundColor: mainAppColor,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25)),
//               title: BigText(
//                 color: blackColor,
//                 text: AppLocalizations.of(context)!
//                     .translate("There is an internet connection error"),
//                 typeOfFontWieght: 1,
//               ),
//             );
//           });
//       setState(() {
//         _isLoading = false;
//       });
//     } else if (response.statusCode == 403) {
//       Navigator.of(context).popUntil((route) => route.isFirst);

//       print(response.statusCode);
//       setState(() {
//         erro403.error403(context, response.statusCode);
//         _isLoading = false;
//       });
//     } else {
//       print(response.statusCode);
//       print(response.body);
//       setState(() {
//         homeServerError.serverError(context, response.statusCode);
//         _isLoading = false;
//       });
//     }
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   void _loadMore() async {
//     final homeServerError =
//         Provider.of<HomeServerError>(context, listen: false);

//     final erro403 = Provider.of<Error403>(context, listen: false);

//     if (_hasNextPage == true &&
//         _isLoading == false &&
//         _isLoadMoreRunning == false &&
//         _controller.position.extentAfter < 50) {
//       setState(() {
//         _isLoadMoreRunning = true; // Display a progress indicator at the bottom
//       });
//       _page += 1; // Increase _page by 1

//       final response = await http.get(
//           Uri.parse(
//             "${Urls.GET_ALL_AREA_URL}$_page",
//           ),
//           headers: <String, String>{
//             'Accept': 'application/json',
//             "Accept-Language": UserData.getUSerLang(),
//             'Content-Type': 'application/json',
//           });

//       if (response.statusCode == 200) {
//         Map<String, dynamic> map = json.decode(response.body);
//         if (map.isNotEmpty) {
//           setState(() {
//             List<dynamic> data = map["data"];
//             _allArea.addAll(data);
//           });
//         } else {
//           setState(() {
//             _hasNextPage = false;
//             _isLoadMoreRunning = false;
//           });
//         }
//       } else if (response.statusCode == 422) {
//         Navigator.of(context).popUntil((route) => route.isFirst);

//         print("object422");
//         showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 backgroundColor: mainAppColor,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25)),
//                 title: BigText(
//                   color: blackColor,
//                   text: AppLocalizations.of(context)!
//                       .translate("There is an internet connection error"),
//                   typeOfFontWieght: 1,
//                 ),
//               );
//             });
//         setState(() {
//           _isLoadMoreRunning = false;
//         });
//       } else if (response.statusCode == 403) {
//         print("object403");
//         Navigator.of(context).popUntil((route) => route.isFirst);

//         print(response.statusCode);
//         setState(() {
//           erro403.error403(context, response.statusCode);
//           _isLoadMoreRunning = false;
//         });
//       } else {
//         print("666666666666666666666666666666666666666666666");
//         print(response.statusCode);
//         print(response.body);
//         setState(() {
//           homeServerError.serverError(context, response.statusCode);
//           _isLoadMoreRunning = false;
//         });
//       }
//       setState(() {
//         _isLoadMoreRunning = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();

//     _getAllArea();

//     _controller = ScrollController()..addListener(_loadMore);

//     _searchController = ScrollController()..addListener(_SearchMore);

//     _searchFocusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     super.dispose();

//     _controller.removeListener(_loadMore);

//     _searchController.removeListener(_SearchMore);

//     _searchFocusNode.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double _height = MediaQuery.of(context).size.height;
//     double _width = MediaQuery.of(context).size.width;

//     final _addAddsProvider = Provider.of<AddAdsProvider>(context);

//     return _isLoading
//         ? Center(
//             child: SpinKitFadingCircle(color: mainAppColor),
//           )
//         : GestureDetector(
//             onTap: () {
//               setState(() {
//                 _searchFocusNode.unfocus();
//               });
//             },
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: _height / 81.2, //10
//                 ),
//                 Divider(
//                   thickness: 1,
//                   height: 0,
//                   color: containerColor,
//                 ),
//                 SizedBox(height: _height / 54.13333333333333 //15
//                     ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: _width / 25 //15
//                       ),
//                   child: SearchingBar(context),
//                 ),
//                 SizedBox(
//                   height: _height / 162.4, //5
//                 ),
//                 _isSearchLoading
//                     ? Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 50),
//                         child: Center(
//                             child: SpinKitFadingCircle(color: mainAppColor)),
//                       )
//                     : Expanded(
//                         child: buildList(_width, _height, _addAddsProvider)),

//                 if (_isLoadMoreRunning == true)
//                   Padding(
//                     padding: EdgeInsets.only(top: 10, bottom: 25),
//                     child: Center(
//                       child: SpinKitFadingCircle(color: mainAppColor),
//                     ),
//                   ),

//                 // When nothing else to load
//                 if (_hasNextPage == false)
//                   Container(
//                     padding: const EdgeInsets.only(top: 30, bottom: 40),
//                     color: Colors.amber,
//                     child: const Center(
//                       child: Text('You have fetched all of the content'),
//                     ),
//                   ),
//               ],
//             ),
//           );
//   }

//   Widget buildList(
//       double _width, double _height, AddAdsProvider _addAddsProvider) {
//     return ListView.separated(
//         controller:
//             searchController.text == "" ? _controller : _searchController,
//         itemCount: searchController.text == ""
//             ? _allArea.length
//             : _searchedResult.length,
//         separatorBuilder: (context, index) {
//           return Divider(
//             height: 0,
//             indent: _width / 20.83333333333333, //18
//             endIndent: _width / 20.83333333333333, //18
//           );
//         },
//         itemBuilder: (context, index) {
//           return listViewBody(index, _width, _height, _addAddsProvider);
//         });
//   }

//   Widget listViewBody(int index, double _width, double _height,
//       AddAdsProvider _addAddsProvider) {
//     return InkWell(
//       onTap: () {
//         // setState(() {
//           _searchFocusNode.unfocus();
//           // searchController.text == ""
//           //     ? addAddsSharedPreferences.setAreaId(_allArea[index]["id"] ?? 0)
//           //     : addAddsSharedPreferences
//           //         .setAreaId(_searchedResult[index]["id"] ?? 0);

//           // print(addAddsSharedPreferences.getAreaId());

//         //   _addAddsProvider.addAdsOpptionName(
//         //     {
//         //       "Feature_Name": AppLocalizations.of(context)!.translate("Area"),
//         //       "Selected_Name": searchController.text == ""
//         //           ? _allArea[index]["text"]
//         //           : _searchedResult[index]["text"]
//         //     },
//         //     AppLocalizations.of(context)!.translate("Area"),
//         //   );
//         //   print("show opption name");
//         //   print(_addAddsProvider.opttinName);
//         // });
//         // _adsProvider!.setAreaId(_allArea[index]["id"]);
//         // _adsProvider!.setAreaName(_allArea[index]["text"]);

//         if (widget.chooseAreaFromFilter) {
//           Navigator.pop(context);
//         } else
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => AdsInformations()));
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: _height / 62.46153846153846, //13
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: _width / 20.83333333333333, //18
//               ),
//               SmallText(
//                 text: searchController.text == ""
//                     ? _allArea[index]["text"] ?? ""
//                     : _searchedResult[index]["text"] ?? "",
//                 size: _height / 58, //14
//                 color: blackColor,
//                 typeOfFontWieght: searchController.text == ""
//                     ? addAddsSharedPreferences.getAreaId() ==
//                             _allArea[index]["id"]
//                         ? 1
//                         : 0
//                     : addAddsSharedPreferences.getAreaId() ==
//                             _searchedResult[index]["id"]
//                         ? 1
//                         : 0,
//               ),
//               Visibility(
//                 visible: searchController.text == ""
//                     ? addAddsSharedPreferences.getAreaId() ==
//                             _allArea[index]["id"]
//                         ? true
//                         : false
//                     : addAddsSharedPreferences.getAreaId() ==
//                             _searchedResult[index]["id"]
//                         ? true
//                         : false,
//                 child: Expanded(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Image.asset(
//                         "assets/images/checkbox.png",
//                         color: mainAppColor,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: _width / 20.83333333333333, //18
//               )
//             ],
//           ),
//           SizedBox(
//             height: _height / 62.46153846153846, //13
//           ),
//         ],
//       ),
//     );
//   }

//   Widget SearchingBar(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: secondryMainColor,
//         borderRadius: BorderRadius.circular(
//             MediaQuery.of(context).size.height / 81.2), //15
//       ),
//       child: Row(
//         children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width / 37.5, //10
//           ),
//           Expanded(
//             child: TextField(
//               focusNode: _searchFocusNode,
//               textAlign: TextAlign.start,
//               controller: searchController,
//               cursorColor: blackColor,
//               style: TextStyle(color: blackColor),
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: MediaQuery.of(context).size.width / 37.5,
//                 ),
//                 enabledBorder: InputBorder.none,
//                 disabledBorder: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 hintText: AppLocalizations.of(context)!
//                     .translate("searching_in_area"),
//                 hintStyle: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height / 64.33, //12
//                   fontWeight: FontWeight.normal,
//                   color: Color(0xFFBFBFBF),
//                 ),
//               ),
//               onChanged: (value) {
//                 if (value.isEmpty) {
//                   searchController.clear();
//                   searchPage = 1;
//                   setState(() {
//                     print('555555555555555555');
//                     print(searchController.text);
//                   });
//                 } else if (value.isNotEmpty) {
//                   setState(() {
//                     print("99999999999999999999999999999");
//                     searchContent = value;
//                     searchPage = 1;
//                     print(searchContent);
//                     print(searchPage);
//                     searchUserApicall(value);
//                   });
//                 }
//               },
//               onTap: () {
//                 setState(() {
//                   _searchFocusNode.hasFocus == true;
//                 });
//               },
//             ),
//           ),
//           Image.asset(
//             "assets/images/search.png",
//             color: Color(0xFFBFBFBF),
//           ),
//           SizedBox(width: MediaQuery.of(context).size.width / 25 //15
//               ),
//         ],
//       ),
//     );
//   }

//   searchUserApicall(String value) async {
//     final homeServerError =
//         Provider.of<HomeServerError>(context, listen: false);

//     final erro403 = Provider.of<Error403>(context, listen: false);

//     setState(() {
//       _isSearchLoading = true;
//     });

//     final response = await http.get(
//         Uri.parse(
//           "${Urls.GET_ALL_AREA_URL}${searchPage}&name=${value}",
//         ),
//         headers: <String, String>{
//           'Accept': 'application/json',
//           "Accept-Language": UserData.getUSerLang(),
//           'Content-Type': 'application/json',
//         });
//     // print(response.body);
//     if (response.statusCode == 200) {
//       setState(() {
//         Map<String, dynamic> map = json.decode(response.body);

//         _searchedResult = map["data"];
//       });
//     } else if (response.statusCode == 422) {
//       Navigator.of(context).popUntil((route) => route.isFirst);

//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               backgroundColor: mainAppColor,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25)),
//               title: BigText(
//                 color: blackColor,
//                 text: AppLocalizations.of(context)!
//                     .translate("There is an internet connection error"),
//                 typeOfFontWieght: 1,
//               ),
//             );
//           });
//       setState(() {
//         _isSearchLoading = false;
//       });
//     } else if (response.statusCode == 403) {
//       Navigator.of(context).popUntil((route) => route.isFirst);

//       print(response.statusCode);
//       setState(() {
//         erro403.error403(context, response.statusCode);
//         _isSearchLoading = false;
//       });
//     } else {
//       print(response.statusCode);
//       print(response.body);
//       setState(() {
//         homeServerError.serverError(context, response.statusCode);
//         _isSearchLoading = false;
//       });
//     }
//     setState(() {
//       _isSearchLoading = false;
//     });
//   }

//   void _SearchMore() async {
//     final homeServerError =
//         Provider.of<HomeServerError>(context, listen: false);

//     final erro403 = Provider.of<Error403>(context, listen: false);

//     if (_hasNextPage == true &&
//         _isLoading == false &&
//         _isLoadMoreRunning == false &&
//         _searchController.position.extentAfter < 50) {
//       setState(() {
//         _isLoadMoreRunning = true; // Display a progress indicator at the bottom
//       });

//       searchPage += 1; // Increase _page by 1

//       final response = await http.get(
//           Uri.parse(
//             "${Urls.GET_ALL_AREA_URL}${searchPage}&name=${searchContent}",
//           ),
//           headers: <String, String>{
//             'Accept': 'application/json',
//             "Accept-Language": UserData.getUSerLang(),
//             'Content-Type': 'application/json',
//             "Authorization": "Bearer ${UserData.getUserApiToken()}"
//           });
//       if (response.statusCode == 200) {
//         Map<String, dynamic> map = json.decode(response.body);
//         if (map.isNotEmpty) {
//           setState(() {
//             List<dynamic> data = map["data"];
//             _searchedResult.addAll(data);
//             // print("come here11111111111111111111111111");
//           });
//         } else {
//           setState(() {
//             _hasNextPage = false;
//           });
//         }
//       } else if (response.statusCode == 422) {
//         Navigator.of(context).popUntil((route) => route.isFirst);

//         print("object422");
//         showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 backgroundColor: mainAppColor,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25)),
//                 title: BigText(
//                   color: blackColor,
//                   text: AppLocalizations.of(context)!
//                       .translate("There is an internet connection error"),
//                   typeOfFontWieght: 1,
//                 ),
//               );
//             });
//         setState(() {
//           _isLoadMoreRunning = false;
//         });
//       } else if (response.statusCode == 403) {
//         Navigator.of(context).popUntil((route) => route.isFirst);

//         print("object403");
//         print(response.statusCode);
//         setState(() {
//           erro403.error403(context, response.statusCode);
//           _isLoadMoreRunning = false;
//         });
//       } else {
//         print("666666666666666666666666666666666666666666666");
//         print(response.statusCode);
//         print(response.body);
//         setState(() {
//           homeServerError.serverError(context, response.statusCode);
//           _isLoadMoreRunning = false;
//         });
//       }
//       setState(() {
//         _isLoadMoreRunning = false;
//       });
//     }
//   }
// }
