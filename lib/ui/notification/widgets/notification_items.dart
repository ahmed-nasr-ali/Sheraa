// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unused_field, must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import '../../../custom_widgets/TextStyle/big_text.dart';
import '../../../custom_widgets/TextStyle/small_text.dart';
import '../../../utils/app_colors.dart';
import '../../../providers/theme_provider.dart';

class NotificationItems extends StatelessWidget {
  final String imgUrl;
  final bool isExist;
  NotificationItems({Key? key, required this.isExist, required this.imgUrl})
      : super(key: key);

  double? _height;
  double? _width;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final now = DateTime.now();
    String formatter = DateFormat('yMd').format(now); // 28/03/2020

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: _height! / 54.13333333333333),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: _width! / 25),
            //15
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              radius: _width! / 25,
              backgroundImage: AssetImage(imgUrl),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallText(
                text: AppLocalizations.of(context)!.translate(
                    "Welcome to buy. Net sell what you want for free"),
                size: _height! / 58, //13
                color: blackColor,
              ),
              SizedBox(
                height: _height! / 154.4,
              ), //5
              SmallText(
                text: formatter,
              ),
            ],
          ),
          isExist
              ? Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            left: UserData.getUSerLang() == "ar"
                                ? _width! / 18.75
                                : 0,
                            right: UserData.getUSerLang() == "ar"
                                ? 0
                                : _width! / 18.75,
                            bottom: _height! / 25.733,
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                                'assets/images/1.0x/menu-dots.png',
                                color: themeProvider.isDarkMode
                                    ? whiteColor
                                    : textGrayColor),
                          )),
                    ],
                  ),
                ) //20
              : Container(),
        ],
      ),
    );
  }
}
