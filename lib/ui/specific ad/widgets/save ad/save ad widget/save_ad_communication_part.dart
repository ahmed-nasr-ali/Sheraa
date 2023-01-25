// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/utils/app_colors.dart';

class SaveAdCommunicationPart extends StatelessWidget {
  String userPhoneNumber;
  SaveAdCommunicationPart({
    Key? key,
    required this.userPhoneNumber,
  }) : super(key: key);

  double? _height;
  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: _height! / 81.2,
        ),
        Row(
          children: [
            SizedBox(
              width: _width! / 15,
            ),
            Image.asset("assets/images/whatsapp.png"),
            SizedBox(
              width: _width! / 37.5, //10
            ),
            SmallText(
              text: userPhoneNumber.contains("+")
                  ? userPhoneNumber.split("+")[1]
                  : userPhoneNumber,
              size: _height! / 67.66666666666667,
              typeOfFontWieght: 1,
              color: blackColor,
            )
          ],
        ),
        SizedBox(
          height: _height! / 40.6,
        )
      ],
    );
  }
}
