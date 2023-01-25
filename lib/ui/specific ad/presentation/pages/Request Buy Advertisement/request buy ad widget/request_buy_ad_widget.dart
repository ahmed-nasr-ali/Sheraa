// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/utils/app_colors.dart';

class RequestBuyAdWidget extends StatelessWidget {
  Color containerColor;
  String startText;
  String endText;
  RequestBuyAdWidget({
    Key? key,
    required this.containerColor,
    required this.startText,
    required this.endText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _width / 25),
      width: _width,
      height: _height / 27.06666666666667, //30
      color: containerColor,
      child: Row(
        children: [
          SizedBox(
            width: _width / 5.357142857142857, //70
          ),
          Container(
            width: _width / 3.75, //100
            child: SmallText(
                align: TextAlign.start,
                size: _height / 67.66666666666667, //12
                color: blackColor,
                text: startText),
          ),
          SizedBox(width: _width / 7.5),
          Container(
            width: _width / 3.75, //100
            child: SmallText(
                align: TextAlign.start,
                size: _height / 67.66666666666667, //12
                color: textGrayColor,
                text: endText),
          ),
        ],
      ),
    );
  }
}
