// // ignore_for_file: must_be_immutable, unused_field, unused_element, unused_local_variable, unnecessary_statements, non_constant_identifier_names

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
// import 'package:sheraa/shared_preferences/user_information_data.dart';
// import 'package:sheraa/utils/app_colors.dart';
// import 'package:sheraa/utils/urls.dart';
// import 'package:http/http.dart' as http;

// class CatergoryOpptionBody extends StatefulWidget {
//   int id;
//   String featureName;
//   String selection_type;

//   CatergoryOpptionBody({
//     Key? key,
//     required this.id,
//     required this.featureName,
//     required this.selection_type,
//   }) : super(key: key);

//   @override
//   State<CatergoryOpptionBody> createState() => _CatergoryOpptionBodyState();
// }

// class _CatergoryOpptionBodyState extends State<CatergoryOpptionBody> {
//   List itemSelect = [];

//   late ScrollController _controller;

//   bool _isSearchLoading = false;
//   List<dynamic> _allCategoryOpption = [];

//   int _page = 1;
//   bool _isLoading = false;
//   bool _hasNextPage = true;
//   bool _isLoadMoreRunning = false;

//   void _getAllCategoryOpption() async {
//     final homeServerError =
//         Provider.of<HomeServerError>(context, listen: false);

//     final erro403 = Provider.of<Error403>(context, listen: false);

//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.get(
//         Uri.parse(
//           "${Urls.GET_ALL_CATEGORY_OPPTION_URL}${widget.id}&page=$_page",
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

//         _allCategoryOpption = map["data"];
//         // print(_allCategoryOpption);
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
//             "${Urls.GET_ALL_CATEGORY_OPPTION_URL}${widget.id}&page=$_page",
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
//             _allCategoryOpption.addAll(data);
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

//     // print(widget.id);

//     _getAllCategoryOpption();

//     _controller = ScrollController()..addListener(_loadMore);

//     ///=================================================================
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       var _addAdsProviderForShowing =
//           Provider.of<AddAdsProvider>(context, listen: false);
//       widget.selection_type == "single"
//           ? _addAdsProviderForShowing.opptionIDForShowing.forEach((item) {
//               if (item.containsKey(widget.featureName)) {
//                 itemSelect.add(item[widget.featureName]);
//               }
//             })
//           : itemSelect = _addAdsProviderForShowing.categoryID;
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();

//     _controller.removeListener(_loadMore);
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
//         : Column(
//             children: [
//               SizedBox(
//                 height: _height / 81.2, //10
//               ),
//               Divider(
//                 thickness: 1,
//                 height: 0,
//                 color: containerColor,
//               ),
//               _isSearchLoading
//                   ? Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 50),
//                       child: Center(
//                           child: SpinKitFadingCircle(color: mainAppColor)),
//                     )
//                   : Expanded(
//                       child: buildList(_width, _height, _addAddsProvider)),

//               if (_isLoadMoreRunning == true)
//                 Padding(
//                   padding: EdgeInsets.only(top: 10, bottom: 25),
//                   child: Center(
//                     child: SpinKitFadingCircle(color: mainAppColor),
//                   ),
//                 ),

//               // When nothing else to load
//               if (_hasNextPage == false)
//                 Container(
//                   padding: const EdgeInsets.only(top: 30, bottom: 40),
//                   color: Colors.amber,
//                   child: const Center(
//                     child: Text('You have fetched all of the content'),
//                   ),
//                 ),
//             ],
//           );
//   }

//   Widget buildList(
//       double _width, double _height, AddAdsProvider _addAddsProvider) {
//     return ListView.separated(
//         itemCount: _allCategoryOpption.length,
//         separatorBuilder: (context, index) {
//           return Divider(
//             height: 0,
//             indent: _width / 20.83333333333333, //18
//             endIndent: _width / 20.83333333333333, //18
//           );
//         },
//         controller: _controller,
//         itemBuilder: (context, index) {
//           return listViewBody(index, _width, _height, _addAddsProvider);
//         });
//   }

//   Widget listViewBody(int index, double _width, double _height,
//       AddAdsProvider _addAddsProvider) {
//     return InkWell(
//       onTap: () {
//         if (widget.selection_type == "single") {
//           _addAddsProvider.addAdsOpptionName(
//             {
//               "Feature_Name": widget.featureName,
//               "Selected_Name": _allCategoryOpption[index]["text"]
//             },
//             widget.featureName,
//           );
//           print("show opption name");
//           print(_addAddsProvider.opttinName);
//           print("===============================================");

//           ///==================================================================

//           _addAddsProvider.addOpptionId(
//             {
//               "id": _allCategoryOpption[index]["id"],
//               "Name": widget.featureName,
//             },
//             widget.featureName,
//           );

//           // print("show opption id");
//           // print(_addAddsProvider.opptionID);
//           // print("===============================================");

//           ///==================================================================

//           _addAddsProvider.addOpptionIDForShow(
//             {
//               widget.featureName: _allCategoryOpption[index]["id"],
//             },
//             widget.featureName,
//           );

//           setState(() {
//             _addAddsProvider.opptionIDForShowing.forEach((item) {
//               if (item.containsKey(widget.featureName)) {
//                 itemSelect.add(item[widget.featureName]);
//               }
//             });
//           });

//           Navigator.pop(context);
//         } else {
//           setState(() {
//             _addAddsProvider.addCategoryId(_allCategoryOpption[index]["id"]);
//             _addAddsProvider
//                 .addCategoryName(_allCategoryOpption[index]["text"]);

//             if (_addAddsProvider.categoryID.isNotEmpty &&
//                 _addAddsProvider.categoryName.isNotEmpty) {
//               _addAddsProvider.addAdsOpptionName({
//                 "Feature_Name": widget.featureName,
//                 "Selected_Name":
//                     _addAddsProvider.categoryName.join(",").toString()
//               }, widget.featureName);

//               // print("list is name" + "${_addAddsProvider.opttinName}");

//               ///==================================================================
//               itemSelect = _addAddsProvider.categoryID;
//               print(itemSelect);
//             } else {
//               int x = _addAddsProvider.opttinName.indexWhere(
//                   (element) => element["Feature_Name"] == widget.featureName);
//               _addAddsProvider.opttinName.removeAt(x);
//               print(_addAddsProvider.opttinName);
//             }
//           });
//         }
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: _height / 54.13333333333333, //12
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: _width / 25, //15
//               ),
//               _allCategoryOpption[index]["image"] != null
//                   ? CircleAvatar(
//                       radius: 15,
//                       backgroundImage:
//                           NetworkImage(_allCategoryOpption[index]["image"]),
//                     )
//                   : Container(),
//               _allCategoryOpption[index]["iamge"] == null
//                   ? SizedBox(
//                       width: _width / 37.5,
//                     )
//                   : Container(),
//               SmallText(
//                 text: _allCategoryOpption[index]["text"] ?? "",
//                 color: blackColor,
//                 size: _height / 58, //14
//                 typeOfFontWieght:
//                     itemSelect.contains(_allCategoryOpption[index]["id"])
//                         ? 1
//                         : 0,
//               ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     itemSelect.contains(_allCategoryOpption[index]["id"])
//                         ? Image.asset(
//                             "assets/images/checkbox.png",
//                             color: mainAppColor,
//                           )
//                         : Image.asset("assets/images/check.png"),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: _width / 18.75,
//               ),
//             ],
//           ),
//           SizedBox(
//             height: _height / 54.13333333333333, //12
//           ),
//         ],
//       ),
//     );
//   }
// }
