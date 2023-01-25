// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/Request%20Buy%20Advertisement/request%20buy%20ad%20quiestion%20mark/request_buy_ad_question_mark.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/Request%20Buy%20Advertisement/request%20buy%20ad%20widget/request_buy_ad_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class RequestBuyAdfristScreen extends StatefulWidget {
  int adId;
  String addUserName;
  String adPrice;
  String adImage;
  String adName;
  String userId;

  RequestBuyAdfristScreen({
    Key? key,
    required this.adId,
    required this.addUserName,
    required this.adPrice,
    required this.adImage,
    required this.adName,
    required this.userId,
  }) : super(key: key);

  @override
  State<RequestBuyAdfristScreen> createState() =>
      _RequestBuyAdfristScreenState();
}

class _RequestBuyAdfristScreenState extends State<RequestBuyAdfristScreen> {
  @override
  void initState() {
    super.initState();
  }

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
            Container(
              height: _height / 18.04444444444444, //45
              width: _width,
              color: accentColor,
              child: Row(
                children: [
                  SizedBox(
                    width: _width / 20.83333333333333, //18
                  ),
                  SmallText(
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height / 67.66666666666667, //12
                      text: AppLocalizations.of(context)!
                          .translate("request buy advertisement")),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: _width / 75),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RequestBuyAdQuestionMark(),
                              ),
                            );
                          },
                          child:
                              Image.asset("assets/images/question-fill.png"))),
                ],
              ),
            ),
            SizedBox(
              height: _height / 45.11111111111111, //45
            ),
            Row(
              children: [
                SizedBox(
                  width: _width / 28.84615384615385, //13
                ),
                Image.asset("assets/images/checkbox-circle-fill.png"),
                Container(
                  width: _width / 1.198083067092652,
                  height: 1,
                  color: Color(0xffE9E9E9),
                ),
              ],
            ),
            SizedBox(
              height: _height / 162.4, //5
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width / 25),
              child: SmallText(
                  size: _height / 67.66666666666667, //12
                  color: blackColor,
                  text: AppLocalizations.of(context)!
                      .translate("Send the request to the advertiser")),
            ),
            SizedBox(
              height: _height / 21.36842105263158, //38
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width / 31.25 //12
                  ),
              child: Row(
                children: [
                  widget.adImage.isEmpty
                      ? Container()
                      : Container(
                          width: _width / 7.8125, //48
                          height: _height / 16.91666666666667, //48
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget.adImage),
                                fit: BoxFit.cover),
                            color: Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.circular(_height / 81.2 //10
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
              endText: widget.userId,
            ),
            RequestBuyAdWidget(
              containerColor: Theme.of(context).scaffoldBackgroundColor,
              startText: AppLocalizations.of(context)!.translate("price"),
              endText: widget.adPrice.toString() +
                  (UserData.getUSerLang() == "ar" ? " ر .س" : "R .S"),
            ),
            SizedBox(
              height: _height / 16.24, //50
            ),
            CustomButton(
                enableVerticalMargin: false,
                enableHorizontalMargin: true,
                horizontalMargin: _width / 12.25, //30,
                width: _width,
                height: _height / 16.24, //50,
                btnLbl: AppLocalizations.of(context)!
                    .translate("Send the request to the advertiser"),
                onPressedFunction: () {
                  // Map<String, dynamic> data = {
                  //   "ad name": widget.adName,
                  //   "ad number": widget.adId,
                  //   "user name": UserData.getUserName(),
                  //   "user Id": widget.userId,
                  //   "price": widget.adPrice,
                  // };
                  // FirebaseNotifcationMessages.sendNotificationToRequestBuyAd(
                  //   "Sheraa App",
                  //   "طلب شراء العلان",
                  //   data,
                  //   widget.userDeviceToken,
                  // );
                  snakBarWidget(
                      context: context, content: "تم ارسال طلب للمعلن ");
                },
                btnColor: whiteColor,
                btnStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: mainAppColor,
                    fontSize: _height / 58 //12
                    ),
                borderColor: mainAppColor),
          ],
        ),
      ),
    ));
  }
}
