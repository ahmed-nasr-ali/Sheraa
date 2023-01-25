// // ignore_for_file: unused_field, unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
// import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
// import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
// import 'package:sheraa/locale/app_localizations.dart';
// import 'package:sheraa/shared_preferences/add_adds.dart';
// import 'package:sheraa/shared_preferences/user_information_data.dart';
// import 'package:sheraa/ui/ad/add_ad_final_screen.dart';
// import 'package:sheraa/ui/adding%20ad/presentation/pages/adding%20ad%20information%20screen/disable%20reply%20screen/disable_reply_feature.dart';
// import 'package:sheraa/utils/app_colors.dart';

// class AdsInformationsSecondPageBody extends StatefulWidget {
//   const AdsInformationsSecondPageBody({Key? key}) : super(key: key);

//   @override
//   State<AdsInformationsSecondPageBody> createState() =>
//       _AdsInformationsSecondPageBodyState();
// }

// class _AdsInformationsSecondPageBodyState
//     extends State<AdsInformationsSecondPageBody> {
//   bool _isLoading = false;
//   bool _isAddationalPhoneNumber = false;
//   bool _hiddenPhoneNumber = true;
//   bool _disableReply = true;

//   bool _adsPriceError = false;
//   bool _adsPhoneNumberError = false;
//   bool _adsPriceAndPhoneNumberError = false;

//   bool _adsAnotherPhoneNumberErro = false;

//   bool _adsAllFieldsHaveError = false;

//   double _adsPriceErrorHeight = 0;
//   double _adsPhoneNumberErrorHeight = 0;
//   double __adsPriceAndPhoneNumberErrorssHeight = 0;

//   double _adsAnotherPhoneNumberErroHeight = 0;

//   double _adsAllFieldsHaveErrorHeight = 0;

//   TextEditingController _adsPrice = TextEditingController();
//   TextEditingController _phoneNumber = TextEditingController();
//   TextEditingController _addtionPhoneNumber = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     double _height = MediaQuery.of(context).size.height;
//     double _width = MediaQuery.of(context).size.width;

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
//                         text: AppLocalizations.of(context)!.translate("price"),
//                         size: _height / 58, //14
//                         color: blackColor,
//                         typeOfFontWieght: 1,
//                       ),
//                       SizedBox(
//                         height: _height / 81.2, //10
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: _width / 1.209677419354839,
//                             child: CustomTextFormField(
//                               controller: _adsPrice,
//                               contentPadding: _width / 25, //15
//                               hasHorizontalMargin: false,
//                               maxLines: 1,
//                               enableBorder: false,
//                               enabled: true,
//                               isPassword: false,
//                               readOnly: false,
//                               labelText: AppLocalizations.of(context)!
//                                   .translate("price"),
//                               hintSize: _height / 67.66666666666667, //12
//                               labelSize: _height / 67.66666666666667, //12
//                               inputData: TextInputType.number,
//                               validationFunc: (value) {
//                                 if (value!.isEmpty) {
//                                   setState(() {
//                                     _adsPriceError = true;
//                                     _adsPriceErrorHeight =
//                                         _height / 2.952727272727273; //250
//                                   });
//                                   return AppLocalizations.of(context)!
//                                       .translate("please_enter_price");
//                                 }
//                                 {
//                                   setState(() {
//                                     _adsPriceError = false;
//                                     _adsPriceAndPhoneNumberError = false;
//                                   });
//                                   return null;
//                                 }
//                               },
//                             ),
//                           ),
//                           SmallText(
//                             text:
//                                 AppLocalizations.of(context)!.translate("rial"),
//                             size: _height / 67.66666666666667, //12
//                             color: textGrayColor,
//                             typeOfFontWieght: 0,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: _height / 162.4, //5
//                       ),
//                       SmallText(
//                         text: AppLocalizations.of(context)!
//                             .translate("phone number"),
//                         size: _height / 58, //14
//                         color: blackColor,
//                         typeOfFontWieght: 1,
//                       ),
//                       SizedBox(
//                         height: _height / 81.2, //10
//                       ),
//                       CustomTextFormField(
//                         controller: _phoneNumber,
//                         contentPadding: _width / 25, //15
//                         hasHorizontalMargin: false,
//                         maxLines: 1,
//                         enableBorder: false,
//                         enabled: true,
//                         isPassword: false,
//                         readOnly: false,
//                         labelText: "050XXXXXX",
//                         hintSize: _height / 67.66666666666667, //12
//                         labelSize: _height / 67.66666666666667, //12
//                         inputData: TextInputType.phone,
//                         validationFunc: (value) {
//                           if (value!.isEmpty) {
//                             setState(() {
//                               _adsPhoneNumberError = true;
//                               _adsPhoneNumberErrorHeight =
//                                   _height / 2.952727272727273; //250

//                               if (_adsPhoneNumberError == true &&
//                                   _adsPriceError == true) {
//                                 _adsPriceAndPhoneNumberError = true;
//                                 __adsPriceAndPhoneNumberErrorssHeight =
//                                     _height / 3.383333333333333; //250

//                                 print(__adsPriceAndPhoneNumberErrorssHeight);
//                               }
//                             });
//                             return AppLocalizations.of(context)!
//                                 .translate("please_enter_phone_number");
//                           }
//                           {
//                             setState(() {
//                               _adsPhoneNumberError = false;
//                               _adsPriceAndPhoneNumberError = false;
//                             });
//                             return null;
//                           }
//                         },
//                       ),
//                       SizedBox(
//                         height: _height / 62.46153846153846, //13
//                       ),
//                       _isAddationalPhoneNumber
//                           ? Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SmallText(
//                                   text: AppLocalizations.of(context)!
//                                       .translate("another_phone_number"),
//                                   size: _height / 58, //14
//                                   color: blackColor,
//                                   typeOfFontWieght: 1,
//                                 ),
//                                 SizedBox(
//                                   height: _height / 81.2, //10
//                                 ),
//                                 CustomTextFormField(
//                                   controller: _addtionPhoneNumber,
//                                   contentPadding: _width / 25, //15
//                                   hasHorizontalMargin: false,
//                                   maxLines: 1,
//                                   enableBorder: false,
//                                   enabled: true,
//                                   isPassword: false,
//                                   readOnly: false,
//                                   labelText: "050XXXXXX",
//                                   hintSize: _height / 67.66666666666667, //12
//                                   labelSize: _height / 67.66666666666667, //12
//                                   inputData: TextInputType.phone,
//                                   validationFunc: (value) {
//                                     if (value!.isEmpty) {
//                                       {
//                                         setState(() {
//                                           _adsAnotherPhoneNumberErro = true;
//                                           _adsAnotherPhoneNumberErroHeight =
//                                               _height / 3.690909090909091;

//                                           if (_adsPriceError == true &&
//                                               _adsPhoneNumberError == true &&
//                                               _adsAnotherPhoneNumberErro ==
//                                                   true) {
//                                             _adsAllFieldsHaveError = true;
//                                             _adsAllFieldsHaveErrorHeight =
//                                                 _height / 4.921212121212121;
//                                           }
//                                         });
//                                         return AppLocalizations.of(context)!
//                                             .translate(
//                                                 "please_enter_antho_phone_number");
//                                       }
//                                     }
//                                     {
//                                       setState(() {
//                                         _adsAnotherPhoneNumberErro = false;
//                                       });
//                                       return null;
//                                     }
//                                   },
//                                 ),
//                               ],
//                             )
//                           : InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   _isAddationalPhoneNumber = true;
//                                 });
//                               },
//                               child: Row(
//                                 children: [
//                                   SizedBox(
//                                     width: _width / 75, //5
//                                   ),
//                                   Image.asset("assets/images/add.png"),
//                                   SizedBox(
//                                     width: _width / 75, //5
//                                   ),
//                                   SmallText(
//                                     text: AppLocalizations.of(context)!
//                                         .translate("add_another_phone_number"),
//                                     size: _height / 58, //14
//                                     color: blackColor,
//                                     typeOfFontWieght: 1,
//                                   ),
//                                   // assets/images/question-fill.png
//                                   SizedBox(
//                                     width: _width / 75, //5
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                         top: _height / 324.8), //2.5
//                                     child: Image.asset(
//                                         "assets/images/question-fill.png"),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                       SizedBox(
//                         height: _height / 32.48, //25
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsets.symmetric(horizontal: _width / 75),
//                             child: SmallText(
//                               text: AppLocalizations.of(context)!.translate(
//                                   "Hide_mobile_number_and_WhatsApp_communication_feature"),
//                               size: UserData.getUSerLang() == "ar"
//                                   ? _height / 58
//                                   : 10, //14
//                               color: blackColor,
//                               typeOfFontWieght: 0,
//                             ),
//                           ),
//                           Container(
//                             width: 26,
//                             height: 16,
//                             child: Switch.adaptive(
//                               activeColor: mainAppColor,
//                               splashRadius: 0,
//                               value: _hiddenPhoneNumber,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _hiddenPhoneNumber = !_hiddenPhoneNumber;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: _height / 45.11111111111111, //18
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsets.symmetric(horizontal: _width / 75),
//                             child: Row(
//                               children: [
//                                 SmallText(
//                                   text: AppLocalizations.of(context)!.translate(
//                                       "Disable_the_reply_feature"), //todo
//                                   size: _height / 58, //14
//                                   color: blackColor,
//                                   typeOfFontWieght: 0,
//                                 ),
//                                 SizedBox(
//                                   width: _width / 75, //5
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 DisableReplyFeature()));
//                                   },
//                                   child: Padding(
//                                       padding: EdgeInsets.only(
//                                           top: _height / 324.8), //2.5
//                                       child: Container(
//                                         width: _width / 22.05882352941176, //17
//                                         height:
//                                             _height / 47.76470588235294, //17
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                             image: AssetImage(
//                                                 "assets/images/question-fill.png"),
//                                           ),
//                                         ),
//                                       )),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: 26,
//                             height: 16,
//                             child: Switch.adaptive(
//                               activeColor: mainAppColor,
//                               splashRadius: 0,
//                               value: _disableReply,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _disableReply = !_disableReply;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: _isAddationalPhoneNumber
//                             ? _adsAllFieldsHaveError
//                                 ? _adsAllFieldsHaveErrorHeight
//                                 : _adsPriceAndPhoneNumberError
//                                     ? _height / 4.511111111111111 //190
//                                     : _adsAnotherPhoneNumberErro
//                                         ? _adsAnotherPhoneNumberErroHeight
//                                         : _adsPriceError
//                                             ? _height / 3.866666666666667 //200
//                                             : _adsPhoneNumberError
//                                                 ? _height /
//                                                     3.866666666666667 //200
//                                                 : _height / 3.248 //240
//                             : _adsPriceAndPhoneNumberError
//                                 ? __adsPriceAndPhoneNumberErrorssHeight
//                                 : _adsPriceError
//                                     ? _adsPriceErrorHeight
//                                     : _adsPhoneNumberError
//                                         ? _adsPhoneNumberErrorHeight
//                                         : _height / 2.706666666666667, //300
//                       ),
//                       CustomButton(
//                           enableHorizontalMargin: false,
//                           width: _width,
//                           btnLbl: AppLocalizations.of(context)!
//                               .translate("add_ads"),
//                           onPressedFunction: () {
//                             if (_formKey.currentState!.validate()) {
//                               // setState(() {
//                               //   addAddsSharedPreferences
//                               //       .setAdsPrice(_adsPrice.text);

//                               //   addAddsSharedPreferences
//                               //       .setAdsPhoneNumber(_phoneNumber.text);
//                               // });

//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           AddingAdsFinalScreen()));
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
