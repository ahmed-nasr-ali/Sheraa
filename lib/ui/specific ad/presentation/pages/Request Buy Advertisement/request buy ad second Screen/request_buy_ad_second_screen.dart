// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/Request%20Buy%20Advertisement/request%20buy%20ad%20thrid%20screen/request_buy_ad_thrid_screen.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/Request%20Buy%20Advertisement/request%20buy%20ad%20widget/request_buy_ad_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class RequestBuyAdSecondScreen extends StatefulWidget {
  int adId;
  String addUserName;
  String adPrice;
  String adImage;
  String adName;
  RequestBuyAdSecondScreen({
    Key? key,
    required this.adName,
    required this.adImage,
    required this.adId,
    required this.addUserName,
    required this.adPrice,
  }) : super(key: key);

  @override
  State<RequestBuyAdSecondScreen> createState() =>
      _RequestBuyAdSecondScreenState();
}

class _RequestBuyAdSecondScreenState extends State<RequestBuyAdSecondScreen> {
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
                  .translate("request buy advertisement")),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: 0,
            ),
            SizedBox(
              height: _height / 62.46153846153846, //13
            ),
            Row(
              children: [
                SizedBox(
                  width: _width / 28.84615384615385, //13
                ),
                Container(
                  width: _width / 22.05882352941176, //17
                  height: _height / 47.76470588235294, //17
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/checkbox-circle-fill.png"))),
                ),
                Container(
                  width: (_width / 2) -
                      ((_width / 28.84615384615385) +
                          (_width / 28.84615384615385) +
                          (_width / 22.05882352941176)),
                  height: 1,
                  color: Color(0xffFED214),
                ),
                Container(
                  width: _width / 22.05882352941176, //17
                  height: _height / 47.76470588235294, //17
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/checkbox-circle-fill.png"))),
                ),
                Container(
                  width: _width / 3, //120
                  height: 1,
                  color: Color(0xffE9E9E9),
                )
              ],
            ),
            SizedBox(
              height: _height / 270.6666666666667, //3
            ),
            Row(
              children: [
                SizedBox(
                    width: (_width / 22.05882352941176) +
                        (_width / 22.05882352941176) +
                        (_width / 2.5)),
                SmallText(
                  size: _height / 67.66666666666667, //12
                  color: blackColor,
                  text: AppLocalizations.of(context)!
                      .translate("Confirm sale operation"),
                )
              ],
            ),
            SizedBox(
              height: _height / 27.06666666666667, //30
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width / 31.25 //12
                  ),
              child: Row(
                children: [
                  Container(
                    width: _width / 7.8125, //48
                    height: _height / 16.91666666666667, //48
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.adImage),
                          fit: BoxFit.cover),
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(_height / 81.2 //10
                          ),
                    ),
                  ),
                  SizedBox(
                    width: _width / 37.5, //10
                  ),
                  Container(
                    width: _width / 1.339285714285714, //280
                    child: SmallText(
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height / 67.66666666666667, //12
                      align: TextAlign.start,
                      text: widget.adName,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _height / 35.30434782608696, //23
            ),
            RequestBuyAdWidget(
              containerColor: secondryMainColor,
              startText: AppLocalizations.of(context)!.translate("Ad number"),
              endText: widget.adId.toString(),
            ),
            RequestBuyAdWidget(
              containerColor: Theme.of(context).scaffoldBackgroundColor,
              startText:
                  AppLocalizations.of(context)!.translate("Advertiser name"),
              endText: widget.addUserName,
            ),
            RequestBuyAdWidget(
              containerColor: secondryMainColor,
              startText:
                  AppLocalizations.of(context)!.translate("Membership No"),
              endText: "214454",
            ),
            RequestBuyAdWidget(
              containerColor: Theme.of(context).scaffoldBackgroundColor,
              startText: AppLocalizations.of(context)!.translate("price"),
              endText: widget.adPrice.toString() +
                  (UserData.getUSerLang() == "ar" ? " ر .س" : "R .S"),
            ),
            SizedBox(
              height: _height / 32.48, //25
            ),
            Divider(
              height: 0,
            ),
            SizedBox(
              height: _height / 32.48, //25
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _width / 22.05882352941176,
              ),
              child: Row(
                children: [
                  SmallText(
                      color: blackColor,
                      size: _height / 67.66666666666667, //12
                      typeOfFontWieght: 1,
                      text: AppLocalizations.of(context)!
                          .translate("commission Sheraa")),
                  SizedBox(
                    width: _width / 75,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    // width: _width / 1.630434782608696, //230
                    // color: mainAppColor,
                    child: SmallText(
                        align: TextAlign.start,
                        color: textGrayColor,
                        size: UserData.getUSerLang() == "ar"
                            ? _height / 81.2
                            : _height / 108.2666666666667, //12
                        typeOfFontWieght: 0,
                        text: AppLocalizations.of(context)!.translate(
                            "(The value of 10 Saudi riyals from each sale made through a purchase)")),
                  )
                ],
              ),
            ),
            SizedBox(
              height: _height / 81.2, //10
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(
                  color: Color(0xFF5AB66B),
                  typeOfFontWieght: 1,
                  size: _height / 50.75, //16
                  text: widget.adPrice,
                ),
                SmallText(
                    color: Color(0xFF5AB66B),
                    size: _height / 67.66666666666667, //12,

                    typeOfFontWieght: 0,
                    text: UserData.getUSerLang() == "ar" ? " ر .س " : " R .S "),
              ],
            ),
            SizedBox(
              height: _height / 40.6, //20
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: _width / 23.4375), //16
              color: Color(0xffF8F9FB),
              width: _width,
              // height: _height / 6.94017094017094, //117
              child: Column(
                children: [
                  SizedBox(
                    height: _height / 40.6, //20
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _width / 20.83333333333333, //18
                      ),
                      Container(
                        height: _height / 135.3333333333333, //6
                        width: _width / 62.5, //6
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: blackColor),
                      ),
                      SizedBox(
                        width: _width / 53.57142857142857, //7
                      ),
                      SmallText(
                          text: AppLocalizations.of(context)!.translate(
                              "Do not choose confirmation until after the sale has been made"),
                          color: blackColor,
                          typeOfFontWieght: 0,
                          size: UserData.getUSerLang() == "ar"
                              ? _height / 67.66666666666667
                              : _height / 90.22222222222222),
                    ],
                  ),
                  SizedBox(
                    height: _height / 116, //7
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _width / 20.83333333333333, //18
                      ),
                      Container(
                        height: _height / 135.3333333333333, //6
                        width: _width / 62.5, //6
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: blackColor),
                      ),
                      SizedBox(
                        width: _width / 53.57142857142857, //7
                      ),
                      SmallText(
                          text: AppLocalizations.of(context)!.translate(
                              "Upon confirmation, the commission amount will be deducted from the wallet"),
                          color: blackColor,
                          typeOfFontWieght: 0,
                          size: UserData.getUSerLang() == "ar"
                              ? _height / 67.66666666666667
                              : _height / 90.22222222222222),
                    ],
                  ),
                  SizedBox(
                    height: _height / 116, //7
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _width / 20.83333333333333, //18
                      ),
                      Container(
                        height: _height / 135.3333333333333, //6
                        width: _width / 62.5, //6
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: blackColor),
                      ),
                      SizedBox(
                        width: _width / 53.57142857142857, //7
                      ),
                      SmallText(
                          text: AppLocalizations.of(context)!.translate(
                              "Upon confirmation, the evaluation form will be sent to the buyer"),
                          color: blackColor,
                          typeOfFontWieght: 0,
                          size: UserData.getUSerLang() == "ar"
                              ? _height / 67.66666666666667
                              : _height / 90.22222222222222),
                    ],
                  ),
                  SizedBox(
                    height: _height / 40.6, //20
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _height / 27.06666666666667, //30
            ),
            CustomButton(
                enableVerticalMargin: false,
                enableHorizontalMargin: true,
                horizontalMargin: _width / 12.5, //30
                width: _width,
                height: _height / 16.24, //50
                btnLbl: AppLocalizations.of(context)!
                    .translate("Confirm sale operation"),
                onPressedFunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RequestBuyAdThridScreen()));
                },
                btnColor: whiteColor,
                btnStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: mainAppColor,
                    fontSize: _height / 58),
                borderColor: mainAppColor),
          ],
        ),
      ),
    ));
  }
}
