// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/account%20upgrade/widgets/account_features.dart';
import 'package:sheraa/ui/more/ad%20pormotion/add%20promoted%20ad/add_promoted_ad.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdPormotionScreen extends StatefulWidget {
  const AdPormotionScreen({Key? key}) : super(key: key);

  @override
  State<AdPormotionScreen> createState() => _AdPormotionScreenState();
}

class _AdPormotionScreenState extends State<AdPormotionScreen> {
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
                text: AppLocalizations.of(context)!.translate("ad_pormotion")),
          ),
          body: ListView(
            children: [
              Column(
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
                    height: _height / 54.13333333333333, //15
                  ),
                  Container(
                    width: _width,
                    margin: EdgeInsets.symmetric(
                      horizontal: _width / 20.83333333333333, //18
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(_height / 81.2),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: _height / 81.2, //10
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: _width / 34.09090909090909, //11
                            ),
                            Container(
                              width: _width / 5.28169014084507, //71
                              height: _height / 11.43661971830986, //71
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/white-car.png"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: _width / 37.5, //10
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: AppLocalizations.of(context)!
                                      .translate("Electronics Offers"),
                                  size: _height / 58,
                                  color: blackColor,
                                  typeOfFontWieght: 1,
                                ),
                                SmallText(
                                  color: blackColor,
                                  size: _height / 90.22222222222222, //9
                                  text: AppLocalizations.of(context)!.translate(
                                      "Take advantage of the best electronics offers"),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                CustomButton(
                                    enableVerticalMargin: false,
                                    enableHorizontalMargin: false,
                                    boderRaduis: _height / 81.2,
                                    enableCircleBorder: false,
                                    horizontalMargin:
                                        _width / 3.260869565217391, //115
                                    width: UserData.getUSerLang() == "ar"
                                        ? _width / 5.357142857142857
                                        : _width / 4.6875, //70 , //80
                                    height: _height / 32.48, //25
                                    btnLbl: AppLocalizations.of(context)!
                                        .translate("Shoping now"),
                                    onPressedFunction: () {},
                                    btnColor: mainAppColor,
                                    btnStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: whiteColor,
                                        fontSize: _height / 101.5),
                                    borderColor: mainAppColor),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SmallText(
                              text: AppLocalizations.of(context)!
                                  .translate("Promoter Ad"),
                              size: _height / 90.22222222222222, //9
                              color: textGrayColor,
                            ),
                            SizedBox(
                              width: _width / 53.57142857142857,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _height / 162.4,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height / 162.4,
                  ),
                  Center(
                    child: SmallText(
                      text: AppLocalizations.of(context)!
                          .translate("promoter ad template"),
                      size: _height / 81.2,
                      color: textGrayColor,
                    ),
                  ),
                  SizedBox(
                    height: _height / 45.11111111111111, //18
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _width / 23.4375, //16
                    ),
                    child: SmallText(
                      text: AppLocalizations.of(context)!
                          .translate("Account Features"),
                      color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height / 58, //14
                    ),
                  ),
                  SizedBox(
                    height: _height / 81.2, //10
                  ),
                  Divider(
                    height: 0,
                    color: containerColor,
                  ),
                  SizedBox(
                    height: _height / 81.2, //81.2
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return AccountFeatures(
                        isTrailImage: false,
                        rightText: "اعلانات مميزة",
                        bottomRightText:
                            "يظهر الإعلان المروج بعد كل 10 إعلانات في قائمة الإعلانات لحميع الأقسام",
                        leftText: "5",
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        color: containerColor,
                      );
                    },
                    itemCount: 8,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: _height / 32.48 //25,
                            ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          enableVerticalMargin: false,
                          enableHorizontalMargin: false,
                          horizontalMargin: _width / 12.5, //30
                          width: _width / 1.19047619047619, //315
                          height: _height / 18.04444444444444, //35
                          btnLbl: AppLocalizations.of(context)!
                              .translate("Add a Promoted Ad"),
                          onPressedFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddPromotedAdScreen()));
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
