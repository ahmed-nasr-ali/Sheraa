// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class RateAndFollowes extends StatelessWidget {
  final Function fristTap;
  String fristText;
  int fristNo;

  final Function secondTap;
  String secondText;
  int secondNo;

  final Function thirdTap;
  String thirdText;
  int thirdNo;

  final Function fourthTap;
  String fourthText;
  int fourthNo;

  RateAndFollowes({
    Key? key,
    required this.fristTap,
    required this.fristText,
    required this.fristNo,
    required this.secondTap,
    required this.secondText,
    required this.secondNo,
    required this.thirdTap,
    required this.thirdText,
    required this.thirdNo,
    required this.fourthTap,
    required this.fourthText,
    required this.fourthNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height / 67.66666666666667, //12
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width / 10.71428571428571, //35
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  fristTap();
                },
                child: Column(
                  children: [
                    Container(
                      width: _width / 7.5, //50
                      child: SmallText(
                        align: TextAlign.center,
                        text: fristNo.toString(),
                        color: blackColor,
                        typeOfFontWieght: 1,
                        size: _height / 50.75, //16
                      ),
                    ),
                    SmallText(
                      align: TextAlign.center,
                      text: AppLocalizations.of(context)!.translate(fristText),
                      color: textGrayColor,
                      typeOfFontWieght: 0,
                      size: _height / 81.2, //16
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  secondTap();
                },
                child: Column(
                  children: [
                    Container(
                      width: _width / 7.5, //50
                      child: SmallText(
                        align: TextAlign.center,
                        text: secondNo.toString(),
                        color: blackColor,
                        typeOfFontWieght: 1,
                        size: _height / 50.75, //16
                      ),
                    ),
                    SmallText(
                      align: TextAlign.center,
                      text: AppLocalizations.of(context)!.translate(secondText),
                      color: textGrayColor,
                      typeOfFontWieght: 0,
                      size: _height / 81.2, //16
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  thirdTap();
                },
                child: Column(
                  children: [
                    Container(
                      width: _width / 7.5, //50
                      child: SmallText(
                        align: TextAlign.center,
                        text: "${thirdNo.toString()}",
                        color: blackColor,
                        typeOfFontWieght: 1,
                        size: _height / 50.75, //16
                      ),
                    ),
                    SmallText(
                      align: TextAlign.center,
                      text: AppLocalizations.of(context)!.translate(thirdText),
                      color: textGrayColor,
                      typeOfFontWieght: 0,
                      size: _height / 81.2, //16
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  fourthTap();
                },
                child: Column(
                  children: [
                    Container(
                      width: _width / 7.5, //50
                      child: SmallText(
                        align: TextAlign.center,
                        text: "${fourthNo.toString()}",
                        color: blackColor,
                        typeOfFontWieght: 1,
                        size: _height / 50.75, //16
                      ),
                    ),
                    SmallText(
                      align: TextAlign.center,
                      text: AppLocalizations.of(context)!.translate(fourthText),
                      color: textGrayColor,
                      typeOfFontWieght: 0,
                      size: _height / 81.2, //16
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height / 54.13333333333333, //15
        ),
        Divider(
          height: 0,
          color: secondryMainColor,
          thickness: _height / 162.4,
        ),
      ],
    );
  }
}
