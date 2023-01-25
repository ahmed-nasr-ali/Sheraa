// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/balance/terms%20and%20conditions%20screen/terms_and_conditions_screen.dart';
import 'package:sheraa/ui/more/earn%20points/earn%20point%20question%20screen/earn_point_question_screen.dart';
import 'package:sheraa/ui/more/earn%20points/earn%20point%20transaction%20history/earn_point_transaction_history.dart';
import 'package:sheraa/ui/more/earnpoint%20and%20movement%20widget/earnpoint_and_movement_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class EarnPointScreen extends StatefulWidget {
  const EarnPointScreen({Key? key}) : super(key: key);

  @override
  State<EarnPointScreen> createState() => _EarnPointScreenState();
}

class _EarnPointScreenState extends State<EarnPointScreen> {
  List transactionHistory = [];

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
              text: AppLocalizations.of(context)!.translate("earned_points")),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: _height / 162.4, //5
                      ),
                      Container(
                        width: double.maxFinite,
                        color: secondryMainColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: _height / 50.75 //16
                                ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                  text: AppLocalizations.of(context)!
                                      .translate("current balance"),
                                  size: _height / 67.66666666666667, //12
                                  typeOfFontWieght: 1,
                                ),
                                SizedBox(width: _width / 75), //5
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EarnPointQuestionScreen(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                      'assets/images/question-fill.png'),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                  size: _height / 33.83333333333333, //24
                                  text: '36',
                                  typeOfFontWieght: 1,
                                ),
                                SizedBox(width: _width / 75),
                                SmallText(
                                  text: AppLocalizations.of(context)!
                                      .translate("point"),
                                  size: _height / 67.66666666666667, //12
                                  color: textGrayColor,
                                )
                              ],
                            ),
                            SizedBox(
                              height: _height / 81.2, //10
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _height / 73.81818181818182, //11
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: _width / 22.05882352941176), //17
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BigText(
                              size: _height / 67.66666666666667,
                              typeOfFontWieght: 1,
                              text: AppLocalizations.of(context)!
                                  .translate("Transaction history"),
                              color: blackColor,
                            ),
                            SizedBox(width: _width / 125 //3
                                ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EarnPointTransactionHistory(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                  'assets/images/question-fill.png'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _height / 81.2, //6
                      ),
                      transactionHistory.isNotEmpty
                          ? Container(
                              height: _height / 162.4, //20
                              width: _width,
                              color: Color(0xffF8F9FB),
                            )
                          : Container(),
                      transactionHistory.isNotEmpty
                          ? ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 0,
                                  color: containerColor,
                                );
                              },
                              itemCount: transactionHistory.length,
                              itemBuilder: (context, index) {
                                return EarnPointAndMovementWidget(
                                    rightText: "28-12-2019",
                                    centerText: "تسجيل الدخول على التطبيق",
                                    leftText: "100");
                              })
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: _height / 16.24 //50
                                        ),
                                    Image.asset('assets/images/history.png'),
                                    SizedBox(
                                      height: _height / 101.5, //8
                                    ),
                                    SmallText(
                                      size: _height / 67.66666666666667, //12
                                      text: AppLocalizations.of(context)!
                                          .translate("No previous dealings"),
                                      color: blackColor,
                                    )
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _width / 18.75, vertical: _height / 40.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.translate("common questions"),
                    style: TextStyle(
                        fontSize: _height / 67.66666666666667, //12

                        decoration: TextDecoration.underline,
                        color: mainAppColor),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TermsAndConditionsScreen()));
                    },
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate("Terms and Conditions"),
                      style: TextStyle(
                          fontSize: _height / 67.66666666666667, //12
                          decoration: TextDecoration.underline,
                          color: mainAppColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
