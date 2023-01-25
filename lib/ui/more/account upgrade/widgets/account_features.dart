// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/utils/app_colors.dart';

class AccountFeatures extends StatefulWidget {
  String rightText;
  String bottomRightText;
  String leftText;
  bool isTrailImage;
  String? imageUrl;
  AccountFeatures({
    Key? key,
    required this.rightText,
    required this.bottomRightText,
    required this.leftText,
    required this.isTrailImage,
    this.imageUrl,
  }) : super(key: key);

  @override
  State<AccountFeatures> createState() => _AccountFeaturesState();
}

class _AccountFeaturesState extends State<AccountFeatures> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height / 116, //7
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width / 22.05882352941176, //17
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: _width / 1.630434782608696, //230
                    child: SmallText(
                      align: TextAlign.start,
                      text: widget.rightText,
                      size: _height / 67.66666666666667, //12
                      color: blackColor,
                    ),
                  ),
                  Container(
                    // color: mainAppColor,
                    width: _width / 1.25, //300
                    child: SmallText(
                      align: TextAlign.start,
                      text: widget.bottomRightText,
                      size: _height / 81.2, //10
                      color: textGrayColor,
                    ),
                  ),
                ],
              ),
              widget.isTrailImage
                  ? Image.asset(widget.imageUrl!)
                  : SmallText(
                      text: widget.leftText,
                      size: _height / 58,
                      color: blackColor,
                      typeOfFontWieght: 1,
                    )
            ],
          ),
        ),
        SizedBox(
          height: _height / 81.2,
        ),
      ],
    );
  }
}
