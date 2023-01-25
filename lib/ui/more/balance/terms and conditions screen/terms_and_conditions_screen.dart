// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
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
              text: AppLocalizations.of(context)!
                  .translate("Terms and Conditions")),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Row(
              children: [
                SizedBox(
                  width: _width / 23.4375, //16
                ),
                SmallText(
                  text: AppLocalizations.of(context)!
                      .translate("Welcome to Sheraa"),
                  size: _height / 67.66666666666667, //12
                  typeOfFontWieght: 0,
                  color: blackColor,
                ),
                SizedBox(
                  width: _width / 75,
                ),
                SmallText(
                  text: "www.sheraa.net",
                  size: _height / 67.66666666666667, //12
                  typeOfFontWieght: 0,
                  color: mainAppColor,
                ),
              ],
            ),
            SizedBox(
              height: _height / 62.46153846153846, //13
            ),
            Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: _width / 1.119402985074627,
                  child: SmallText(
                    size: _height / 67.66666666666667,
                    align: TextAlign.start,
                    textHight: 2,
                    maxLine: UserData.getUSerLang() == "ar" ? 8 : 9,
                    text: AppLocalizations.of(context)!.translate(
                        "There are many types of Lorem Ipsum texts available, but most have been modified in some form by introducing some random anecdotes or words into the text. If you want to use a Lorem Ipsum text, you must first verify that there are no embarrassing or inappropriate words or phrases hidden in this text. While all the Lorem Ipsum text generators on the Internet repeat passages of the same Lorem Ipsum text as many times as needed, there are many types of Lorem Ipsum scripts available, but the majority have been modified"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _height / 81.2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _width / 23.4375,
              ),
              child: SmallText(
                  size: _height / 67.66666666666667, //12
                  color: blackColor,
                  typeOfFontWieght: 1,
                  text: AppLocalizations.of(context)!
                      .translate("Terms and Conditions")),
            ),
            SizedBox(
              height: _height / 81.2,
            ),
            Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: _width / 1.119402985074627,
                  child: SmallText(
                    size: _height / 67.66666666666667,
                    align: TextAlign.start,
                    textHight: 2,
                    maxLine: UserData.getUSerLang() == "ar" ? 8 : 9,
                    text: AppLocalizations.of(context)!.translate(
                        "There are many types of Lorem Ipsum texts available, but most have been modified in some form by introducing some random anecdotes or words into the text. If you want to use a Lorem Ipsum text, you must first verify that there are no embarrassing or inappropriate words or phrases hidden in this text. While all the Lorem Ipsum text generators on the Internet repeat passages of the same Lorem Ipsum text as many times as needed, there are many types of Lorem Ipsum scripts available, but the majority have been modified"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
