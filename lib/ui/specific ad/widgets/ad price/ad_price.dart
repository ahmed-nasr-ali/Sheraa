// ignore_for_file: must_be_immutable, unused_field, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/specific%20ad/presentation/controller/tell_me_when_price_decrease_controller.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/Report%20comment%20and%20Ad/report%20advertisement/report_dvertisement.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdPrice extends StatefulWidget {
  int ad_Id;
  String pageName;
  String adPrice;

  AdPrice({
    Key? key,
    required this.ad_Id,
    required this.pageName,
    required this.adPrice,
  }) : super(key: key);

  @override
  State<AdPrice> createState() => _AdPriceState();
}

class _AdPriceState extends State<AdPrice> {
  double? _height;

  double? _width;

  bool _isTellMeSuccufly = false;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height! / 81.2, //10
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width! / 23.4375, //16
          ),
          child: SmallText(
            text: AppLocalizations.of(context)!.translate("price"),
            color: blackColor,
            typeOfFontWieght: 1,
            size: _height! / 67.66666666666667, //12
          ),
        ),
        SizedBox(
          height: _height! / 101.5, //8
        ),

        widget.pageName == "MyAd"
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(
                        text: widget.adPrice,
                        size: _height! / 50.75, //16
                        color: Color(0xff5AB66B),
                        typeOfFontWieght: 1,
                      ),
                      SmallText(
                        text:
                            UserData.getUSerLang() == "ar" ? " ر س" : " R .S ",
                        size: _height! / 50.75, //16
                        color: Color(0xff5AB66B),
                        typeOfFontWieght: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height! / 40.6, //20
                  ),
                  Divider(
                    height: 0,
                    color: secondryMainColor,
                    thickness: _height! / 162.4, //5
                  ),
                ],
              )
            : Row(
                children: [
                  Container(
                    width: (_width! / 2) - (_width! / 37.5),
                    child: Container(
                      width: _width! / 5.357142857142857,
                      child: SmallText(
                        align: TextAlign.center,
                        text: widget.adPrice +
                            " " +
                            (UserData.getUSerLang() == "ar"
                                ? " ر س"
                                : " R .S "),
                        size: _height! / 50.75, //16
                        color: Color(0xff5AB66B),
                        typeOfFontWieght: 1,
                      ),
                    ),
                  ),
                  Container(
                    width: _width! / 187.5, //2
                    height: _height! / 40.6, //16,
                    color: textGrayColor,
                  ),
                  Container(
                    width: (_width! / 2) - (_width! / _width!),
                    child: Row(
                      children: [
                        SizedBox(
                          width: _width! / 15, //20
                        ),

                        CustomButton(
                            enableVerticalMargin: false,
                            enableHorizontalMargin: false,
                            width: _width! / 2.34375, //160
                            height: _height! / 23.2, //35
                            btnLbl: _isTellMeSuccufly
                                ? AppLocalizations.of(context)!.translate(
                                    "The client has been successfully informed")
                                : AppLocalizations.of(context)!.translate(
                                    "Tell me when the price goes down"),
                            onPressedFunction: () async {
                              if (!unAuthUser(context)) {
                                Map<String, dynamic> _body = {
                                  "ad_id": widget.ad_Id,
                                };
                                print(_body);

                                _isTellMeSuccufly =
                                    await TellMeWhenPriceDecreaseController
                                        .tellMeMethod(context, _body);

                                setState(() {});
                              }
                            },
                            btnColor: whiteColor,
                            btnStyle: TextStyle(
                                color: mainAppColor,
                                fontSize: UserData.getUSerLang() == "ar"
                                    ? _height! / 67.66666666666667
                                    : _height! / 101.5),
                            borderColor: mainAppColor)
                        // })
                      ],
                    ),
                  ),
                ],
              ),

        ///chechk if there is a report or not
        widget.pageName == "MyAd"
            ? Container()
            : buildReportAd(_height!, _width!, context),
      ],
    );
  }

  Widget buildReportAd(double height, double width, BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: _height! / 40.6,
        ),
        Row(
          children: [
            SizedBox(width: _width! / 2.586206896551724 //144
                ),
            InkWell(
              onTap: () {
                if (!unAuthUser(context)) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReportAdvertisement(
                                ad_id: widget.ad_Id,
                              )));
                }
              },
              child: Row(
                children: [
                  Image.asset("assets/images/report.png"),
                  SizedBox(
                    width: _width! / 75, //5
                  ),
                  SmallText(
                    text: AppLocalizations.of(context)!
                        .translate("report_for_Offense"),
                    color: textGrayColor,
                    size: _height! / 67.66666666666667, //12
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: _height! / 40.6,
        ),
        Divider(
          height: 0,
          color: Color(0xffF8F9FB),
          thickness: _height! / 162.4,
        )
      ],
    );
  }
}
