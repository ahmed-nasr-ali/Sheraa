// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';

import 'package:sheraa/utils/app_colors.dart';

class RemainingAdsWidget extends StatelessWidget {
  double height;
  double width;
  String imageUrl;
  String upperText;
  String lowerText;
  int number;
  int? dividerTrue;
  RemainingAdsWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.imageUrl,
      required this.upperText,
      required this.lowerText,
      required this.number,
      this.dividerTrue = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height / 45.11111111111111, //18
        ),
        Row(
          children: [
            SizedBox(
              width: width / 25,
            ),
            Container(
              width: width / 12.5, //30
              height: height / 27.06666666666667, //30
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: width / 37.5, //110
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  typeOfFontWieght: 1,
                  size: height / 67.66666666666667, //12
                  color: blackColor,
                  text: AppLocalizations.of(context)!.translate(upperText),
                ),
                SmallText(
                  typeOfFontWieght: 0,
                  size: height / 81.2, //10
                  color: textGrayColor,
                  text: AppLocalizations.of(context)!.translate(lowerText),
                ),
              ],
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmallText(
                  size: height / 67.66666666666667, //12
                  typeOfFontWieght: 1,
                  color: blackColor,
                  text: number.toString(),
                ),
                SizedBox(
                  width: width / 22.05882352941176, //17
                )
              ],
            ))
          ],
        ),
        SizedBox(
          height: height / 62.46153846153846, //13
        ),
        dividerTrue == 0
            ? Divider(
                height: 0,
                color: containerColor,
              )
            : Container(),
      ],
    );
  }
}
