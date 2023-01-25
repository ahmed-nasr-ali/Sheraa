// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';

import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/widgets/row3item.dart';
import 'package:sheraa/utils/app_colors.dart';

class SettingNotifications extends StatefulWidget {
  const SettingNotifications({Key? key}) : super(key: key);

  @override
  State<SettingNotifications> createState() => _SettingNotificationsState();
}

class _SettingNotificationsState extends State<SettingNotifications> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
        child: PageContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset("assets/images/arrow_simple_chock.png")),
          title: SmallText(
              color: blackColor,
              size: _height / 50.75, //16
              typeOfFontWieght: 1,
              text: AppLocalizations.of(context)!.translate("Notifications")),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: _height / 162.4, //5
                ),
                Divider(
                  height: 0,
                  color: containerColor,
                ),
                Container(
                  width: _width,
                  color: accentColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: _height / 81.2,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: _width / 23.4375, //16
                        ),
                        child: SmallText(
                          text: AppLocalizations.of(context)!
                              .translate("Notifications about my account"),
                          size: _height / 58,
                          color: blackColor,
                          typeOfFontWieght: 1,
                        ),
                      ),
                      SizedBox(
                        height: _height / 81.2,
                      ),
                    ],
                  ),
                ),
                Row3Item(
                  aboveHeight: _height / 54.13333333333333, //15,
                  fristWidthSpacing: _width / 23.4375,
                  myFristWidget: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  secondWidthSpacing: _width / 37.5,
                  mySecondWidget: SmallText(
                    text: AppLocalizations.of(context)!.translate(
                      "Other users' reactions to my account",
                    ),
                    size: _height / 67.66666666666667, //12
                    color: blackColor,
                  ),
                  myLastWidget: Container(
                    width: _width / 15,
                    height: _height / 50.75, //16
                    child: Switch.adaptive(
                      activeColor: mainAppColor,
                      splashRadius: 0,
                      value: (true),
                      onChanged: (value) {},
                    ),
                  ),
                  lastWidthSpacing: _width / 20.83333333333333, //18,
                  blowHeight: _height / 81.2, //10
                ),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  endIndent: MediaQuery.of(context).size.width / 20, //18
                  indent: MediaQuery.of(context).size.width / 18, //18
                ),
                Row3Item(
                  aboveHeight: _height / 54.13333333333333, //15,
                  fristWidthSpacing: _width / 23.4375,
                  myFristWidget: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/info.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  secondWidthSpacing: _width / 37.5,
                  mySecondWidget: SmallText(
                    text: AppLocalizations.of(context)!.translate(
                      "Information and tips to improve my account",
                    ),
                    size: _height / 67.66666666666667, //12
                    color: blackColor,
                  ),
                  myLastWidget: Container(
                    width: _width / 15,
                    height: _height / 50.75, //16
                    child: Switch.adaptive(
                      activeColor: mainAppColor,
                      splashRadius: 0,
                      value: (true),
                      onChanged: (value) {},
                    ),
                  ),
                  lastWidthSpacing: _width / 20.83333333333333, //18,
                  blowHeight: _height / 81.2, //10
                ),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  endIndent: MediaQuery.of(context).size.width / 20, //18
                  indent: MediaQuery.of(context).size.width / 18, //18
                ),
                Row3Item(
                  aboveHeight: _height / 54.13333333333333, //15,
                  fristWidthSpacing: _width / 23.4375,
                  myFristWidget: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/people.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  secondWidthSpacing: _width / 37.5,
                  mySecondWidget: SmallText(
                    text: AppLocalizations.of(context)!.translate(
                      "General information about services I can activate",
                    ),
                    size: _height / 67.66666666666667, //12
                    color: blackColor,
                  ),
                  myLastWidget: Container(
                    width: _width / 15,
                    height: _height / 50.75, //16
                    child: Switch.adaptive(
                      activeColor: mainAppColor,
                      splashRadius: 0,
                      value: (true),
                      onChanged: (value) {},
                    ),
                  ),
                  lastWidthSpacing: _width / 20.83333333333333, //18,
                  blowHeight: _height / 81.2, //10
                ),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  endIndent: MediaQuery.of(context).size.width / 20, //18
                  indent: MediaQuery.of(context).size.width / 18, //18
                ),
                Row3Item(
                  aboveHeight: _height / 54.13333333333333, //15,
                  fristWidthSpacing: _width / 23.4375,
                  myFristWidget: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/diamonds.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  secondWidthSpacing: _width / 37.5,
                  mySecondWidget: SmallText(
                    text: AppLocalizations.of(context)!.translate(
                      "Information about ads that interest me",
                    ),
                    size: _height / 67.66666666666667, //12
                    color: blackColor,
                  ),
                  myLastWidget: Container(
                    width: _width / 15,
                    height: _height / 50.75, //16
                    child: Switch.adaptive(
                      activeColor: mainAppColor,
                      splashRadius: 0,
                      value: (true),
                      onChanged: (value) {},
                    ),
                  ),
                  lastWidthSpacing: _width / 20.83333333333333, //18,
                  blowHeight: _height / 81.2, //10
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
