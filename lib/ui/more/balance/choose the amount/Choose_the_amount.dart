// ignore_for_file: unused_local_variable, unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/balance/payment%20method/payment_method_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class ChooseTheAmount extends StatefulWidget {
  const ChooseTheAmount({Key? key}) : super(key: key);

  @override
  State<ChooseTheAmount> createState() => _ChooseTheAmountState();
}

class _ChooseTheAmountState extends State<ChooseTheAmount> {
  bool _50Select = false;
  bool _100Select = false;
  bool _200Select = false;

  bool _300Select = false;
  bool _400Select = false;
  bool _500Select = false;

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
                    .translate("Choose the amount")),
          ),
          body: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  SizedBox(
                    height: _height / 162.4, //5
                  ),
                  Divider(
                    height: 0,
                  ),
                  SizedBox(
                    height: _height / 54.13333333333333, //15
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _width / 23.4375, //16
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _50Select = true;
                              _100Select = false;
                              _200Select = false;
                              _300Select = false;
                              _400Select = false;
                              _500Select = false;
                            });
                          },
                          child: Container(
                            width: _width / 3.571428571428571, //105
                            height: _height / 10.82666666666667, //75
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_height / 81.2),
                                border: Border.all(
                                    color: _50Select
                                        ? mainAppColor
                                        : Colors.grey.shade200)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: _height / 58,
                                ),
                                Container(
                                  height: _height / 32.48, //25
                                  // color: mainAppColor,
                                  child: SmallText(
                                    text: "50",
                                    size: _height / 45.11111111111111, //18
                                    typeOfFontWieght: 1,
                                    color: blackColor,
                                  ),
                                ),
                                Container(
                                  child: SmallText(
                                    color: blackColor,
                                    text: AppLocalizations.of(context)!
                                        .translate("rial"),
                                    size: _height / 67.66666666666667, //12
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _50Select = false;
                              _100Select = true;
                              _200Select = false;
                              _300Select = false;
                              _400Select = false;
                              _500Select = false;
                            });
                          },
                          child: Container(
                            width: _width / 3.571428571428571, //105
                            height: _height / 10.82666666666667, //75
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_height / 81.2),
                                border: Border.all(
                                    color: _100Select
                                        ? mainAppColor
                                        : Colors.grey.shade200)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: _height / 58,
                                ),
                                Container(
                                  height: _height / 32.48, //25
                                  // color: mainAppColor,
                                  child: SmallText(
                                    text: "100",
                                    size: _height / 45.11111111111111, //18
                                    typeOfFontWieght: 1,
                                    color: blackColor,
                                  ),
                                ),
                                Container(
                                  child: SmallText(
                                    color: blackColor,
                                    text: AppLocalizations.of(context)!
                                        .translate("rial"),
                                    size: _height / 67.66666666666667, //12
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _50Select = false;
                              _100Select = false;
                              _200Select = true;
                              _300Select = false;
                              _400Select = false;
                              _500Select = false;
                            });
                          },
                          child: Container(
                            width: _width / 3.571428571428571, //105
                            height: _height / 10.82666666666667, //75
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_height / 81.2),
                                border: Border.all(
                                    color: _200Select
                                        ? mainAppColor
                                        : Colors.grey.shade200)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: _height / 58,
                                ),
                                Container(
                                  height: _height / 32.48, //25
                                  // color: mainAppColor,
                                  child: SmallText(
                                    text: "100",
                                    size: _height / 45.11111111111111, //18
                                    typeOfFontWieght: 1,
                                    color: blackColor,
                                  ),
                                ),
                                Container(
                                  child: SmallText(
                                    color: blackColor,
                                    text: AppLocalizations.of(context)!
                                        .translate("rial"),
                                    size: _height / 67.66666666666667, //12
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height / 54.13333333333333, //15
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _width / 23.4375, //16
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _50Select = false;
                              _100Select = false;
                              _200Select = false;
                              _300Select = true;
                              _400Select = false;
                              _500Select = false;
                            });
                          },
                          child: Container(
                            width: _width / 3.571428571428571, //105
                            height: _height / 10.82666666666667, //75
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_height / 81.2),
                                border: Border.all(
                                    color: _300Select
                                        ? mainAppColor
                                        : Colors.grey.shade200)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: _height / 58,
                                ),
                                Container(
                                  height: _height / 32.48, //25
                                  // color: mainAppColor,
                                  child: SmallText(
                                    text: "300",
                                    size: _height / 45.11111111111111, //18
                                    typeOfFontWieght: 1,
                                    color: blackColor,
                                  ),
                                ),
                                Container(
                                  child: SmallText(
                                    color: blackColor,
                                    text: AppLocalizations.of(context)!
                                        .translate("rial"),
                                    size: _height / 67.66666666666667, //12
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _50Select = false;
                              _100Select = false;
                              _200Select = false;
                              _300Select = false;
                              _400Select = true;
                              _500Select = false;
                            });
                          },
                          child: Container(
                            width: _width / 3.571428571428571, //105
                            height: _height / 10.82666666666667, //75
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_height / 81.2),
                                border: Border.all(
                                    color: _400Select
                                        ? mainAppColor
                                        : Colors.grey.shade200)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: _height / 58,
                                ),
                                Container(
                                  height: _height / 32.48, //25
                                  // color: mainAppColor,
                                  child: SmallText(
                                    text: "400",
                                    size: _height / 45.11111111111111, //18
                                    typeOfFontWieght: 1,
                                    color: blackColor,
                                  ),
                                ),
                                Container(
                                  child: SmallText(
                                    color: blackColor,
                                    text: AppLocalizations.of(context)!
                                        .translate("rial"),
                                    size: _height / 67.66666666666667, //12
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _50Select = false;
                              _100Select = false;
                              _200Select = false;
                              _300Select = false;
                              _400Select = false;
                              _500Select = true;
                            });
                          },
                          child: Container(
                            width: _width / 3.571428571428571, //105
                            height: _height / 10.82666666666667, //75
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_height / 81.2),
                                border: Border.all(
                                    color: _500Select
                                        ? mainAppColor
                                        : Colors.grey.shade200)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: _height / 58,
                                ),
                                Container(
                                  height: _height / 32.48, //25
                                  // color: mainAppColor,
                                  child: SmallText(
                                    text: "500",
                                    size: _height / 45.11111111111111, //18
                                    typeOfFontWieght: 1,
                                    color: blackColor,
                                  ),
                                ),
                                Container(
                                  child: SmallText(
                                    color: blackColor,
                                    text: AppLocalizations.of(context)!
                                        .translate("rial"),
                                    size: _height / 67.66666666666667, //12
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Padding(
                padding: EdgeInsets.only(bottom: _height / 20.3),
                child: CustomButton(
                    enableVerticalMargin: false,
                    enableHorizontalMargin: true,
                    horizontalMargin: _width / 12.5, //115
                    width: _width,
                    height: _height / 16.24, //50
                    btnLbl:
                        AppLocalizations.of(context)!.translate("paying off"),
                    onPressedFunction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMethodScreen(
                                    pageName: "",
                                  )));
                    },
                    btnColor: whiteColor,
                    btnStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainAppColor,
                        fontSize: _height / 58),
                    borderColor: mainAppColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
