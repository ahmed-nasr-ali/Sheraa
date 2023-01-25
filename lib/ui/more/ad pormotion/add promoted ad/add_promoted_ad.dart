// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/custom_container/custom_container.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class AddPromotedAdScreen extends StatefulWidget {
  const AddPromotedAdScreen({Key? key}) : super(key: key);

  @override
  State<AddPromotedAdScreen> createState() => _AddPromotedAdScreenState();
}

class _AddPromotedAdScreenState extends State<AddPromotedAdScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

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
                size: _height / 50.75, //16
                typeOfFontWieght: 1,
                text: AppLocalizations.of(context)!
                    .translate("Add a Promoted Ad")),
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _width / 20.83333333333333 //18,
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: _height / 162.4, //5
                    ),
                    Divider(
                      height: 0,
                      color: containerColor,
                    ),
                    SizedBox(
                      height: _height / 40.6, //20
                    ),
                    Center(
                      child: Container(
                        width: _width / 2.272727272727273, //165
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                _height / 54.13333333333333),
                            color: Color(0xFF3BBEEF)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: _height / 32.48, //25
                            ),
                            Image.asset(
                              "assets/images/gallery.png",
                              color: whiteColor, //todo remove color
                            ),
                            SizedBox(
                              height: _height / 90.22222222222222, //9
                            ),
                            SmallText(
                              text: AppLocalizations.of(context)!
                                  .translate("Add image"),
                              size: _height / 67.6666666666667, //12
                              color: whiteColor, typeOfFontWieght: 1,
                            ),
                            SizedBox(
                              height: _height / 27.06666666666667,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _height / 32.48, //25
                    ),
                    SmallText(
                      text: AppLocalizations.of(context)!.translate("ads_name"),
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height / 67.6666666666667, //12,
                    ),
                    SizedBox(
                      height: _height / 81.2,
                    ),
                    CustomTextFormField(
                      contentPadding: _width / 25, //15
                      // controller: _userPassward,
                      hasHorizontalMargin: false,
                      enableBorder: false,
                      enabled: true,
                      inputData: TextInputType.text,
                      isPassword: false,
                      maxLines: 1,
                      readOnly: false,
                      labelText: AppLocalizations.of(context)!
                          .translate("ads_name_exampel"),
                    ),
                    SizedBox(
                      height: _height / 162.4, //5
                    ),
                    SmallText(
                      text: AppLocalizations.of(context)!
                          .translate("About the ad"),
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height / 67.6666666666667, //12,
                    ),
                    SizedBox(
                      height: _height / 81.2,
                    ),
                    CustomTextFormField(
                      // controller: _adsDescribtion,
                      contentPadding: _width / 25, //15
                      hasHorizontalMargin: false,
                      maxLines: 4,
                      enableBorder: false,
                      enabled: true,
                      isPassword: false,
                      readOnly: false,
                      hintTxt: AppLocalizations.of(context)!
                          .translate("About the ad"),
                      hintSize: _height / 67.66666666666667, //12
                      labelSize: _height / 67.66666666666667, //12
                      inputData: TextInputType.name,
                    ),
                    SizedBox(
                      height: _height / 116, //7
                    ),
                    SmallText(
                      text: AppLocalizations.of(context)!.translate("Ad link"),
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height / 67.6666666666667, //12,
                    ),
                    SizedBox(
                      height: _height / 81.2,
                    ),
                    CustomTextFormField(
                      contentPadding: _width / 25, //15
                      // controller: _userPassward,
                      hasHorizontalMargin: false,
                      enableBorder: false,
                      enabled: true,
                      inputData: TextInputType.text,
                      isPassword: false,
                      maxLines: 1,
                      readOnly: false,
                      labelText:
                          AppLocalizations.of(context)!.translate("Ad link"),
                    ),
                    SizedBox(
                      height: _height / 116, //7
                    ),
                    SmallText(
                      text:
                          AppLocalizations.of(context)!.translate("Link type"),
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height / 67.6666666666667, //12,
                    ),
                    SizedBox(
                      height: _height / 81.2,
                    ),
                    Container(
                      width: _width,
                      height: _height / 16.24,
                      decoration: BoxDecoration(
                        color: Color(0xffF9F9F9),
                        borderRadius:
                            BorderRadius.all(Radius.circular(_height / 81.2)),
                        border: Border.all(color: containerColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: UserData.getUSerLang() == "ar"
                                  ? _width / 25
                                  : _width / 31.25,
                            ),
                            child: SmallText(
                                color: hintColor,
                                size: _height / 67.666666667, //12
                                text: AppLocalizations.of(context)!
                                    .translate("Link type")),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _width / 23.4375),
                            child: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: hintColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height / 116, //7
                    ),
                    SmallText(
                      text: AppLocalizations.of(context)!
                          .translate("Promoted City"),
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height / 67.6666666666667, //12,
                    ),
                    SizedBox(
                      height: _height / 81.2,
                    ),
                    Container(
                      width: _width,
                      height: _height / 14.76363636363636,
                      decoration: BoxDecoration(
                        color: Color(0xffF9F9F9),
                        borderRadius:
                            BorderRadius.all(Radius.circular(_height / 81.2)),
                        border: Border.all(color: containerColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: UserData.getUSerLang() == "ar"
                                  ? _width / 25
                                  : _width / 31.25,
                            ),
                            child: SmallText(
                                color: hintColor,
                                size: _height / 67.666666667, //12
                                text: AppLocalizations.of(context)!
                                    .translate("Promoted City")),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _width / 23.4375),
                            child: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: hintColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height / 27.06666666666667, //30
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          enableVerticalMargin: false,
                          enableHorizontalMargin: false,
                          horizontalMargin: _width / 12.5, //30
                          width: _width / 1.19047619047619, //315
                          height: _height / 18.04444444444444, //35
                          btnLbl:
                              AppLocalizations.of(context)!.translate("add_ad"),
                          onPressedFunction: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             AddPromotedAdScreen()));
                          },
                          btnColor: whiteColor,
                          btnStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: mainAppColor,
                              fontSize: _height / 67.66666666666667),
                          borderColor: mainAppColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _height / 27.06666666666667, //30
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
