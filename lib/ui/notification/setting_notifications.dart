// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable
import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import '../../custom_widgets/TextStyle/big_text.dart';
import '../../utils/app_colors.dart';
import 'widgets/Setting_notification_container.dart';

class SettingForAlerties extends StatelessWidget {
  const SettingForAlerties({Key? key}) : super(key: key);

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
                  text:
                      AppLocalizations.of(context)!.translate("Notifications")),
            ),
            body: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 154.4), //5
                Divider(
                  height: 0,
                  thickness: 0,
                  color: accentColor,
                ),
                Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height / 15.44, //50
                  color: accentColor,
                  child: Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 24), //15
                    alignment: Alignment.centerRight,
                    child: BigText(
                        text: AppLocalizations.of(context)!
                            .translate("Notifcations about my account"),
                        typeOfFontWieght: 1,
                        size: MediaQuery.of(context).size.height / 55.143), //14
                  ),
                ),
                SettingNnotificationContainer(
                  imgUrl: 'assets/images/profile.png',
                  title: AppLocalizations.of(context)!
                      .translate("Other users' reactions to my account"),
                  widget: Switch.adaptive(
                    activeColor: mainAppColor,
                    splashRadius: 0,
                    value: (true),
                    onChanged: (value) {},
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  endIndent: MediaQuery.of(context).size.width / 20, //18
                  indent: MediaQuery.of(context).size.width / 18, //18
                ),
                SettingNnotificationContainer(
                    imgUrl: 'assets/images/info.png',
                    title: AppLocalizations.of(context)!.translate(
                        "Information and tips to improve my account"),
                    widget: Switch.adaptive(
                        activeColor: mainAppColor,
                        splashRadius: 0,
                        value: (true),
                        onChanged: (value) {})),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  endIndent: MediaQuery.of(context).size.width / 20, //18
                  indent: MediaQuery.of(context).size.width / 18, //18
                ),
                SettingNnotificationContainer(
                    imgUrl: 'assets/images/people.png',
                    title: AppLocalizations.of(context)!.translate(
                        "General information about services I can activate"),
                    widget: Switch.adaptive(
                        activeColor: mainAppColor,
                        splashRadius: 0,
                        value: (true),
                        onChanged: (value) {})),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  endIndent: MediaQuery.of(context).size.width / 20, //18
                  indent: MediaQuery.of(context).size.width / 18, //18
                ),
                SettingNnotificationContainer(
                    imgUrl: 'assets/images/diamonds.png',
                    title: 'معلومات حول الاعلانات التي تهمني',
                    widget: Switch.adaptive(
                        activeColor: mainAppColor,
                        splashRadius: 0,
                        value: (true),
                        onChanged: (value) {})),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  endIndent: MediaQuery.of(context).size.width / 20, //18
                  indent: MediaQuery.of(context).size.width / 18, //18
                ),
              ],
            )),
      ),
    );
  }
}
