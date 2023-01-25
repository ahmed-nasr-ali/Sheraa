// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/widgets/row3item.dart';
import 'package:sheraa/utils/app_colors.dart';

class AccountVerification extends StatefulWidget {
  const AccountVerification({Key? key}) : super(key: key);

  @override
  State<AccountVerification> createState() => _AccountVerificationState();
}

class _AccountVerificationState extends State<AccountVerification> {
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
                    .translate("Account Verification")),
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
                  Row3Item(
                    aboveHeight: _height / 54.13333333333333, //15,
                    fristWidthSpacing: _width / 23.4375,
                    myFristWidget: Container(
                        width: _width / 18.75,
                        height: _height / 40.6,
                        child: Image.asset("assets/images/google.png")),
                    secondWidthSpacing: _width / 37.5,
                    mySecondWidget: SmallText(
                      text: AppLocalizations.of(context)!.translate(
                        "google",
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
                    lastWidthSpacing: _width / 15, //18,
                    blowHeight: _height / 54.13333333333333, //15,
                  ),
                  Row3Item(
                    aboveHeight: _height / 54.13333333333333, //15,
                    fristWidthSpacing: _width / 23.4375,
                    myFristWidget: Container(
                        width: _width / 18.75,
                        height: _height / 40.6,
                        child: Image.asset("assets/images/facebook.png")),
                    secondWidthSpacing: _width / 37.5,
                    mySecondWidget: SmallText(
                      text: AppLocalizations.of(context)!.translate(
                        "Facebook",
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
                    lastWidthSpacing: _width / 15, //18,
                    blowHeight: _height / 54.13333333333333, //15,
                  ),
                  Row3Item(
                    aboveHeight: _height / 54.13333333333333, //15,
                    fristWidthSpacing: _width / 23.4375,
                    myFristWidget: Container(
                        width: _width / 18.75,
                        height: _height / 40.6,
                        child: Image.asset("assets/images/twitter.png")),
                    secondWidthSpacing: _width / 37.5,
                    mySecondWidget: SmallText(
                      text: AppLocalizations.of(context)!.translate(
                        "Twitter",
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
                    lastWidthSpacing: _width / 15, //18,
                    blowHeight: _height / 54.13333333333333, //15,
                  ),
                  Row3Item(
                    aboveHeight: _height / 54.13333333333333, //15,
                    fristWidthSpacing: _width / 23.4375,
                    myFristWidget: Container(
                        width: _width / 18.75,
                        height: _height / 40.6,
                        child: Image.asset("assets/images/instagram.png")),
                    secondWidthSpacing: _width / 37.5,
                    mySecondWidget: SmallText(
                      text: AppLocalizations.of(context)!.translate(
                        "Instagram",
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
                    lastWidthSpacing: _width / 15, //18,
                    blowHeight: _height / 54.13333333333333, //15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
