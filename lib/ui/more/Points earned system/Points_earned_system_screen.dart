// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class PointsEarnedSystemScreen extends StatefulWidget {
  const PointsEarnedSystemScreen({Key? key}) : super(key: key);

  @override
  State<PointsEarnedSystemScreen> createState() =>
      _PointsEarnedSystemScreenState();
}

class _PointsEarnedSystemScreenState extends State<PointsEarnedSystemScreen> {
  List PointSystem = [1, 2, 3, 4, 5, 6, 7, 8, 9];
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
              text: AppLocalizations.of(context)!
                  .translate("Points earned system"),
            ),
          ),
          body: ListView(
            children: [
              SizedBox(
                height: _height / 162.4, //5
              ),
              Container(
                width: _width,
                height: _height / 20.3, //40
                color: Color(0xFF3BBEEF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: _width / 22.05882352941176,
                        ),
                        SmallText(
                          text: AppLocalizations.of(context)!
                              .translate("The operation"),
                          size: _height / 67.66666666666667, //12
                          color: whiteColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SmallText(
                          text:
                              AppLocalizations.of(context)!.translate("points"),
                          size: _height / 67.66666666666667, //12
                          color: whiteColor,
                        ),
                        SizedBox(
                          width: _width / 8.152173913043478,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: PointSystem.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListPointEarnSystemBody(index, _height, _width);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget ListPointEarnSystemBody(int index, double _height, double _width) {
    return Container(
      height: _height / 23.2,
      width: _width,
      color: index % 2 == 0
          ? accentColor
          : Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _width / 23.4375, //16
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: mainAppColor,
              width: _width / 1.442307692307692,
              child: SmallText(
                align: TextAlign.start,
                size: _height / 67.66666666666667, //12
                color: blackColor,
                text: "تعبئة جميع معلومات المتجر اذا كان الحساب تجاري",
              ),
            ),
            Row(
              children: [
                Container(
                  width: _width / 9.375, //40
                  child: SmallText(
                    align: TextAlign.start,
                    size: _height / 67.66666666666667, //12
                    color: blackColor,
                    typeOfFontWieght: 1,
                    text: "10.000",
                  ),
                ),
                SmallText(
                  align: TextAlign.end,
                  size: _height / 67.66666666666667, //12
                  color: blackColor,
                  text: " " + AppLocalizations.of(context)!.translate("point"),
                ),
                SizedBox(
                  width: _width / 75,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
