// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class OrderQuestionScreen extends StatefulWidget {
  const OrderQuestionScreen({Key? key}) : super(key: key);

  @override
  State<OrderQuestionScreen> createState() => _OrderQuestionScreenState();
}

class _OrderQuestionScreenState extends State<OrderQuestionScreen> {
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
              icon: Image.asset("assets/images/cancel.png")),
          title: SmallText(
              color: blackColor,
              size: _height / 50.75, //16
              typeOfFontWieght: 1,
              text: AppLocalizations.of(context)!.translate("ad_requests")),
        ),
        body: ListView(
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  height: 0,
                ),
                SizedBox(
                  height: _height / 81.2, //10
                ),
                Image.asset(
                  'assets/images/historyman.png',
                ),
                SizedBox(
                  height: _height / 35.30434782608696, //23
                ),
                BigText(
                  text: AppLocalizations.of(context)!.translate("ad_requests"),
                  size: _height / 58, //14
                  typeOfFontWieght: 1,
                ),
                SizedBox(
                  height: _height / 67.66666666666667, //12
                ),
                Container(
                  width: UserData.getUSerLang() == "ar"
                      ? _width / 1.293103448275862 //290
                      : _width / 1.136363636363636, //330
                  child: SmallText(
                      size: _height / 67.66666666666667,
                      maxLine: UserData.getUSerLang() == "ar" ? 5 : 6,
                      textHight: 2,
                      text:
                          "عند اضافة طلب اعلان سيتم ارسال جميع الاعلانات التي تم اضافتها في شراء اول ما يتم انزال الاعلان من قبل المعلن في قسم طلبات الاعلانات وارسال تنبيه لك بان الاعلان تم اضافته لتتمكن من متابعة الاعلانات التي ترغب"),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
