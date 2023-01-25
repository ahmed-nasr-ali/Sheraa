// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/my%20ads/delete%20ad%20bottomsheet/delete_ad_screen.dart';
import 'package:sheraa/ui/more/my%20ads/effective%20ads%20screen/increase%20views%20screen/increase%20views%20screen/increase_views_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdViewsAndStatistics extends StatefulWidget {
  int adID;
  String pageName;
  String adViews;
  AdViewsAndStatistics({
    Key? key,
    required this.adID,
    required this.pageName,
    required this.adViews,
  }) : super(key: key);

  @override
  State<AdViewsAndStatistics> createState() => _AdViewsAndStatisticsState();
}

class _AdViewsAndStatisticsState extends State<AdViewsAndStatistics> {
  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: _height! / 81.2,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: _width! / 23.4375, //16
          ),
          width: _width,
          height: _height! / 32.48, //25
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_height! / 162.4), //5
            color: Color(0xff3BBEEF).withOpacity(0.11),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.visibility,
                color: Color(0xff079FD8),
                size: _height! / 54.13333333333333, //15
              ),
              SmallText(
                text: " " +
                    // _adInformations["views"].toString()
                    widget.adViews +
                    " "
                        "${AppLocalizations.of(context)!.translate("People_have_seen_this_ad_till_now")}",
                size: _height! / 81.2,
                color: Color(0xff079FD8),
              )
            ],
          ),
        ),
        SizedBox(
          height: widget.pageName == "moreInformation"
              ? _height! / 54.13333333333333
              : _height! / 116, //7
        ),
        widget.pageName == "moreInformation"
            ? buildAdStatisticsPart(_height!, _width!)
            : Container(),
      ],
    );
  }

  Widget buildAdStatisticsPart(double _height, double _width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width / 3.125),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  print("edit");
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/magicpen.png"),
                    SmallText(
                      size: _height / 81.2, //10
                      color: textGrayColor,
                      text: AppLocalizations.of(context)!.translate("edit"),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: DeleteAdScreen(
                            adId: widget.adID,
                            onPressedFunction: () {},
                          ),
                        );
                      });
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/close-circle.png"),
                    SmallText(
                      size: _height / 81.2, //10
                      color: textGrayColor,
                      text: AppLocalizations.of(context)!.translate("Remove"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height / 62.46153846153846, //13
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        SizedBox(
          height: _height / 116, //7
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width / 23.4375,
          ),
          child: SmallText(
            typeOfFontWieght: 1,
            color: blackColor,
            size: _height / 67.66666666666667, //12
            text: AppLocalizations.of(context)!.translate("statistics"),
          ),
        ),
        SizedBox(
          height: _height / 62.46153846153846, //13
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width / 26.78571428571429, //14
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Statisticswidget(number: "1.988", text: "views"),
              Statisticswidget(number: "23", text: "calls"),
              Statisticswidget(number: "22", text: "whatsApp"),
              Statisticswidget(number: "1", text: "messages")
            ],
          ),
        ),
        SizedBox(
          height: _height / 47.76470588235294, //17
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                enableVerticalMargin: false,
                enableHorizontalMargin: false,
                width: _width / 1.19047619047619, //315
                height: _height / 18.04444444444444, //45
                btnLbl:
                    AppLocalizations.of(context)!.translate("Show more stats"),
                onPressedFunction: () {},
                btnColor: whiteColor,
                btnStyle: TextStyle(
                  color: mainAppColor,
                  fontSize: _height / 67.66666666666667,
                ),
                borderColor: mainAppColor),
          ],
        ),
        SizedBox(
          height: _height / 36.90909090909091, //22
        ),
        Divider(
          height: 0,
          color: secondryMainColor,
          thickness: _height / 135.3333333333333, //6
        ),
        SizedBox(
          height: _height / 54.13333333333333, //15
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width / 23.4375 //16
                  ),
              child: Row(
                children: [
                  SmallText(
                    color: blackColor,
                    size: _height / 67.66666666666667, //12
                    text: widget.adViews,
                    typeOfFontWieght: 1,
                  ),
                  SizedBox(
                    width: _width / 125, //3
                  ),
                  SmallText(
                    size: _height / 67.66666666666667, //12
                    color: textGrayColor,
                    text: AppLocalizations.of(context)!
                        .translate("People who saw your ad"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _height / 40.6, //20
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width / 23.4375 //16
                  ),
              child: Stack(
                children: [
                  Container(
                    height: _height / 162.4, //5
                    width: _width, //235
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.5),
                      color: containerColor,
                    ),
                  ),
                  Container(
                    height: _height / 162.4, //5,
                    width: (_width) * (int.parse(widget.adViews) / 1000),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.5),
                      color: mainAppColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _height / 32.48, //25
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    enableVerticalMargin: false,
                    enableHorizontalMargin: false,
                    width: _width / 1.19047619047619, //315
                    height: _height / 18.04444444444444, //45
                    btnLbl: AppLocalizations.of(context)!
                        .translate("Increase Views"),
                    onPressedFunction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IncreaseViewsScreen(
                                    ad_Id: widget.adID,
                                  )));
                    },
                    btnColor: mainAppColor,
                    btnStyle: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: _height / 67.66666666666667,
                    ),
                    borderColor: mainAppColor),
              ],
            ),
            SizedBox(
              height: _height / 81.2, //10
            ),
            Center(
              child: SmallText(
                size: _height / 67.66666666666667,
                color: textGrayColor,
                text: AppLocalizations.of(context)!.translate(
                    "Make your ad a vip or highlight your ad for more views"),
              ),
            ),
            SizedBox(
              height: _height / 54.13333333333333, //15
            ),
            Divider(
              height: 0,
              color: secondryMainColor,
              thickness: _height / 135.3333333333333, //6
            ),
            SizedBox(
              height: _height / 67.66666666666667, //12
            )
          ],
        ),
      ],
    );
  }
}

class Statisticswidget extends StatefulWidget {
  String number;
  String text;
  Statisticswidget({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  @override
  State<Statisticswidget> createState() => _StatisticswidgetState();
}

class _StatisticswidgetState extends State<Statisticswidget> {
  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width! / 4.62962962962963, //81
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(
          _height! / 81.2,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: _height! / 81.2,
          ),
          Container(
            width: _width! / 4.62962962962963, //81

            child: SmallText(
              text: widget.number,
              size: _height! / 58,
              color: blackColor,
              typeOfFontWieght: 1,
            ),
          ),
          SmallText(
            text: AppLocalizations.of(context)!.translate(widget.text),
            size: _height! / 81.2,
            color: textGrayColor,
            typeOfFontWieght: 0,
          ),
          SizedBox(
            height: _height! / 47.76470588235294, //17
          ),
        ],
      ),
    );
  }
}
