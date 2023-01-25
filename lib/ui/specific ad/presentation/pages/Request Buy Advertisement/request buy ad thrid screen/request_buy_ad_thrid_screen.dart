// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/Request%20Buy%20Advertisement/rate%20Bottom%20Sheet/rate_bottom_sheet.dart';
import 'package:sheraa/utils/app_colors.dart';

class RequestBuyAdThridScreen extends StatefulWidget {
  const RequestBuyAdThridScreen({Key? key}) : super(key: key);

  @override
  State<RequestBuyAdThridScreen> createState() =>
      _RequestBuyAdThridScreenState();
}

class _RequestBuyAdThridScreenState extends State<RequestBuyAdThridScreen> {
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
                    .translate("request buy advertisement")),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: 0,
              ),
              SizedBox(
                height: _height / 62.46153846153846, //13
              ),
              Row(
                children: [
                  SizedBox(
                    width: _width / 28.84615384615385, //13
                  ),
                  Container(
                    width: _width / 22.05882352941176, //17
                    height: _height / 47.76470588235294, //17
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/checkbox-circle-fill.png"))),
                  ),
                  Container(
                    width: (_width / 2) -
                        ((_width / 28.84615384615385) +
                            (_width / 28.84615384615385) +
                            (_width / 22.05882352941176)),
                    height: 1,
                    color: Color(0xffFED214),
                  ),
                  Container(
                    width: _width / 22.05882352941176, //17
                    height: _height / 47.76470588235294, //17
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/checkbox-circle-fill.png"))),
                  ),
                  Container(
                    width: (_width / 2) -
                        ((_width / 28.84615384615385) +
                            (_width / 28.84615384615385) +
                            (_width / 22.05882352941176)),
                    height: 1,
                    color: Color(0xffFED214),
                  ),
                  Container(
                    width: _width / 22.05882352941176, //17
                    height: _height / 47.76470588235294, //17
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/checkbox-circle-fill.png"))),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SmallText(
                    size: _height / 67.66666666666667, //12
                    color: blackColor,
                    text: AppLocalizations.of(context)!
                        .translate("Seller Rating"),
                  ),
                  SizedBox(
                    width: _width / 15,
                  )
                ],
              ),
              SizedBox(
                height: _height / 40.6, //20
              ),
              Center(
                child: Image.asset("assets/images/rate.png"),
              ),
              SizedBox(
                height: _height / 40.6, //20
              ),
              Center(
                child: Image.asset("assets/images/ratingbigsize.png"),
              ),
              SizedBox(
                height: _height / 27.06666666666667, //30
              ),
              CustomTextFormField(
                contentPadding: _width / 23.4375, //15
                hasHorizontalMargin: true,
                horizontalMargin: _width / 23.4375, //16
                enableBorder: false,
                maxLines: 4,
                enabled: true,
                hintTxt: AppLocalizations.of(context)!
                    .translate("Write the seller's buying experience"),
                hintSize: _height / 67.66666666666667, //12,
                isPassword: false,
                readOnly: false,
                suffixIconIsImage: false,
                // suffixIconImagePath: "assets/images/send.png",
              ),
              SizedBox(
                height: _height / 54.13333333333333, //25
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: _width / 23.4375), //16
                color: Color(0xffF8F9FB),
                width: _width,

                child: Column(
                  children: [
                    SizedBox(
                      height: _height / 40.6, //20
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: _width / 20.83333333333333, //18
                        ),
                        Container(
                          height: _height / 135.3333333333333, //6
                          width: _width / 62.5, //6
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: blackColor),
                        ),
                        SizedBox(
                          width: _width / 53.57142857142857, //7
                        ),
                        SmallText(
                            text: AppLocalizations.of(context)!.translate(
                                "Please rate the seller honestly to help us fight the occupation"),
                            color: blackColor,
                            typeOfFontWieght: 0,
                            size: UserData.getUSerLang() == "ar"
                                ? _height / 67.66666666666667
                                : _height / 90.22222222222222),
                      ],
                    ),
                    SizedBox(
                      height: _height / 32.48, //25
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _height / 11.6, //70
              ),
              CustomButton(
                  enableVerticalMargin: false,
                  enableHorizontalMargin: true,
                  horizontalMargin: _width / 12.5, //30
                  width: _width,
                  height: _height / 16.24, //35
                  btnLbl:
                      AppLocalizations.of(context)!.translate("Seller Rating"),
                  onPressedFunction: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: RateBottomSheet(),
                          );
                        });
                  },
                  btnColor: mainAppColor,
                  btnStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                      fontSize: _height / 58),
                  borderColor: mainAppColor),
            ],
          ),
        ),
      ),
    );
  }
}
