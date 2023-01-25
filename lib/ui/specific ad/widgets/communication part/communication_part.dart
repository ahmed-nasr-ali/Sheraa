// ignore_for_file: must_be_immutable, unused_element, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class CommunicationPart extends StatelessWidget {
  String pageName;
  String userphoneNUmber;
  bool isHiddenContact;

  CommunicationPart({
    Key? key,
    required this.pageName,
    required this.userphoneNUmber,
    required this.isHiddenContact,
  }) : super(key: key);

  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return pageName == "MyAd"
        ? Container()
        : isHiddenContact
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _height! / 54.13333333333333, //15
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width! / 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            print("call");

                            callPhoneMethod();
                          },
                          child: Row(
                            children: [
                              Image.asset("assets/images/call.png"),
                              SizedBox(
                                width: _width! / 37.5, //10
                              ),
                              SmallText(
                                text: AppLocalizations.of(context)!
                                    .translate("call"),
                                color: blackColor,
                                typeOfFontWieght: 1,
                                size: _height! / 67.66666666666667, //12
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            print(userphoneNUmber);
                            _openWhatsApp();
                          },
                          child: Row(
                            children: [
                              Image.asset("assets/images/whatsapp.png"),
                              SizedBox(
                                width: _width! / 37.5, //10
                              ),
                              SmallText(
                                text: AppLocalizations.of(context)!
                                    .translate("WhatsApp contact"),
                                color: blackColor,
                                typeOfFontWieght: 1,
                                size: _height! / 67.66666666666667, //12
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/messagephoto.png"),
                            SizedBox(
                              width: _width! / 37.5, //10
                            ),
                            SmallText(
                              text: AppLocalizations.of(context)!
                                  .translate("chat"),
                              color: blackColor,
                              typeOfFontWieght: 1,
                              size: _height! / 67.66666666666667, //12
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height! / 40.6, //20
                  ),
                  Divider(
                    height: 0,
                    thickness: _height! / 162.4,
                    color: Color(0xffF8F9FB),
                  ),
                ],
              );
  }

  _openWhatsApp() async {
    await launch("https://wa.me/$userphoneNUmber");
  }

  callPhoneMethod() async {
    launch("tel://$userphoneNUmber");
  }
}
