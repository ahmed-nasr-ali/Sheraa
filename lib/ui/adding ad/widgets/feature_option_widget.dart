// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/utils/app_colors.dart';

class FeatureOptionWidget extends StatelessWidget {
  String imgUrl;
  String optionText;
  bool isSelect;

  FeatureOptionWidget({
    Key? key,
    required this.imgUrl,
    required this.optionText,
    required this.isSelect,
  }) : super(key: key);

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
          height: _height! / 54.13333333333333, //12
        ),
        Row(
          children: [
            SizedBox(
              width: _width! / 25, //15
            ),
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(imgUrl),
            ),
            SizedBox(
              width: _width! / 37.5,
            ),
            SmallText(
              text: optionText,
              color: blackColor,
              size: _height! / 58, //14
              typeOfFontWieght: isSelect ? 1 : 0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isSelect
                      ? Image.asset(
                          "assets/images/checkbox.png",
                          color: mainAppColor,
                        )
                      : Image.asset("assets/images/check.png"),
                ],
              ),
            ),
            SizedBox(
              width: _width! / 18.75,
            ),
          ],
        ),
        SizedBox(
          height: _height! / 54.13333333333333, //12
        ),
      ],
    );
  }
}
