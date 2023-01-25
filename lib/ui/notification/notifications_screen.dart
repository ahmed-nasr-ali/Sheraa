// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/theme_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/notification/setting_notifications.dart';
import 'package:sheraa/ui/notification/widgets/notification_items.dart';

import '../../../utils/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  bool isNotification;
  NotificationScreen({
    Key? key,
    this.isNotification = false,
  }) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

final now = DateTime.now();
String formatter = DateFormat('yMd').format(now);

double? _height;
double? _width;

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingForAlerties()));
                  },
                  icon: Icon(
                    Icons.settings,
                    color: themeProvider.isDarkMode ? whiteColor : blackColor,
                  )),
            ],
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: BigText(
              text: 'التنبيهات',
              typeOfFontWieght: 1,
              size: _height! / 50.75, //16
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Divider(color: Color(0XFFEEEEEE)),
              NotificationItems(
                  isExist: true, imgUrl: 'assets/images/info.png'),
              Divider(
                color: containerColor,
                height: 0,
              ),
              widget.isNotification
                  ? notificationBody(_height!, _width!)
                  : Container(),
              Divider(
                color: containerColor,
                height: 0,
              ),
              SizedBox(
                height: _height! / 81.2,
              ),
              NotificationItems(isExist: false, imgUrl: 'assets/images/box.png')
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationBody(double _height, double _width) {
    return Column(
      children: [
        SizedBox(
          height: _height / 81.2,
        ),
        Row(
          children: [
            Row(
              children: [
                SizedBox(
                  width: _width / 25,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: _height / 9.022222222222222),
                  child: Image.asset('assets/images/coin.png'),
                ),
                SizedBox(
                  width: _width / 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      size: _height / 58, //14
                      color: blackColor,
                      text:
                          "${AppLocalizations.of(context)!.translate("Your ad has been requested for ")} 250 ريال ",
                    ),
                    SizedBox(
                      height: _height / 162.4, //5
                    ),
                    Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: textGrayColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SmallText(
                          text: "اسم الاعلان",
                          size: _height / 81.2,
                          color: textGrayColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _height / 81.2,
                    ),
                    Row(
                      children: [
                        CustomButton(
                          enableVerticalMargin: false,
                          enableHorizontalMargin: false,
                          boderRaduis: _height / 101.5,
                          width: _width / 5.769230769230769, //65
                          height: _height / 32.48, //25
                          btnLbl:
                              AppLocalizations.of(context)!.translate("accept"),
                          onPressedFunction: () {},
                          btnColor: mainAppColor,
                          btnStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: whiteColor,
                            fontSize: _height / 73.81818181818182,
                          ),
                          borderColor: mainAppColor,
                        ),
                        SizedBox(
                          width: _width / 75,
                        ),
                        CustomButton(
                          enableVerticalMargin: false,
                          enableHorizontalMargin: false,
                          boderRaduis: _height / 101.5,
                          width: _width / 5.769230769230769, //65
                          height: _height / 32.48, //25
                          btnLbl: AppLocalizations.of(context)!
                              .translate("refused"),
                          onPressedFunction: () {},
                          btnColor: whiteColor,
                          btnStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: mainAppColor,
                            fontSize: _height / 73.81818181818182,
                          ),
                          borderColor: mainAppColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SmallText(text: "11/2/2021")
                  ],
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        left:
                            UserData.getUSerLang() == "ar" ? _width / 18.75 : 0,
                        right:
                            UserData.getUSerLang() == "ar" ? 0 : _width / 18.75,
                        bottom: _height / 8.12,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/images/1.0x/menu-dots.png',
                            color: textGrayColor),
                      )),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: _height / 81.2,
        )
      ],
    );
  }
}
