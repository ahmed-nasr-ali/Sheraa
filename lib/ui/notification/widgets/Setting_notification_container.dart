// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';

import '../../../custom_widgets/TextStyle/big_text.dart';
import '../../../utils/app_colors.dart';
import '../../../providers/theme_provider.dart';

class SettingNnotificationContainer extends StatelessWidget {
  final String imgUrl;
  final String title;
  final Widget widget;
  const SettingNnotificationContainer({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 15.44, //50

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                right: UserData.getUSerLang() == "ar"
                    ? MediaQuery.of(context).size.width / 24
                    : MediaQuery.of(context).size.width / 72,
                left: MediaQuery.of(context).size.width / 72), //15,5
            //15,15
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.height / 77.2,
              backgroundColor:
                  themeProvider.isDarkMode ? Colors.grey[850] : whiteColor,
              backgroundImage: AssetImage(imgUrl),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2, //300
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 36), //10
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: title,
                    size: MediaQuery.of(context).size.height / 64.333, //12
                    align: TextAlign.center,
                    typeOfFontWieght: 0,
                    fontWeight: FontWeight.normal,
                  ),
                  Container(child: widget),
                ]),
          ),
        ],
      ),
    );
  }
}
