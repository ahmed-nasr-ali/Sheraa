// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class RateDetails extends StatelessWidget {
  int rateNumber;
  num starNumber;
  RateDetails({
    Key? key,
    required this.rateNumber,
    required this.starNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: _height / 81.2, //todo 10
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width / 20.83333333333333,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallText(
                  size: _height / 58,
                  color: blackColor,
                  typeOfFontWieght: 1,
                  text: AppLocalizations.of(context)!.translate("rateing")),
              SmallText(
                  size: _height / 67.66666666666667, //12
                  color: textGrayColor,
                  typeOfFontWieght: 0,
                  text:
                      "$rateNumber ${AppLocalizations.of(context)!.translate("rateing")}"),
            ],
          ),
        ),
        SizedBox(
          height: _height / 50.75, //16
        ),
        Row(
          children: [
            SizedBox(
              width: _width / 23.4375, //16
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: _height / 40.6, //20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: _width / 4.166666666666667, //90
                    child: SmallText(
                        align: TextAlign.start,
                        size: _height / 36.90909090909091, //22
                        color: blackColor,
                        typeOfFontWieght: 1,
                        text: starNumber.toString()),
                  ),
                  Container(
                    width: _width / 4.166666666666667, //90
                    height: _height / 47.76470588235294,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/ratingempty.png"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: _width / 26.78571428571429, //14
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                    align: TextAlign.start,
                    size: _height / 67.66666666666667, //12
                    color: textGrayColor,
                    // Color(0xFF4EDA4E),
                    typeOfFontWieght: 0,
                    text: AppLocalizations.of(context)!.translate("Postive")),
                SizedBox(
                  height: _height / _height, //2.5
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: _width / 1.875, //190
                          height: _height / 162.4, //5
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(_height / 162.4),
                            color: Color(0xffF8F9FB),
                          ),
                        ),
                        // Container(
                        //   width: (_width / 1.875) *
                        //       0.8, //todo this number comes from api (0.8) //190
                        //   height: _height / 162.4, //5
                        //   decoration: BoxDecoration(
                        //     color: Color(0xFF4EDA4E),
                        //     borderRadius:
                        //         BorderRadius.circular(_height / 162.4),
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      width: _width / 37.5, //5
                    ),
                    SmallText(
                        text: "0 %") //todo this number comes from api (80 %)
                  ],
                ),

                ///=============================================

                SmallText(
                    align: TextAlign.start,
                    size: _height / 67.66666666666667, //12
                    color: textGrayColor,
                    //  Color(0xFFF30333),
                    typeOfFontWieght: 0,
                    text: AppLocalizations.of(context)!.translate("negative")),

                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: _width / 1.875, //190
                          height: _height / 162.4, //5
                          decoration: BoxDecoration(
                            color: Color(0xffF8F9FB),
                            borderRadius:
                                BorderRadius.circular(_height / 162.4),
                          ),
                        ),
                        Container(
                          width: (_width / 1.875) *
                              0.65, //todo this number comes from api (0.65) //190
                          height: _height / 162.4, //5
                          decoration: BoxDecoration(
                            color: Color(0xffF8F9FB),
                            //  Color(0xFFF30333),
                            borderRadius:
                                BorderRadius.circular(_height / 162.4),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: _width / 37.5, //5
                    ),
                    SmallText(
                        text: "0 %") //todo this number comes from api (65)
                  ],
                )
              ],
            ),
            SizedBox(
              width: _width / 23.4375, //16
            ),
          ],
        ),
        SizedBox(
          height: _height / 27.06666666666667, //30
        ),
        Container(
          height: _height / 162.4, //20
          width: _width,
          color: Color(0xffF8F9FB),
        ),
      ],
    );
  }
}
