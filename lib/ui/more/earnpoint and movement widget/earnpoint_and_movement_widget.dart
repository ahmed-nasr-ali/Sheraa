// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class EarnPointAndMovementWidget extends StatefulWidget {
  String rightText;
  String centerText;
  String leftText;
  EarnPointAndMovementWidget({
    Key? key,
    required this.rightText,
    required this.centerText,
    required this.leftText,
  }) : super(key: key);

  @override
  State<EarnPointAndMovementWidget> createState() =>
      _EarnPointAndMovementWidgetState();
}

class _EarnPointAndMovementWidgetState
    extends State<EarnPointAndMovementWidget> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: _height / 81.2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width / 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _width / 5.769230769230769, //65
                child: SmallText(
                  align: TextAlign.start,
                  size: _height / 67.66666666666667, //12
                  text: widget.rightText,
                  color: blackColor,
                ),
              ),
              Container(
                width: _width / 2.678571428571429, //140
                child: SmallText(
                  align: TextAlign.start,
                  size: _height / 67.66666666666667, //12
                  text: widget.centerText,
                  color: blackColor,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: _width / 12.5, //20
                    child: SmallText(
                      size: _height / 58, //14
                      typeOfFontWieght: 1,
                      color: blackColor,
                      text: widget.leftText,
                    ),
                  ),
                  Container(
                    width: _width / 12.5, //140
                    child: SmallText(
                      align: TextAlign.center,
                      size: _height / 67.666667, //12
                      text: AppLocalizations.of(context)!.translate("point"),
                      color: blackColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: _height / 81.2,
        )
      ],
    );
  }
}
