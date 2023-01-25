// // ignore_for_file: must_be_immutable, unused_field, unused_element, unused_local_variable, unnecessary_statements, non_constant_identifier_names, unnecessary_brace_in_string_interps, unrelated_type_equality_checks

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
// import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
// import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/networking/api%20error/error%20403/403_error.dart';
// import 'package:http/http.dart' as http;
// import 'package:sheraa/networking/api%20error/server%20error/server_error.dart';
// import 'package:sheraa/providers/add_ads_provider.dart';
// import 'package:sheraa/providers/ads_provider.dart';
// import 'package:sheraa/shared_preferences/add_adds.dart';
// import 'package:sheraa/shared_preferences/user_information_data.dart';
// import 'package:sheraa/ui/ad/other_details.dart';
// import 'package:sheraa/utils/app_colors.dart';
// import 'package:sheraa/utils/urls.dart';

// class SubDepartmentBody extends StatefulWidget {
//   final bool chooseSubDepartmentFilter;

//   int id;
//   SubDepartmentBody({
//     Key? key,
//     required this.id,
//     required this.chooseSubDepartmentFilter,
//   }) : super(key: key);

//   @override
//   _SubDepartmentBodyState createState() => _SubDepartmentBodyState();
// }

// class _SubDepartmentBodyState extends State<SubDepartmentBody> {
//   late FocusNode _searchFocusNode;
//   String searchContent = '';

//   final TextEditingController searchController = TextEditingController();

//   late ScrollController _searchController;
//   late ScrollController _controller;
//   int searchPage = 1;

//   bool _isSearchLoading = false;
//   List<dynamic> _allSubCategories = [];
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

//   void _getAllSubCategories() async {
//     final homeServerError =
//         Provider.of<HomeServerError>(context, listen: false);

//     final erro403 = Provider.of<Error403>(context, listen: false);

//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.get(
//         Uri.parse(
//           "${Urls.GET_ALL_SUB_CATEGORIES_URL}${widget.id}&page=$_page",
//         ),
//         headers: <String, String>{
//           'Accept': 'application/json',
//           "Accept-Language": UserData.getUSerLang(),
//           'Content-Type': 'application/json',
//           // "Authorization": "Bearer ${UserData.getUserApiToken()}"
//         });
//     if (response.statusCode == 200) {
//       // print("come here");
//       setState(() {
//         Map<String, dynamic> map = json.decode(response.body);

//         _allSubCategories = map["data"];
//         // print(_allSubCategories);
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
//             "${Urls.GET_ALL_SUB_CATEGORIES_URL}${widget.id}&page=$_page",
//           ),
//           headers: <String, String>{
//             'Accept': 'application/json',
//             "Accept-Language": UserData.getUSerLang(),
//             'Content-Type': 'application/json',
//             // "Authorization": "Bearer ${UserData.getUserApiToken()}"
//           });

//       if (response.statusCode == 200) {
//         Map<String, dynamic> map = json.decode(response.body);
//         if (map.isNotEmpty) {
//           setState(() {
//             List<dynamic> data = map["data"];
//             _allSubCategories.addAll(data);
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

//     print("Main Catgory ID ${widget.id}");

//     _getAllSubCategories();

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
//             child: Center(
//               child: SpinKitFadingCircle(color: mainAppColor),
//             ),
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
//                         padding: EdgeInsets.symmetric(
//                             vertical: _height / 16.24), //50
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
//         itemCount: searchController.text == ""
//             ? _allSubCategories.length
//             : _searchedResult.length,
//         separatorBuilder: (context, index) {
//           return Divider(
//             height: 0,
//             indent: _width / 37.5, //10
//             endIndent: _width / 37.5, //10
//           );
//         },
//         controller:
//             searchController.text == "" ? _controller : _searchController,
//         itemBuilder: (context, index) {
//           return listViewBody(index, _width, _height, _addAddsProvider);
//         });
//   }

//   Widget listViewBody(int index, double _width, double _height,
//       AddAdsProvider _addAddsProvider) {
//     return InkWell(
//       onTap: () {
//         // setState(() {
//         //   _searchFocusNode.unfocus();
//         //   searchController.text == ""
//         //       ? addAddsSharedPreferences
//         //           .setSubCategoryId(_allSubCategories[index]["id"] ?? 0)
//         //       : addAddsSharedPreferences
//         //           .setSubCategoryId(_searchedResult[index]["id"] ?? 0);

//         //   print(addAddsSharedPreferences.getSubCategoryId());

//         //   searchController.text == ""
//         //       ? addAddsSharedPreferences
//         //           .setSubCategoryName(_allSubCategories[index]["name"] ?? "")
//         //       : addAddsSharedPreferences
//         //           .setSubCategoryName(_searchedResult[index]["name"] ?? "");

//         //   print(addAddsSharedPreferences.getSubCategoryName());

//         //   _addAddsProvider.opttinName.clear();
//         //   _addAddsProvider.opptionID.clear();
//         //   _addAddsProvider.opptionIDForShowing.clear();
//         //   _addAddsProvider.categoryID.clear();
//         //   _addAddsProvider.categoryName.clear();
//         // });
//         // _adsProvider!.setSubDepartmentId(_allSubCategories[index]["id"]);
//         // _adsProvider!.setDepartmentName(_allSubCategories[index]["name"]);
//         // if (widget.chooseSubDepartmentFilter == true) {
//         //   Navigator.pop(context);
//         // } else
//         //   Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //       builder: (context) => OtherDetails(
//         //         id: _allSubCategories[index]["id"],
//         //       ),
//         //     ),
//         //   );
//       },
//       child: Column(
//         children: [
//           SizedBox(
//             height: _height / 62.46153846153846, //13
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: _width / 21.4375, //16
//               ),
//               Image.asset("assets/images/car.png"), //todo image from Api
//               SizedBox(
//                 width: _width / 37.5, //10
//               ),
//               // SmallText(
//               //   text: searchController.text == ""
//               //       ? _allSubCategories[index]["name"] ?? ""
//               //       : _searchedResult[index]["name"] ?? "",
//               //   size: _height / 58, //14
//               //   color: blackColor,
//               //   typeOfFontWieght: searchController.text == ""
//               //       ? addAddsSharedPreferences.getSubCategoryId() ==
//               //               _allSubCategories[index]["id"]
//               //           ? 1
//               //           : 0
//               //       : addAddsSharedPreferences.getSubCategoryId() ==
//               //               _searchedResult[index]["id"]
//               //           ? 1
//               //           : 0,
//               // ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     // searchController.text == ""
//                     //     ? addAddsSharedPreferences.getSubCategoryId() ==
//                     //             _allSubCategories[index]["id"]
//                     //         ? Image.asset(
//                     //             "assets/images/checkbox.png",
//                     //             color: mainAppColor,
//                     //           )
//                     //         : Image.asset("assets/images/check.png")
//                     //     : addAddsSharedPreferences.getSubCategoryId() ==
//                     //             _searchedResult[index]["id"]
//                     //         ? Image.asset(
//                     //             "assets/images/checkbox.png",
//                     //             color: mainAppColor,
//                     //           )
//                     //         : Image.asset("assets/images/check.png")
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: _width / 18.75, //20
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
//                     .translate("searching in categories"),
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
//     print("${Urls.GET_ALL_SUB_CATEGORIES_URL}${widget.id}&name=${value}");
//     final response = await http.get(
//         Uri.parse(
//           "${Urls.GET_ALL_SUB_CATEGORIES_URL}${widget.id}&name=${searchContent}",
//         ),
//         headers: <String, String>{
//           'Accept': 'application/json',
//           "Accept-Language": UserData.getUSerLang(),
//           'Content-Type': 'application/json',
//           // "Authorization": "Bearer ${UserData.getUserApiToken()}"
//         });
//     if (response.statusCode == 200) {
//       setState(() {
//         Map<String, dynamic> map = json.decode(response.body);

//         _searchedResult = map["data"];
//         // print(response.body.toString());
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
//             "${Urls.GET_ALL_SUB_CATEGORIES_URL}${widget.id}&page=$searchPage&name=${searchContent}",
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
