// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/my%20ads/effective%20ads%20screen/increase%20views%20screen/increase%20views%20screen/increase_views_screen.dart';
import 'package:sheraa/ui/more/my%20ads/new/widgets/ad_status_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdStatusAndAdViews extends StatelessWidget {
  int ad_Id;
  int adView;
  var statusNumber;
  AdStatusAndAdViews({
    Key? key,
    required this.ad_Id,
    required this.adView,
    required this.statusNumber,
  }) : super(key: key);

  double? _height;
  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width! / 23.4375 //16
              ),
          child: Column(
            children: [
              Row(
                children: [
                  SmallText(
                    color: blackColor,
                    size: _height! / 67.66666666666667, //12
                    text: adView.toString(),
                    typeOfFontWieght: 1,
                  ),
                  SizedBox(
                    width: _width! / 125, //3
                  ),
                  SmallText(
                    size: _height! / 67.66666666666667, //12
                    color: textGrayColor,
                    text: AppLocalizations.of(context)!
                        .translate("People who saw your ad"),
                  )
                ],
              ),
              SizedBox(
                height: _height! / 270.6666666666667, //20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 2.5,
                        width: _width! / 1.666666666666667, //235
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                          color: containerColor,
                        ),
                      ),
                      Container(
                        height: 2.5,
                        width: (_width! / 1.666666666666667) *
                            (adView > 1000 ? (0.1) : (adView / 1000)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                          color: mainAppColor,
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    enableVerticalMargin: false,
                    enableHorizontalMargin: false,
                    width: _width! / 3.658536585365854, //100
                    height: _height! / 27.06666666666667, //35
                    btnLbl: AppLocalizations.of(context)!
                        .translate("Increase Views"),
                    onPressedFunction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IncreaseViewsScreen(
                                    ad_Id: ad_Id,
                                  )));
                    },
                    btnColor: mainAppColor,
                    btnStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                        fontSize: _height! / 81.2),
                    borderColor: mainAppColor,
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: _height! / 40.6, //20
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        SizedBox(
          height: _height! / 58, //14
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width! / 23.4375 //16,
              ),
          child: Row(
            children: [
              Container(
                width: _height! / 10.82666666666667, //75
                height: _height! / 10.82666666666667, //75
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: (statusNumber / 90),
                      valueColor: AlwaysStoppedAnimation(Color(0xFFFED214)),
                      strokeWidth: _width! / 75,
                      backgroundColor: containerColor,
                    ),
                    Center(
                      child: SmallText(
                        color: blackColor,
                        text: UserData.getUSerLang() == "ar"
                            ? "% " +
                                ((statusNumber / 90) * 100).toStringAsFixed(0)
                            : ((statusNumber / 90) * 100).toStringAsFixed(0) +
                                " " +
                                "%",
                        typeOfFontWieght: 1,
                        size: _height! / 50.75, //16
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: _width! / 22.05882352941176, //17
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SmallText(
                        size: _height! / 67.66666666666667, //12
                        color: blackColor,
                        typeOfFontWieght: 1,
                        text: AppLocalizations.of(context)!
                            .translate("Ad status"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdStatusScreen()));
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: _width! / 75),
                          child: Image.asset("assets/images/question-fill.png"),
                        ),
                      )
                    ],
                  ),
                  SmallText(
                    size: _height! / 81.2,
                    color: textGrayColor,
                    text: AppLocalizations.of(context)!.translate("Quality"),
                  ),
                  SmallText(
                    size: _height! / 81.2,
                    color: textGrayColor,
                    text: AppLocalizations.of(context)!
                        .translate("Get 100% and get more views"),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
