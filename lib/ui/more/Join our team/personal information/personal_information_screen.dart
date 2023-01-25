// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class PersonalInformationScreeen extends StatefulWidget {
  const PersonalInformationScreeen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreeen> createState() =>
      _PersonalInformationScreeenState();
}

class _PersonalInformationScreeenState
    extends State<PersonalInformationScreeen> {
  double? _height;
  double? _width;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset("assets/images/arrow_simple_chock.png")),
            title: SmallText(
              color: blackColor,
              size: _height! / 50.75, //16
              typeOfFontWieght: 1,
              text: AppLocalizations.of(context)!
                  .translate("Fill out personal information"),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _width! / 20.83333333333333 //18,
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: _height! / 162.4, //5
                    ),
                    Divider(
                      height: 0,
                      color: containerColor,
                    ),
                    SizedBox(
                      height: _height! / 81.2, //10
                    ),
                    SmallText(
                      text:
                          AppLocalizations.of(context)!.translate("Full name"),
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height! / 67.6666666666667, //12,
                    ),
                    SizedBox(
                      height: _height! / 81.2,
                    ),
                    CustomTextFormField(
                      labelSize: _height! / 67.66666666666667,
                      contentPadding: _width! / 25, //15
                      // controller: _userPassward,
                      hasHorizontalMargin: false,
                      enableBorder: false,
                      enabled: true,
                      inputData: TextInputType.text,
                      isPassword: false,
                      maxLines: 1,
                      readOnly: false,
                      labelText: AppLocalizations.of(context)!
                          .translate("Please write the full name"),
                    ),
                    SizedBox(
                      height: _height! / 116, //7
                    ),
                    SmallText(
                      text: AppLocalizations.of(context)!.translate("E-mail"),
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height! / 67.6666666666667, //12,
                    ),
                    SizedBox(
                      height: _height! / 81.2,
                    ),
                    CustomTextFormField(
                      labelSize: _height! / 67.66666666666667,
                      contentPadding: _width! / 25, //15
                      // controller: _userPassward,
                      hasHorizontalMargin: false,
                      enableBorder: false,
                      enabled: true,
                      inputData: TextInputType.text,
                      isPassword: false,
                      maxLines: 1,
                      readOnly: false,
                      labelText:
                          AppLocalizations.of(context)!.translate("E-mail"),
                    ),
                    SizedBox(
                      height: _height! / 116, //7
                    ),
                    SmallText(
                      text: AppLocalizations.of(context)!.translate("Country"),
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height! / 67.6666666666667, //12,
                    ),
                    SizedBox(
                      height: _height! / 81.2,
                    ),
                    Container(
                      width: _width,
                      height: _height! / 16.24,
                      decoration: BoxDecoration(
                        color: Color(0xffF9F9F9),
                        borderRadius:
                            BorderRadius.all(Radius.circular(_height! / 81.2)),
                        border: Border.all(color: containerColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: UserData.getUSerLang() == "ar"
                                  ? _width! / 25
                                  : _width! / 31.25,
                            ),
                            child: SmallText(
                                color: hintColor,
                                size: _height! / 67.666666667, //12
                                text: AppLocalizations.of(context)!
                                    .translate("Country")),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _width! / 23.4375),
                            child: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: hintColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height! / 116, //7
                    ),
                    SmallText(
                      text: AppLocalizations.of(context)!
                          .translate("phone number"),
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height! / 67.6666666666667, //12,
                    ),
                    SizedBox(
                      height: _height! / 81.2,
                    ),
                    CustomTextFormField(
                      labelSize: _height! / 67.66666666666667,
                      contentPadding: _width! / 25, //15
                      // controller: _userPassward,
                      hasHorizontalMargin: false,
                      enableBorder: false,
                      enabled: true,
                      inputData: TextInputType.text,
                      isPassword: false,
                      maxLines: 1,
                      readOnly: false,
                      labelText: AppLocalizations.of(context)!
                          .translate("phone number"),
                    ),
                    SizedBox(
                      height: _height! / 116, //7
                    ),
                    SmallText(
                      text: AppLocalizations.of(context)!
                          .translate("coupon code"),
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height! / 67.6666666666667, //12,
                    ),
                    SizedBox(
                      height: _height! / 81.2,
                    ),
                    CustomTextFormField(
                      labelSize: _height! / 67.66666666666667,
                      contentPadding: _width! / 25, //15
                      // controller: _userPassward,
                      hasHorizontalMargin: false,
                      enableBorder: false,
                      enabled: true,
                      inputData: TextInputType.text,
                      isPassword: false,
                      maxLines: 1,
                      readOnly: false,
                      labelText: AppLocalizations.of(context)!.translate(
                          "Type a code consisting of 4 letters or numbers"),
                    ),
                    SizedBox(
                      height: _height! / 81.2,
                    ),
                    SmallText(
                      size: _height! / 81.2,
                      color: textGrayColor,
                      text: AppLocalizations.of(context)!.translate(
                          "All of the above information must be filled out"),
                    ),
                    SizedBox(
                      height: _height! / 32.48,
                    ),
                    Center(
                      child: CustomButton(
                        enableVerticalMargin: false,
                        enableHorizontalMargin: false,
                        horizontalMargin: _width! / 12.5, //30
                        width: _width! / 1.19047619047619, //315
                        height: _height! / 18.04444444444444, //45
                        btnLbl: AppLocalizations.of(context)!
                            .translate("Complete the application to join"),
                        onPressedFunction: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             PersonalInformationScreeen()));
                        },
                        btnColor: whiteColor,
                        btnStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: mainAppColor,
                            fontSize: _height! / 67.66666666666667),
                        borderColor: mainAppColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
