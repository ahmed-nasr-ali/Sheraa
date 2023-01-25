// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class PaymentOperationWidget extends StatelessWidget {
  String rightText;
  String leftText;
  int isDivider;

  PaymentOperationWidget({
    Key? key,
    required this.rightText,
    required this.leftText,
    this.isDivider = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height / 162.4, //5
        ),
        Padding(
          padding: EdgeInsets.only(
              right: UserData.getUSerLang() == "ar"
                  ? _width / 23.4375 //16
                  : _width / 15.625, //24

              left: UserData.getUSerLang() == "ar"
                  ? _width / 15.625 //24
                  : _width / 23.4375 //16,
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _width / 3.409090909090909, //110
                child: SmallText(
                  align: TextAlign.start,
                  text: rightText,
                  size: _height / 67.66666666666667, //12
                  color: blackColor,
                ),
              ),
              Container(
                width: _width / 2.5, //150
                child: SmallText(
                  align: TextAlign.end,
                  text: leftText,
                  size: _height / 67.66666666666667, //12
                  color: textGrayColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height / 81.2, //10
        ),
        isDivider == 0
            ? Divider(
                height: 0,
                endIndent: UserData.getUSerLang() == "ar"
                    ? _width / 20.27027027027027
                    : _width / 30,
                indent: UserData.getUSerLang() == "ar"
                    ? _width / 30
                    : _width / 20.27027027027027,
              )
            : Container()
      ],
    );
  }
}
