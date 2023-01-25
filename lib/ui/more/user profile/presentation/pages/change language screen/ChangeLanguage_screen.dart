// ignore_for_file: unused_local_variable, unused_field, unnecessary_statements

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/locale/locale_helper.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/shared_preferences/shared_preferences_helper.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  bool _isArabic = UserData.getUSerLang() == "ar" ? true : false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    final _authProvider = Provider.of<AuthProvider>(context);

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
                  text: AppLocalizations.of(context)!.translate("language")),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: _height / 162.4, //5
                      ),
                      Divider(
                        height: 0,
                        color: containerColor,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isArabic = true;
                          });
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: _height / 81.2, //10
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: _width / 23.4375, //16
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: "اللغة العربية",
                                      size: _height / 58,
                                      color: blackColor,
                                    ),
                                    _isArabic
                                        ? Image.asset(
                                            "assets/images/checkboxcirclefill.png")
                                        : Container(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: _height / 54.13333333333333, //15
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 0,
                        thickness: 0,
                        color: containerColor,
                        indent: _width / 18.75,
                        endIndent: _width / 18.75,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isArabic = false;
                          });
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: _height / 81.2, //10
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: _width / 23.4375, //16
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: "English",
                                      size: _height / 58,
                                      color: blackColor,
                                    ),
                                    !_isArabic
                                        ? Image.asset(
                                            "assets/images/checkboxcirclefill.png")
                                        : Container(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: _height / 81.2, //15
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CustomButton(
                    width: MediaQuery.of(context).size.width / 1.19047619047619,
                    height: _height / 16.24, //50
                    enableHorizontalMargin: false,
                    btnLbl: AppLocalizations.of(context)!.translate("confirm"),
                    borderColor: mainAppColor,
                    btnColor: mainAppColor,
                    btnStyle: TextStyle(
                        fontSize: _height / 58 //20
                        ,
                        color: whiteColor),
                    onPressedFunction: () {
                      _isArabic
                          ? (setState(() {
                              SharedPreferencesHelper.setUserLang('ar');
                              UserData.setUserLang("ar");

                              helper.onLocaleChanged(new Locale('ar'));
                              _authProvider.setCurrentLanguage('ar');
                            }))
                          : setState(() {
                              SharedPreferencesHelper.setUserLang('en');
                              UserData.setUserLang("en");

                              helper.onLocaleChanged(new Locale('en'));
                              _authProvider.setCurrentLanguage('en');
                            });
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
