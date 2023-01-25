// // ignore_for_file: unused_field, unused_element, unnecessary_statements, unused_local_variable, non_constant_identifier_names, unnecessary_brace_in_string_interps

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
// import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
// import 'package:sheraa/networking/api%20error/error%20403/403_error.dart';
// import 'package:sheraa/networking/api%20error/server%20error/server_error.dart';
// import 'package:sheraa/providers/add_ads_provider.dart';
// import 'package:sheraa/providers/ads_provider.dart';
// import 'package:sheraa/shared_preferences/add_adds.dart';
// import 'package:sheraa/shared_preferences/user_information_data.dart';
// import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/ui/ad/sub_department.dart';
// import 'package:sheraa/utils/app_colors.dart';
// import 'package:sheraa/utils/urls.dart';
// import 'package:http/http.dart' as http;

// class MainDepartmentBody extends StatefulWidget {
//   final bool chooseDepartmentForFilter;
//   const MainDepartmentBody({Key? key, required this.chooseDepartmentForFilter})
//       : super(key: key);

//   @override
//   _MainDepartmentBodyState createState() => _MainDepartmentBodyState();
// }

// class _MainDepartmentBodyState extends State<MainDepartmentBody> {
//   late FocusNode _searchFocusNode;
//   String searchContent = '';

//   final TextEditingController searchController = TextEditingController();

//   late ScrollController _searchController;
//   late ScrollController _controller;
//   int searchPage = 1;

//   bool _isSearchLoading = false;
//   List<dynamic> _allCategories = [];
//   List<dynamic> _searchedResult = [];

//   int _page = 1;
//   bool _isLoading = false;
//   bool _hasNextPage = true;
//   bool _isLoadMoreRunning = false;
//   bool _initialRun = true;
//   AdsProvider? _adsProvider;

//   void _getAllCategories() async {
//     final homeServerError =
//         Provider.of<HomeServerError>(context, listen: false);

//     final erro403 = Provider.of<Error403>(context, listen: false);

//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.get(
//         Uri.parse(
//           "${Urls.GET_ALL_CATEGORIES_URL}?parent=main&page=$_page",
//         ),
//         headers: <String, String>{
//           'Accept': 'application/json',
//           "Accept-Language": UserData.getUSerLang(),
//           'Content-Type': 'application/json',
//         });
//     if (response.statusCode == 200) {
//       setState(() {
//         Map<String, dynamic> map = json.decode(response.body);

//         _allCategories = map["data"];
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
//             "${Urls.GET_ALL_CATEGORIES_URL}$_page",
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
//             _allCategories.addAll(data);
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

//     _getAllCategories();

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
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_initialRun) {
//       _adsProvider = Provider.of<AdsProvider>(context);

//       _initialRun = false;
//     }
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
//         itemCount: searchController.text == ""
//             ? _allCategories.length
//             : _searchedResult.length,
//         separatorBuilder: (context, index) {
//           return Divider(
//             height: 0,
//             indent: _width / 20.83333333333333, //18
//             endIndent: _width / 20.83333333333333, //18
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
//         //           .setMainCategoryId(_allCategories[index]["id"] ?? 0)
//         //       : addAddsSharedPreferences
//         //           .setMainCategoryId(_searchedResult[index]["id"] ?? 0);

//         //   print(addAddsSharedPreferences.getMainCategoryId());

//         //   searchController.text == ""
//         //       ? addAddsSharedPreferences
//         //           .setMainCategoryName(_allCategories[index]["name"] ?? "")
//         //       : addAddsSharedPreferences
//         //           .setMainCategoryName(_searchedResult[index]["name"] ?? "");

//         //   print(addAddsSharedPreferences.getMainCategoryName());
//         // });
//         _adsProvider!.setDepartmentId(_allCategories[index]["id"]);
//         _adsProvider!.setDepartmentName(_allCategories[index]["name"]);

//         // addAddsSharedPreferences.setSubCategoryId(0);
//         // addAddsSharedPreferences.setSubCategoryName("");
//         // if (widget.chooseDepartmentForFilter) {
//         //   Navigator.pop(context);
//         //   Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //       builder: (context) => SubDepartment(
//         //         id: searchController.text == ""
//         //             ? _allCategories[index]["id"]
//         //             : _searchedResult[index]["id"],
//         //         chooseSubDepartmentFilter: widget.chooseDepartmentForFilter,
//         //       ),
//         //     ),
//         //   );
//         // } else
//         //   Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //       builder: (context) => SubDepartment(
//         //         id: searchController.text == ""
//         //             ? _allCategories[index]["id"]
//         //             : _searchedResult[index]["id"],
//         //         chooseSubDepartmentFilter: widget.chooseDepartmentForFilter,
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
//               //       ? _allCategories[index]["name"] ?? ""
//               //       : _searchedResult[index]["name"] ?? "",
//               //   size: _height / 58, //14
//               //   color: blackColor,
//               //   typeOfFontWieght: searchController.text == ""
//               //       ? addAddsSharedPreferences.getMainCategoryId() ==
//               //               _allCategories[index]["id"]
//               //           ? 1
//               //           : 0
//               //       : addAddsSharedPreferences.getMainCategoryId() ==
//               //               _searchedResult[index]["id"]
//               //           ? 1
//               //           : 0,
//               // ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     // searchController.text == ""
//                     //     ? addAddsSharedPreferences.getMainCategoryId() ==
//                     //             _allCategories[index]["id"]
//                     //         ? Image.asset(
//                     //             "assets/images/checkbox.png",
//                     //             color: mainAppColor,
//                     //           )
//                     //         : Image.asset("assets/images/check.png")
//                     //     : addAddsSharedPreferences.getMainCategoryId() ==
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

//     final response = await http.get(
//         Uri.parse(
//           "${Urls.GET_ALL_CATEGORIES_URL}${searchPage}&name=${value}",
//         ),
//         headers: <String, String>{
//           'Accept': 'application/json',
//           "Accept-Language": UserData.getUSerLang(),
//           'Content-Type': 'application/json',
//         });
//     print(response.body);
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
//             "${Urls.GET_ALL_CATEGORIES_URL}${searchPage}&name=${searchContent}",
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
//             print("come here11111111111111111111111111");
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
