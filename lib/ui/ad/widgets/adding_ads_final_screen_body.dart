// // ignore_for_file: unused_local_variable, must_be_immutable, unused_field

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
// import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
// import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
// import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/providers/add_ads_provider.dart';
// import 'package:sheraa/providers/media_provider.dart';
// import 'package:sheraa/shared_preferences/user_information_data.dart';
// import 'package:sheraa/ui/ad/widgets/create_ad_successfully.dart';
// import 'package:sheraa/ui/bottom_navigation/bottom_navigation.dart';
// import 'package:sheraa/utils/app_colors.dart';

// class AddingAdsFinalScreenBody extends StatefulWidget {
//   const AddingAdsFinalScreenBody({Key? key}) : super(key: key);

//   @override
//   State<AddingAdsFinalScreenBody> createState() =>
//       _AddingAdsFinalScreenBodyState();
// }

// class _AddingAdsFinalScreenBodyState extends State<AddingAdsFinalScreenBody> {
//   bool _isLoading = false;

//   TextEditingController _adsName = TextEditingController();
//   TextEditingController _adsDescribtion = TextEditingController();

//   TextEditingController _adsPrice = TextEditingController();
//   TextEditingController _adsPhoneNumber = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     // _adsName.text = addAddsSharedPreferences.getAdsName();
//     // _adsDescribtion.text = addAddsSharedPreferences.getAdsDescribtion();
//     // _adsPrice.text = addAddsSharedPreferences.getAdsPrice();
//     // _adsPhoneNumber.text = addAddsSharedPreferences.getAdsPhoneNumber();
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
//         : ListView(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: _height / 81.2, //10
//                   ),
//                   Divider(
//                     thickness: 1,
//                     height: 0,
//                     color: containerColor,
//                   ),
//                   SizedBox(
//                     height: _height / 45.11111111111111, //18
//                   ),
//                   // Container(
//                   //   height: 95,
//                   //   width: _width,
//                   //   color: Colors.grey.shade300,
//                   //   child: ListView.builder(
//                   //       scrollDirection: Axis.horizontal,
//                   //       itemCount:
//                   //           Provider.of<MediaProvider>(context, listen: false)
//                   //               .adMedia
//                   //               .length,
//                   //       itemBuilder: (context, index) {
//                   //         return Container(
//                   //           width: 100,
//                   //           decoration: BoxDecoration(
//                   //               image: DecorationImage(
//                   //                 image: FileImage(Provider.of<MediaProvider>(
//                   //                         context,
//                   //                         listen: false)
//                   //                     .adMedia
//                   //                     .elementAt(index)),
//                   //                 fit: BoxFit.cover,
//                   //               ),
//                   //               color: Colors.amber,
//                   //               borderRadius: BorderRadius.circular(15)),
//                   //         );
//                   //       }),
//                   // ),
//                   SizedBox(
//                     height: _height / 62.46153846153846, //13
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: _width / 20.83333333333333 //18
//                         ),
//                     child: SmallText(
//                       text: AppLocalizations.of(context)!.translate(
//                           "Pictures_increase_your_chances_of_selling_more_than_5_times"),
//                       color: Colors.red,
//                       size: _height / 67.66666666666667, //12
//                       typeOfFontWieght: 1,
//                     ),
//                   ),
//                   SizedBox(
//                     height: _height / 62.46153846153846, //13
//                   ),
//                   Divider(
//                     thickness: 1,
//                     height: 0,
//                     color: containerColor,
//                   ),
//                   // AddAdsItem(
//                   //   rightText:
//                   //       AppLocalizations.of(context)!.translate("_category"),
//                   //   leftText: addAddsSharedPreferences.getMainCategoryName(),
//                   // ),
//                   Divider(
//                     thickness: 1,
//                     height: 0,
//                     color: containerColor,
//                     endIndent: _width / 25, //15
//                     indent: _width / 25, //15
//                   ),
//                   // AddAdsItem(
//                   //   rightText: AppLocalizations.of(context)!
//                   //       .translate("sub_department"),
//                   //   leftText: addAddsSharedPreferences.getSubCategoryName(),
//                   // ),
//                   Divider(
//                     thickness: 1,
//                     height: 0,
//                     color: containerColor,
//                     endIndent: _width / 25, //15
//                     indent: _width / 25, //15
//                   ),
//                   Container(
//                       height: _addAddsProvider.opttinName.length *
//                           (_height / 16.24), //50
//                       child: buildList(_width, _height, _addAddsProvider)),
//                   SizedBox(
//                     height: _height / 81.2,
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: _width / 18.75 //20
//                             ),
//                     child: SmallText(
//                       text: AppLocalizations.of(context)!.translate("ads_name"),
//                       size: _height / 58, //14
//                       color: blackColor,
//                       typeOfFontWieght: 1,
//                     ),
//                   ),
//                   SizedBox(
//                     height: _height / 81.2, //10
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: _width / 20.83333333333333 //18
//                         ),
//                     child: CustomTextFormField(
//                       controller: _adsName,

//                       contentPadding: _width / 25, //15
//                       hasHorizontalMargin: false,
//                       maxLines: 1,
//                       enableBorder: false,
//                       enabled: true,
//                       isPassword: false,
//                       readOnly: true,
//                       hintSize: _height / 67.66666666666667, //12
//                       labelSize: _height / 67.66666666666667, //12
//                       inputData: TextInputType.name,
//                     ),
//                   ),
//                   SizedBox(
//                     height: _height / 162.4, //5
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: _width / 18.75 //20
//                             ),
//                     child: SmallText(
//                       text: AppLocalizations.of(context)!
//                           .translate("ads_decribtion"),
//                       size: _height / 58, //14
//                       color: blackColor,
//                       typeOfFontWieght: 1,
//                     ),
//                   ),
//                   SizedBox(
//                     height: _height / 81.2, //10
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: _width / 20.83333333333333 //18
//                         ),
//                     child: CustomTextFormField(
//                       controller: _adsDescribtion,
//                       contentPadding: _width / 25, //15
//                       hasHorizontalMargin: false,
//                       maxLines: 5,
//                       enableBorder: false,
//                       enabled: true,
//                       isPassword: false,
//                       readOnly: true,
//                       hintTxt: AppLocalizations.of(context)!
//                           .translate("ads_decribtion"),
//                       hintSize: _height / 67.66666666666667, //12
//                       labelSize: _height / 67.66666666666667, //12
//                       inputData: TextInputType.name,
//                     ),
//                   ),
//                   SizedBox(
//                     height: _height / 162.4, //5
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: _width / 20.83333333333333 //18,
//                         ),
//                     child: SmallText(
//                       text: AppLocalizations.of(context)!.translate("price"),
//                       size: _height / 58, //14
//                       color: blackColor,
//                       typeOfFontWieght: 1,
//                     ),
//                   ),
//                   SizedBox(
//                     height: _height / 81.2, //10
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: _width / 20.83333333333333 //18
//                         ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: _width / 1.209677419354839,
//                           child: CustomTextFormField(
//                             controller: _adsPrice,
//                             contentPadding: _width / 25, //15
//                             hasHorizontalMargin: false,
//                             maxLines: 1,
//                             enableBorder: false,
//                             enabled: true,
//                             isPassword: false,
//                             readOnly: true,
//                             hintSize: _height / 67.66666666666667, //12
//                             labelSize: _height / 67.66666666666667, //12
//                             inputData: TextInputType.number,
//                           ),
//                         ),
//                         SmallText(
//                           text: AppLocalizations.of(context)!.translate("rial"),
//                           size: _height / 67.66666666666667, //12
//                           color: textGrayColor,
//                           typeOfFontWieght: 0,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: _height / 162.4, //5
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: _width / 20.83333333333333 //18
//                         ),
//                     child: SmallText(
//                       text: AppLocalizations.of(context)!
//                           .translate("phone number"),
//                       size: _height / 58, //14
//                       color: blackColor,
//                       typeOfFontWieght: 1,
//                     ),
//                   ),
//                   SizedBox(
//                     height: _height / 81.2, //10
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: _width / 20.83333333333333 //18
//                         ),
//                     child: CustomTextFormField(
//                       controller: _adsPhoneNumber,
//                       contentPadding: _width / 25, //15
//                       hasHorizontalMargin: false,
//                       maxLines: 1,
//                       enableBorder: false,
//                       enabled: true,
//                       isPassword: false,
//                       readOnly: true,
//                       hintSize: _height / 67.66666666666667, //12
//                       labelSize: _height / 67.66666666666667, //12
//                       inputData: TextInputType.phone,
//                     ),
//                   ),
//                   SizedBox(
//                     height: _height / 32.48, //25
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: _width / 27.06666666666667,
//                     ),
//                     child: CustomButton(
//                       enableVerticalMargin: false,
//                       enableHorizontalMargin: false,
//                       width: _width,
//                       btnLbl:
//                           AppLocalizations.of(context)!.translate("add_ads"),
//                       onPressedFunction: () {
//                         print(_addAddsProvider.categoryID);

//                         _addAddsProvider.opptionID.forEach((element) {
//                           print(element["id"]);
//                           _addAddsProvider.addCategoryId(element["id"]);
//                         });
//                         print(_addAddsProvider.categoryID);
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => BottomNavigation()),
//                             (route) => false);

//                         showModalBottomSheet(
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (context) {
//                               return Container(
//                                 padding: EdgeInsets.only(
//                                     bottom: MediaQuery.of(context)
//                                         .viewInsets
//                                         .bottom),
//                                 child: CreateAdSuccessfully(),
//                               );
//                             });
//                       },
//                       btnColor: whiteColor,
//                       btnStyle: TextStyle(color: mainAppColor, fontSize: 16),
//                       borderColor: mainAppColor,
//                     ),
//                   ),
//                   SizedBox(
//                     height: _height / 16.24,
//                   )
//                 ],
//               ),
//             ],
//           );
//   }

//   Widget buildList(
//       double _width, double _height, AddAdsProvider _addAddsProvider) {
//     return ListView.separated(
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: _addAddsProvider.opttinName.length,
//       separatorBuilder: (context, index) {
//         return Divider(
//           height: 0,
//           indent: _width / 37.5,
//           endIndent: _width / 37.5,
//         );
//       },
//       itemBuilder: (context, index) {
//         return listViewBody(index, _width, _height, _addAddsProvider);
//       },
//     );
//   }

//   Widget listViewBody(
//       int index, double width, double height, AddAdsProvider _addAddsProvider) {
//     return AddAdsItem(
//         rightText: _addAddsProvider.opttinName[index]["Feature_Name"],
//         leftText: _addAddsProvider.opttinName[index]["Selected_Name"]);
//   }
// }

// // class AddAdsItem extends StatelessWidget {
// //   String rightText;
// //   String leftText;
// //   AddAdsItem({
// //     Key? key,
// //     required this.rightText,
// //     required this.leftText,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     double _height = MediaQuery.of(context).size.height;
// //     double _width = MediaQuery.of(context).size.width;
// //     return Column(
// //       children: [
// //         SizedBox(
// //           height: _height / 62.46153846153846, //13
// //         ),
// //         Row(
// //           children: [
// //             SizedBox(
// //               width: _width / 20.83333333333333, //18
// //             ),
// //             SmallText(
// //               text: rightText,
// //               color: textGrayColor,
// //               size: _height / 58, //14
// //             ),
// //             Expanded(
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.end,
// //                 children: [
// //                   Container(
// //                     alignment: UserData.getUSerLang() == "ar"
// //                         ? Alignment.centerLeft
// //                         : Alignment.centerRight,
// //                     width: _width / 1.785714285714286, //210
// //                     // color: mainAppColor,
// //                     child: SmallText(
// //                       text: leftText,
// //                       color: blackColor,
// //                       size: _height / 58, //14
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: _width / 25, //15
// //                   ),
// //                   Image.asset("assets/images/check.png"),
// //                   SizedBox(
// //                     width: _width / 18.75, //20
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //         SizedBox(
// //           height: _height / 62.46153846153846, //13
// //         ),
// //       ],
// //     );
// //   }
// // }
