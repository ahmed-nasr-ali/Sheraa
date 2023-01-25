// // ignore_for_file: must_be_immutable, unused_field, unused_element, unused_local_variable, unnecessary_statements

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
// import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
// import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
// import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/networking/api%20error/error%20403/403_error.dart';
// import 'package:sheraa/networking/api%20error/server%20error/server_error.dart';
// import 'package:sheraa/providers/add%20ads/add_ads_provider.dart';
// import 'package:sheraa/providers/add_ads_provider.dart';
// import 'package:sheraa/shared_preferences/user_information_data.dart';
// import 'package:sheraa/ui/ad/catergory_opption.dart';
// import 'package:sheraa/ui/adding%20ad/presentation/pages/cities_screen/choose_citiy_screen.dart';
// import 'package:sheraa/utils/app_colors.dart';
// import 'package:sheraa/utils/urls.dart';
// import 'package:http/http.dart' as http;

// class OtherDetailsBody extends StatefulWidget {
//   int id;
//   OtherDetailsBody({Key? key, required this.id}) : super(key: key);

//   @override
//   State<OtherDetailsBody> createState() => _OtherDetailsBodyState();
// }

// class _OtherDetailsBodyState extends State<OtherDetailsBody> {
//   String _showMessage = "";
//   List _showMessageErro = [];
//   List _compare = [];

//   late ScrollController _controller;

//   bool _isSearchLoading = false;
//   List<dynamic> _allFeaterCategoryByID = [];

//   int _page = 1;
//   bool _isLoading = false;
//   bool _hasNextPage = true;
//   bool _isLoadMoreRunning = false;

//   void _getAllFeatureByCategoriesID() async {
//     final homeServerError =
//         Provider.of<HomeServerError>(context, listen: false);

//     final erro403 = Provider.of<Error403>(context, listen: false);

//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.get(
//         Uri.parse(
//           "${Urls.GET_ALL_FEATER_BY_CATEGORIES_ID_URL}${widget.id}&page=$_page",
//         ),
//         headers: <String, String>{
//           'Accept': 'application/json',
//           "Accept-Language": UserData.getUSerLang(),
//           'Content-Type': 'application/json',
//         });
//     if (response.statusCode == 200) {
//       setState(() {
//         Map<String, dynamic> map = json.decode(response.body);

//         _allFeaterCategoryByID = map["data"];
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
//             "${Urls.GET_ALL_FEATER_BY_CATEGORIES_ID_URL}${widget.id}&page=$_page",
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
//             _allFeaterCategoryByID.addAll(data);
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
//     print(widget.id);

//     _getAllFeatureByCategoriesID();

//     _controller = ScrollController()..addListener(_loadMore);
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
//                   : Expanded(child: buildList(_width, _height)),

//               Align(
//                   alignment: FractionalOffset.bottomCenter,
//                   child: CustomButton(
//                       btnLbl: 'التالي',
//                       onPressedFunction: () {
//                         _checkSelect(_addAddsProvider);

//                         if (_showMessage == "") {
//                           Provider.of<AddingAdsProvider>(context, listen: false)
//                               .clearListOfCities();
//                           Provider.of<AddingAdsProvider>(context, listen: false)
//                               .setHasMoreData(true);
//                           Provider.of<AddingAdsProvider>(context, listen: false)
//                               .setDonotFetchNewData(false);

//                           Provider.of<AddingAdsProvider>(context, listen: false)
//                               .setIsFetchingData(false);

//                           Provider.of<AddingAdsProvider>(context, listen: false)
//                               .setPage(2);
//                           Provider.of<AddingAdsProvider>(context, listen: false)
//                               .setIsLoading(true);

//                           Provider.of<AddingAdsProvider>(context, listen: false)
//                               .clearSearchingListOfCities();

//                           Provider.of<AddingAdsProvider>(context, listen: false)
//                               .clearController();
//                         }
//                         _showMessage == ""
//                             ? Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         ChooseCitiesScreen(fromFilter: false)
//                                     //  ChooseCountryForAds(
//                                     //       fromFilter: false,
//                                     //     )
//                                     ))
//                             : showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     backgroundColor: mainAppColor,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(25)),
//                                     title: BigText(
//                                       color: blackColor,
//                                       text: "you must choose $_showMessage",
//                                       typeOfFontWieght: 1,
//                                       size: 12,
//                                     ),
//                                   );
//                                 });
//                       },
//                       btnColor: whiteColor,
//                       btnStyle: TextStyle(color: mainAppColor, fontSize: 16),
//                       borderColor: mainAppColor)),
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

//   Widget buildList(double _width, double _height) {
//     return ListView.builder(
//         padding: EdgeInsets.only(top: _height / 40.6),
//         controller: _controller,
//         itemCount: _allFeaterCategoryByID.length,
//         itemBuilder: (context, index) {
//           return listViewBody(index, _width, _height);
//         });
//   }

//   Widget listViewBody(int index, double _width, double _height) {
//     final _addAdds = Provider.of<AddAdsProvider>(context);

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: _width / 22.05882352941176 //17
//           ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SmallText(
//             text: _allFeaterCategoryByID[index]["name"],
//             color: _showMessage == _allFeaterCategoryByID[index]["name"]
//                 ? redColor
//                 : blackColor,
//             size: _height / 58, //14
//           ),
//           SizedBox(
//             height: _height / 81.2, //10
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => CatergoryOpption(
//                     appBarTitle: _allFeaterCategoryByID[index]["name"],
//                     id: _allFeaterCategoryByID[index]["id"],
//                     selection_type: _allFeaterCategoryByID[index]
//                         ["selection_type"],
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               alignment: UserData.getUSerLang() == "ar"
//                   ? Alignment.centerRight
//                   : Alignment.centerLeft,
//               width: _width,
//               height: _height / 18.04444444444444, //45
//               decoration: BoxDecoration(
//                 color: Color(0xFFF8F9FB),
//                 borderRadius: BorderRadius.circular(10),
//                 border: _showMessage == _allFeaterCategoryByID[index]["name"]
//                     ? Border.all(color: redColor)
//                     : Border.all(
//                         color: Color(0xFFF8F9FB),
//                       ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SmallText(
//                       text: _allFeaterCategoryByID[index]["name"],
//                       color:
//                           _showMessage == _allFeaterCategoryByID[index]["name"]
//                               ? redColor
//                               : textGrayColor,
//                       size: _height / 67.66666666666667, //12
//                     ),
//                     Image.asset(
//                       "assets/images/check.png",
//                       color:
//                           _showMessage == _allFeaterCategoryByID[index]["name"]
//                               ? redColor
//                               : textGrayColor,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: _height / 81.2, //10
//           )
//         ],
//       ),
//     );
//   }

//   void _checkSelect(AddAdsProvider _addAddsProvider) {
//     print("99999999999999999999");
//     _compare.clear();
//     _showMessageErro.clear();

//     _addAddsProvider.opttinName.forEach((item) {
//       _compare.add(item["Feature_Name"]);
//     });

//     print(_compare.toString());

//     _allFeaterCategoryByID.forEach((_item) {
//       if (_compare.contains(_item["name"])) {
//         // print("ok"); //todo navigate
//       } else {
//         _showMessageErro.add(_item["name"]);
//       }
//     });
//     setState(() {
//       if (_showMessageErro.isNotEmpty) {
//         _showMessage = _showMessageErro[0];
//         print(_showMessageErro);
//         print(_showMessage);
//       } else {
//         _showMessage = '';
//       }
//     });
//     // print(_showMessageErro);}
//   }
// }
