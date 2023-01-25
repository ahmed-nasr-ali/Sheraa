// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class ReportAdUserProfileScreen extends StatefulWidget {
  const ReportAdUserProfileScreen({Key? key}) : super(key: key);

  @override
  State<ReportAdUserProfileScreen> createState() =>
      _ReportAdUserProfileScreenState();
}

class _ReportAdUserProfileScreenState extends State<ReportAdUserProfileScreen> {
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
                text: AppLocalizations.of(context)!.translate("Report abuse")),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: 0,
              ),
              SizedBox(
                height: _height / 45.11111111111111,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width / 18.75 //20
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: _height / 11.6, //70
                          width: _width / 5.357142857142857, //70
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              shape: BoxShape.circle),

                          child: Center(
                            child: Image.asset(
                                "assets/images/money_forbidden.png"),
                          ),
                        ),
                        SizedBox(
                          height: _height / 101.5, //8
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: UserData.getUSerLang() == "ar"
                                  ? 0
                                  : _height / 54.13333333333333),
                          width: _width / 3.75,
                          child: SmallText(
                              maxLine: UserData.getUSerLang() == "ar" ? 1 : 2,
                              color: blackColor,
                              size: _height / 67.66666666666667, //12
                              text: AppLocalizations.of(context)!
                                  .translate("rogue")),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: _height / 11.6, //70
                          width: _width / 5.357142857142857, //70
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              shape: BoxShape.circle),

                          child: Center(
                            child:
                                Image.asset("assets/images/message_remove.png"),
                          ),
                        ),
                        SizedBox(
                          height: _height / 101.5, //8
                        ),
                        Container(
                          width: _width / 3.75,
                          child: SmallText(
                              maxLine: UserData.getUSerLang() == "ar" ? 1 : 2,
                              color: blackColor,
                              size: _height / 67.66666666666667, //12
                              text: AppLocalizations.of(context)!
                                  .translate("improper communication")),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: _height / 11.6, //70
                          width: _width / 5.357142857142857, //70
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              shape: BoxShape.circle),

                          child: Center(
                            child: Image.asset("assets/images/forbidden.png"),
                          ),
                        ),
                        SizedBox(
                          height: _height / 101.5, //8
                        ),
                        Container(
                          width: _width / 3.75,
                          child: SmallText(
                              maxLine: UserData.getUSerLang() == "ar" ? 1 : 2,
                              color: blackColor,
                              size: _height / 67.66666666666667, //12
                              text: AppLocalizations.of(context)!
                                  .translate("Posting infringing ads")),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _height / 27.06666666666667, //30
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width / 18.75 //20
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: _height / 11.6, //70
                          width: _width / 5.357142857142857, //70
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              shape: BoxShape.circle),

                          child: Center(
                            child: Image.asset("assets/images/box_remove.png"),
                          ),
                        ),
                        SizedBox(
                          height: _height / 101.5, //8
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: UserData.getUSerLang() == "ar"
                                  ? 0
                                  : _height / 40.6),
                          width: _width / 3.75,
                          child: SmallText(
                              maxLine: UserData.getUSerLang() == "ar" ? 1 : 2,
                              color: blackColor,
                              size: _height / 67.66666666666667, //12
                              text: AppLocalizations.of(context)!
                                  .translate("Post fake ads")),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: _height / 11.6, //70
                          width: _width / 5.357142857142857, //70
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              shape: BoxShape.circle),

                          child: Center(
                            child:
                                Image.asset("assets/images/shield-cross.png"),
                          ),
                        ),
                        SizedBox(
                          height: _height / 101.5, //8
                        ),
                        Container(
                          width: _width / 3.75,
                          child: SmallText(
                              maxLine: UserData.getUSerLang() == "ar" ? 1 : 2,
                              color: blackColor,
                              size: _height / 67.66666666666667, //12
                              text: AppLocalizations.of(context)!
                                  .translate("Post offensive comments")),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: _height / 11.6, //70
                          width: _width / 5.357142857142857, //70
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              shape: BoxShape.circle),

                          child: Center(
                            child: Image.asset("assets/images/more-square.png"),
                          ),
                        ),
                        SizedBox(
                          height: _height / 101.5, //8
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: UserData.getUSerLang() == "ar"
                                  ? 0
                                  : _height / 40.6),
                          width: _width / 3.75,
                          child: SmallText(
                              maxLine: UserData.getUSerLang() == "ar" ? 1 : 2,
                              color: blackColor,
                              size: _height / 67.66666666666667, //12
                              text: AppLocalizations.of(context)!
                                  .translate("other")),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
