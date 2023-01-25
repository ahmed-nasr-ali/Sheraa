// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class RateBottomSheet extends StatefulWidget {
  const RateBottomSheet({Key? key}) : super(key: key);

  @override
  State<RateBottomSheet> createState() => _RateBottomSheetState();
}

class _RateBottomSheetState extends State<RateBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Expanded(child: Container()),
        Container(
          height: _height / 162.4, //5
          width: _width / 9.375, //40
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_height / 162.4 // 5
                ),
            color: Color(0xFFEFEFEF),
          ),
        ),
        SizedBox(
          height: _height / 81.2, //10
        ),
        Container(
          width: _width,
          child: Container(
            padding: EdgeInsets.only(
              left: _width / 18.75, //20
              right: _width / 18.75, //20
              top: _height / 40.6, //20
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_height / 32.48), //25
                topRight: Radius.circular(_height / 32.48), //25
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: _height / 32.48,
                ),
                Image.asset("assets/images/rate.png"),
                SizedBox(
                  height: _height / 40.6, //20
                ),
                SmallText(
                    size: _height / 58,
                    typeOfFontWieght: 1,
                    color: blackColor,
                    text: AppLocalizations.of(context)!.translate(
                        "Thank you for rating to help us fight fraud")),
                SizedBox(
                  height: _height / 20.3, //40
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                        enableVerticalMargin: false,
                        enableHorizontalMargin: false,
                        width: _width / 3.260869565217391, //115
                        height: _height / 18.04444444444444, //35
                        btnLbl: AppLocalizations.of(context)!.translate("ok"),
                        onPressedFunction: () {
                          Navigator.pop(context);
                          Navigator.pop(context);

                          Navigator.pop(context);

                          Navigator.pop(context);
                        },
                        btnColor: whiteColor,
                        btnStyle: TextStyle(
                          color: mainAppColor,
                          fontSize: _height / 58,
                        ),
                        borderColor: mainAppColor),
                    SizedBox(
                      width: _width / 53.57142857142857, //7
                    ),
                    CustomButton(
                        enableVerticalMargin: false,
                        enableHorizontalMargin: false,
                        width: _width / 3.260869565217391, //115
                        height: _height / 18.04444444444444, //35
                        btnLbl:
                            AppLocalizations.of(context)!.translate("cancel"),
                        onPressedFunction: () {
                          Navigator.pop(context);
                        },
                        btnColor: mainAppColor,
                        btnStyle: TextStyle(
                          color: whiteColor,
                          fontSize: _height / 58,
                        ),
                        borderColor: mainAppColor),
                  ],
                ),
                SizedBox(
                  height: _height / 22.55555555555556, //36
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
