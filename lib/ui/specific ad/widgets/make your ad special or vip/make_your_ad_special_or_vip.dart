// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class MakeYourAdSpecialOrVip extends StatelessWidget {
  String pageName;
  MakeYourAdSpecialOrVip({
    Key? key,
    required this.pageName,
  }) : super(key: key);
  double? _height;

  double? _width;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return pageName == "MyAd"
        ? Column(
            children: [
              SizedBox(
                height: _height! / 67.66666666666667, //12
              ),
              Container(
                height: _height! / 14.24561403508772, //57
                width: _width,
                color: secondryMainColor,
                child: Row(
                  children: [
                    SizedBox(
                      width: _width! / 18.75, //20
                    ),
                    Image.asset(
                      "assets/images/medal_star_blue.png",
                      color: Color(0xffFED214),
                    ),
                    SizedBox(
                      width: _width! / 93.75,
                    ),
                    Image.asset(
                      "assets/images/medal_star_blue.png",
                    ),
                    SizedBox(
                      width: _width! / 75,
                    ),
                    SmallText(
                      text: AppLocalizations.of(context)!.translate(
                          "Make your ad VIP and distinguish your ad for more views"),
                      color: blackColor,
                      typeOfFontWieght: 0,
                      size: UserData.getUSerLang() == "ar"
                          ? _height! / 67.66666666666667
                          : _height! / 77.33333333333333, //10.5
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          size: _height! / 67.66666666666667,
                          color: textGrayColor,
                        ),
                        SizedBox(
                          width: UserData.getUSerLang() == "ar"
                              ? _width! / 20.83333333333333 //18
                              : _width! / 75, //5
                        )
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: _height! / 54.13333333333333, //12
              ),
              Divider(
                height: 0,
                thickness: _height! / 162.4,
                color: Color(0xffF8F9FB),
              )
            ],
          )
        : Container();
  }
}
