// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/Join%20our%20team/Terms%20and%20Conditions%20screen/terms_and_conditions_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class JoinOurteamScreen extends StatefulWidget {
  const JoinOurteamScreen({Key? key}) : super(key: key);

  @override
  State<JoinOurteamScreen> createState() => _JoinOurteamScreenState();
}

class _JoinOurteamScreenState extends State<JoinOurteamScreen> {
  double? _height;
  double? _width;

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
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
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/img.png"),
                SizedBox(
                  height: _height! / 32.48, //30
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(
                      text: AppLocalizations.of(context)!.translate("Get"),
                      size: _height! / 50.75,
                      color: blackColor,
                      typeOfFontWieght: 1,
                    ),
                    SizedBox(
                      width: _width! / 75,
                    ),
                    Container(
                      width: _width! / 9.375,
                      height: _height! / 20.3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFFED214)),
                      child: Center(
                        child: SmallText(
                          align: TextAlign.center,
                          text: "10%",
                          size: _height! / 58,
                          color: Color(0xFF392D78),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: _height! / 1642.4, //5
                ),
                SmallText(
                  text: AppLocalizations.of(context)!
                      .translate("Commission on every order"),
                  size: _height! / 50.75,
                  color: blackColor,
                  typeOfFontWieght: 1,
                ),
                SizedBox(
                  height: _height! / 23.2,
                ),
                CustomButton(
                  enableVerticalMargin: false,
                  enableHorizontalMargin: false,
                  horizontalMargin: _width! / 12.5, //30
                  width: _width! / 1.19047619047619, //315
                  height: _height! / 18.04444444444444, //45
                  btnLbl:
                      AppLocalizations.of(context)!.translate("Join request"),
                  onPressedFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                JoinTeamTermsAndConditionsScreen()));
                  },
                  btnColor: whiteColor,
                  btnStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainAppColor,
                      fontSize: _height! / 67.66666666666667),
                  borderColor: mainAppColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
