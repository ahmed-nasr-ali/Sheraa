// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/Request%20Buy%20Advertisement/request%20buy%20ad%20frist%20screen/request_buy_ad_frist_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class RequestBuyAd extends StatefulWidget {
  String pageName;
  int adId;
  String adName;
  String adImageUrl;
  String userName;
  String adPrice;
  String userID;
  RequestBuyAd({
    Key? key,
    required this.pageName,
    required this.adId,
    required this.adName,
    required this.adImageUrl,
    required this.userName,
    required this.adPrice,
    required this.userID,
  }) : super(key: key);

  @override
  State<RequestBuyAd> createState() => _RequestBuyAdState();
}

class _RequestBuyAdState extends State<RequestBuyAd> {
  double? _height;

  double? _width;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height! / 81.2,
        ),
        CustomButton(
            enableVerticalMargin: false,
            verticalMargin: _height! / 81.2,
            enableHorizontalMargin: true,
            horizontalMargin: _width! / 23.4375, //16,
            width: _width,
            height: _height! / 18.04444444444444, //35
            btnLbl: AppLocalizations.of(context)!
                .translate("request buy advertisement"),
            onPressedFunction: () {
              if (!unAuthUser(context)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RequestBuyAdfristScreen(
                      adName: widget.adName,
                      adImage: widget.adImageUrl,
                      adId: widget.adId,
                      addUserName: widget.userName,
                      adPrice: widget.adPrice,
                      userId: widget.userID,
                    ),
                  ),
                );
              }
            },
            btnColor: whiteColor,
            btnStyle: TextStyle(color: mainAppColor, fontSize: _height! / 58),
            borderColor: mainAppColor),
        SizedBox(
          height: _height! / 54.13333333333333,
        ),
        Divider(
          height: 0,
          thickness: _height! / 162.4,
          color: Color(0xffF8F9FB),
        ),
        SizedBox(
          height: _height! / 81.2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width! / 23.4375, //16
          ),
          child: SmallText(
            text: AppLocalizations.of(context)!.translate("general Advices"),
            color: blackColor,
            typeOfFontWieght: 1,
            size: _height! / 67.66666666666667, //12
          ),
        ),
        SizedBox(
          height: _height! / 101.5, //8
        ),
        Row(
          children: [
            SizedBox(
              width: _width! / 20.83333333333333, //18
            ),
            Container(
              height: _height! / 135.3333333333333, //6
              width: _width! / 62.5, //6
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: blackColor),
            ),
            SizedBox(
              width: _width! / 53.57142857142857, //7
            ),
            SmallText(
              text: AppLocalizations.of(context)!
                  .translate("Only meet in public"),
              color: blackColor,
              typeOfFontWieght: 0,
              size: _height! / 67.66666666666667, //12
            ),
          ],
        ),
        SizedBox(
          height: _height! / 116, //7
        ),
        Row(
          children: [
            SizedBox(
              width: _width! / 20.83333333333333, //18
            ),
            Container(
              height: _height! / 135.3333333333333, //6
              width: _width! / 62.5, //6
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: blackColor),
            ),
            SizedBox(
              width: _width! / 53.57142857142857, //7
            ),
            SmallText(
              text: AppLocalizations.of(context)!
                  .translate("Do not send money in advance"),
              color: blackColor,
              typeOfFontWieght: 0,
              size: _height! / 67.66666666666667, //12
            ),
          ],
        ),
        SizedBox(
          height: _height! / 116, //7
        ),
        Row(
          children: [
            SizedBox(
              width: _width! / 20.83333333333333, //18
            ),
            Container(
              height: _height! / 135.3333333333333, //6
              width: _width! / 62.5, //6
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: blackColor),
            ),
            SizedBox(
              width: _width! / 53.57142857142857, //7
            ),
            SmallText(
              text: AppLocalizations.of(context)!
                  .translate("Check the product carefully before buying it"),
              color: blackColor,
              typeOfFontWieght: 0,
              size: _height! / 67.66666666666667, //12
            ),
          ],
        ),
        SizedBox(
          height: _height! / 62.46153846153846, //13
        ),
        Divider(
          height: 0,
          thickness: _height! / 162.4,
          color: Color(0xffF8F9FB),
        ),
      ],
    );
  }
}
