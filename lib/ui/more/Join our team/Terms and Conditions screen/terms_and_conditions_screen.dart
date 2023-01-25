// ignore_for_file: unused_field, unnecessary_statements

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/Join%20our%20team/personal%20information/personal_information_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class JoinTeamTermsAndConditionsScreen extends StatefulWidget {
  const JoinTeamTermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<JoinTeamTermsAndConditionsScreen> createState() =>
      _JoinTeamTermsAndConditionsScreenState();
}

class _JoinTeamTermsAndConditionsScreenState
    extends State<JoinTeamTermsAndConditionsScreen> {
  double? _height;
  double? _width;

  bool _isLoading = false;
  bool _isAgree = false;

  List termsAndConfitionsList = [
    "التسويق ب رسائل اعلانية مضللة أو خاطئة ",
    "الإعلان باستخدام شعارات قد تسيء للعلامة التجارية",
    " وضع الكود التسويقي في الاعلانات و الردود داخل موقع و تطبيق شراء",
    " وعند مخالفة الشروط سيتم حذف الكود الخاص به ",
    "سيتم تحويل المبالغ على حساباتكم البنكية السعودية فقط",
    " سيتم تعطيل الكود الخاص بك عند عدم الاستفادة منه من قبل شراء الخدمات المقدمة من الموقع و التطبيق لمدة اقصاها ٦ شهور"
  ];

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
            title: SmallText(
                color: blackColor,
                size: _height! / 50.75, //16
                typeOfFontWieght: 1,
                text: AppLocalizations.of(context)!
                    .translate("Terms and Conditions")),
          ),
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _height! / 162.4, //5
                  ),
                  Divider(
                    height: 0,
                    color: containerColor,
                  ),
                  SizedBox(
                    height: _height! / 45.11111111111111, //18
                  ),
                  Center(
                    child: Container(
                      width: _width! / 2.083333333333333, //180
                      child: SmallText(
                          align: TextAlign.center,
                          size: _height! / 67.66666666666667, //12
                          maxLine: 2,
                          color: blackColor,
                          typeOfFontWieght: 1,
                          text: AppLocalizations.of(context)!.translate(
                              "The countries targeted by the ads are the Kingdom of Saudi Arabia only")),
                    ),
                  ),
                  SizedBox(
                    height: _height! / 54.13333333333333,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width! / 18.75),
                    child: SmallText(
                        color: blackColor,
                        size: _height! / 67.66666666666667, //12

                        text: AppLocalizations.of(context)!.translate(
                            "No amount will be paid from the advertisement in the following ways:")),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: termsAndConfitionsList.length,
                    itemBuilder: (context, index) {
                      return buildListBody();
                    },
                  ),
                  SizedBox(
                    height: _height! / 27.06666666666667, //30
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _width! / 18.75,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isAgree = !_isAgree;
                        });
                      },
                      child: Row(
                        children: [
                          _isAgree
                              ? Image.asset(
                                  "assets/images/checkboxcirclefill.png")
                              : Image.asset("assets/images/checkbox.png"),
                          SizedBox(
                            width: _width! / 75,
                          ),
                          SmallText(
                            color: blackColor,
                            typeOfFontWieght: _isAgree ? 1 : 0,
                            size: _height! / 67.66666666666667, //12
                            text: AppLocalizations.of(context)!.translate(
                                "I agree to the above terms and conditions"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _height! / 18.04444444444444, //45
                  ),
                  Center(
                    child: CustomButton(
                      enableVerticalMargin: false,
                      enableHorizontalMargin: false,
                      horizontalMargin: _width! / 12.5, //30
                      width: _width! / 1.19047619047619, //315
                      height: _height! / 18.04444444444444, //45
                      btnLbl: AppLocalizations.of(context)!.translate("next"),
                      onPressedFunction: () {
                        _isAgree
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PersonalInformationScreeen()))
                            : null;
                      },
                      btnColor: whiteColor,
                      btnStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mainAppColor,
                          fontSize: _height! / 67.66666666666667),
                      borderColor: mainAppColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListBody() {
    return Column(
      children: [
        SizedBox(
          height: _height! / 40.6,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: _width! / 18.75),
          child: SmallText(
              align: TextAlign.start,
              size: _height! / 67.66666666666667, //12
              maxLine: 2,
              text:
                  "سيتم تعطيل الكود الخاص بك عند عدم الاستفادة منه من قبل شراء الخدمات المقدمة من الموقع و التطبيق لمدة اقصاها ٦ شهور"),
        )
      ],
    );
  }
}
