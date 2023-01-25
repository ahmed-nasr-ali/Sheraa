// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/utils/app_colors.dart';

class CreateAdSuccessfully extends StatefulWidget {
  const CreateAdSuccessfully({Key? key}) : super(key: key);

  @override
  State<CreateAdSuccessfully> createState() => _CreateAdSuccessfullyState();
}

class _CreateAdSuccessfullyState extends State<CreateAdSuccessfully> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _height / 24.60606060606061, //33
                ),
                Center(
                  child: Image.asset("assets/images/img.png"),
                ),
                SizedBox(
                  height: _height / 67.66666666666667, //12
                ),
                Center(
                  child: SmallText(
                    text: "تم انشاء اعلانك بنجاح", //todo
                    size: _height / 58, //14
                    color: blackColor,
                    typeOfFontWieght: 1,
                  ),
                ),
                SizedBox(
                  height: _height / 67.66666666666667, //12
                ),
                // Center(
                //   child: CustomButton(
                //     width: _width / 1.442307692307692, //260
                //     enableHorizontalMargin: false,
                //     enableVerticalMargin: false,
                //     height: _height / 16.24, //40
                //     btnLbl: "زيادة المشاهدات", //todo
                //     onPressedFunction: () {},
                //     btnColor: mainAppColor,
                //     btnStyle: TextStyle(color: whiteColor),
                //     borderColor: mainAppColor,
                //   ),
                // ),
                // SizedBox(
                //   height: _height / 54.13333333333333, //12
                // ),
                // Center(
                //   child: SmallText(
                //     text: "ذكرني لاحقا", //todo
                //     color: mainAppColor,
                //     size: _height / 67.66666666666667,
                //   ),
                // ),
                // SizedBox(
                //   height: _height / 18.04444444444444, //45
                // )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
