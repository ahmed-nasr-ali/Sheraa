// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class AddAdsItem extends StatelessWidget {
  String rightText;
  String leftText;
  AddAdsItem({
    Key? key,
    required this.rightText,
    required this.leftText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: _height / 62.46153846153846, //13
        ),
        Row(
          children: [
            SizedBox(
              width: _width / 20.83333333333333, //18
            ),
            SmallText(
              text: rightText,
              color: textGrayColor,
              size: _height / 58, //14
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: UserData.getUSerLang() == "ar"
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    width: _width / 1.785714285714286, //210
                    // color: mainAppColor,
                    child: SmallText(
                      text: leftText,
                      color: blackColor,
                      size: _height / 58, //14
                    ),
                  ),
                  SizedBox(
                    width: _width / 25, //15
                  ),
                  Image.asset("assets/images/check.png"),
                  SizedBox(
                    width: _width / 18.75, //20
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height / 62.46153846153846, //13
        ),
      ],
    );
  }
}
