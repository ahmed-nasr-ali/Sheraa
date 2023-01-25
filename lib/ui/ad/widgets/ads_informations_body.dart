// // ignore_for_file: unused_local_variable, unused_field

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
// import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
// import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/shared_preferences/add_adds.dart';
// import 'package:sheraa/ui/ad/ads_informations_second_page.dart';
// import 'package:sheraa/utils/app_colors.dart';

// class AdsInformationsBody extends StatefulWidget {
//   const AdsInformationsBody({Key? key}) : super(key: key);

//   @override
//   State<AdsInformationsBody> createState() => _AdsInformationsBodyState();
// }

// class _AdsInformationsBodyState extends State<AdsInformationsBody> {
//   bool _isLoading = false;
//   bool _adsNameError = false;
//   bool _adsDescribtionError = false;
//   bool _adsNameAndDescrbtionErro = false;

//   double _adsNameErrorHieght = 0;
//   double _adsDescribtionErrorHieght = 0;
//   double _adsNameAndDescrbtionErroHieght = 0;

//   TextEditingController _adsName = TextEditingController();
//   TextEditingController _adsDescribtion = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     double _height = MediaQuery.of(context).size.height;
//     double _width = MediaQuery.of(context).size.width;
//     double _normalHieght = _height / 2.423880597014925;

//     return _isLoading
//         ? Center(
//             child: SpinKitFadingCircle(color: mainAppColor),
//           )
//         : Form(
//             key: _formKey,
//             child: ListView(
//               children: [
//                 SizedBox(
//                   height: _height / 81.2, //10
//                 ),
//                 Divider(
//                   thickness: 1,
//                   height: 0,
//                   color: containerColor,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: _width / 20.83333333333333 //18
//                       ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: _height / 54.13333333333333 //15
//                           ),
//                       SmallText(
//                         text:
//                             AppLocalizations.of(context)!.translate("ads_name"),
//                         size: _height / 58, //14
//                         color: blackColor,
//                         typeOfFontWieght: 1,
//                       ),
//                       SizedBox(
//                         height: _height / 81.2, //10
//                       ),
//                       CustomTextFormField(
//                         controller: _adsName,
//                         contentPadding: _width / 25, //15
//                         hasHorizontalMargin: false,
//                         maxLines: 1,
//                         enableBorder: false,
//                         enabled: true,
//                         isPassword: false,
//                         readOnly: false,
//                         labelText: AppLocalizations.of(context)!
//                             .translate("ads_name_exampel"),
//                         hintSize: _height / 67.66666666666667, //12
//                         labelSize: _height / 67.66666666666667, //12
//                         inputData: TextInputType.name,
//                         validationFunc: (value) {
//                           if (value!.isEmpty) {
//                             setState(() {
//                               _adsNameError = true;
//                               _adsNameErrorHieght =
//                                   _height / 2.619354838709677; //310
//                             });
//                             return AppLocalizations.of(context)!
//                                 .translate("please_enter_ads_name");
//                           }
//                           {
//                             setState(() {
//                               _adsNameError = false;
//                               _adsNameAndDescrbtionErro = false;
//                             });
//                             return null;
//                           }
//                         },
//                       ),
//                       SizedBox(
//                         height: _height / 162.4, //5
//                       ),
//                       SmallText(
//                         text: AppLocalizations.of(context)!
//                             .translate("ads_decribtion"),
//                         size: _height / 58, //14
//                         color: blackColor,
//                         typeOfFontWieght: 1,
//                       ),
//                       SizedBox(
//                         height: _height / 81.2, //10
//                       ),
//                       CustomTextFormField(
//                         controller: _adsDescribtion,
//                         contentPadding: _width / 25, //15
//                         hasHorizontalMargin: false,
//                         maxLines: 5,
//                         enableBorder: false,
//                         enabled: true,
//                         isPassword: false,
//                         readOnly: false,
//                         hintTxt: AppLocalizations.of(context)!
//                             .translate("ads_decribtion"),
//                         hintSize: _height / 67.66666666666667, //12
//                         labelSize: _height / 67.66666666666667, //12
//                         inputData: TextInputType.name,
//                         validationFunc: (value) {
//                           if (value!.isEmpty) {
//                             {
//                               setState(() {
//                                 _adsDescribtionError = true;

//                                 _adsDescribtionErrorHieght =
//                                     _height / 2.619354838709677; //310

//                                 if (_adsDescribtionError == true &&
//                                     _adsNameError == true) {
//                                   _adsNameAndDescrbtionErro = true;

//                                   _adsNameAndDescrbtionErroHieght =
//                                       _height / 2.952727272727273; //270

//                                 } else {
//                                   _adsNameAndDescrbtionErro = false;
//                                 }
//                               });
//                               return AppLocalizations.of(context)!
//                                   .translate("please_enter_ads_decribation");
//                             }
//                           }
//                           {
//                             setState(() {
//                               _adsDescribtionError = false;
//                               _adsNameAndDescrbtionErro = false;
//                             });
//                             return null;
//                           }
//                         },
//                       ),
//                       SizedBox(
//                           height: _adsNameAndDescrbtionErro
//                               ? _adsNameAndDescrbtionErroHieght
//                               : _adsNameError
//                                   ? _adsNameErrorHieght
//                                   : _adsDescribtionError
//                                       ? _adsDescribtionErrorHieght
//                                       : _normalHieght), //335

//                       CustomButton(
//                           enableVerticalMargin: false,
//                           enableHorizontalMargin: false,
//                           width: _width,
//                           btnLbl:
//                               AppLocalizations.of(context)!.translate("next"),
//                           onPressedFunction: () {
//                             if (_formKey.currentState!.validate()) {
//                               // addAddsSharedPreferences
//                               //     .setAdsName(_adsName.text);
//                               // addAddsSharedPreferences
//                               //     .setAdsDescribtion(_adsDescribtion.text);
//                               // print(addAddsSharedPreferences.getAdsName());
//                               // print(
//                               //     addAddsSharedPreferences.getAdsDescribtion());

//                               setState(() {
//                                 _adsDescribtionError = false;
//                                 _adsNameError = false;
//                                 _adsNameAndDescrbtionErro = false;
//                                 _normalHieght = _height / 2.423880597014925;
//                               });

//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           AdsInformationsSecondPage()));
//                             }
//                           },
//                           btnColor: whiteColor,
//                           btnStyle:
//                               TextStyle(color: mainAppColor, fontSize: 16),
//                           borderColor: mainAppColor),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }
