// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/utils/app_colors.dart';

class CategoryNameAndItsAds extends StatelessWidget {
  final Function onPressedFunction;
  String rightText;
  String leftText;
  CategoryNameAndItsAds({
    Key? key,
    required this.onPressedFunction,
    required this.rightText,
    required this.leftText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 23.4375,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(
            text: rightText,
            typeOfFontWieght: 1,
            size: MediaQuery.of(context).size.height / 48.25, //16
            color: blackColor,
          ),
          GestureDetector(
            onTap: () {
              onPressedFunction();
            },
            child: SmallText(
              text: leftText,
              color: mainAppColor,
              size: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
