// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdShapeDepenonPage extends StatelessWidget {
  bool isFavorteAd;
  bool isHeartWidgetAppear;
  bool isEffectiveAd;
  AdEntity adDetails;

  AdShapeDepenonPage({
    Key? key,
    required this.isFavorteAd,
    required this.isHeartWidgetAppear,
    required this.isEffectiveAd,
    required this.adDetails,
  }) : super(key: key);

  double? _height;
  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: _height! / 32.48, //25
        ),
        Padding(
          padding: EdgeInsets.only(
            right: UserData.getUSerLang() == "ar" ? _width! / 23.4375 : 0, //16
            left: UserData.getUSerLang() == "en" ? _width! / 23.4375 : 0, //16
          ),
          child: Row(
            children: [
              adDetails.image!.isEmpty
                  ? Container(
                      width: _width! / 3.571428571428571, //105
                      height: _height! / 9.552941176470588, //85

                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(
                          _height! / 81.2, //10
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: _height! / 162.4,
                          ),
                          Image.asset(
                            "assets/images/logo.png",
                            color: grayColor,
                            height: _height! / 16.24,
                            width: _width! / 7.5,
                          ),
                          SmallText(
                            text: AppLocalizations.of(context)!
                                .translate("No pictures"),
                            color: textGrayColor,
                            size: _height! / 67.66666666666667,
                          )
                        ],
                      ),
                    )
                  : Container(
                      width: _width! / 3.571428571428571, //105
                      height: _height! / 9.552941176470588, //85
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          _height! / 81.2, //10
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            adDetails.image![0],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(
                width: _width! / 37.5, //10
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isFavorteAd
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: _width! / 2.142857142857143, //175
                                    child: SmallText(
                                      align: TextAlign.start,
                                      text: adDetails.name ?? "",
                                      color: blackColor,
                                      size: _height! / 67.66666666666667, //12
                                    ),
                                  ),
                                  isHeartWidgetAppear
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                            bottom: 5,
                                            left: UserData.getUSerLang() == "ar"
                                                ? _width! / 23.4375
                                                : 0, //16
                                            right:
                                                UserData.getUSerLang() == "en"
                                                    ? _width! / 23.4375
                                                    : 0, //16
                                          ),
                                          child: Image.asset(
                                              "assets/images/vuesax-bold-heart-fav.jpg"),
                                        )
                                      : Container()
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/vuesaxbulkshopremove.png"),
                                      SizedBox(
                                        width: _width! / 150, //2.5
                                      ),
                                      Container(
                                        width:
                                            _width! / 2.586206896551724, //145
                                        child: SmallText(
                                          align: TextAlign.start,
                                          text: adDetails.description ?? "",
                                          color: textGrayColor,
                                          size: _height! / 81.2, //10
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset("assets/images/location.png"),
                                      SizedBox(
                                        width: _width! / 162.4, //5
                                      ),
                                      Container(
                                        width: _width! / 7.5, //35
                                        child: SmallText(
                                          align: TextAlign.start,
                                          text: adDetails.city == null
                                              ? "لا يوجد مدينه"
                                              : adDetails.city!.name ?? "",

                                          color: textGrayColor,
                                          size: adDetails.city == null
                                              ? _height! / 101.5
                                              : _height! / 81.2, //10
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SmallText(
                                    align: TextAlign.start,
                                    text: adDetails.price ?? "",
                                    color: blackColor,
                                    typeOfFontWieght: 1,
                                    size: _height! / 67.66666666666667, //10
                                  ),
                                  SmallText(
                                    text: UserData.getUSerLang() == "ar"
                                        ? " ر .س"
                                        : " R .S",
                                    color: blackColor,
                                    size: _height! / 67.66666666666667, //12
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: _width! / 2.142857142857143, //175
                                child: SmallText(
                                  align: TextAlign.start,
                                  text: adDetails.name ?? "",
                                  color: blackColor,
                                  size: _height! / 67.66666666666667, //12
                                ),
                              ),
                              SizedBox(
                                height: 3, //3
                              ),
                              Container(
                                width: _width! / 1.875, //175
                                child: SmallText(
                                  align: TextAlign.start,
                                  text: adDetails.description ?? "",
                                  color: textGrayColor,
                                  size: _height! / 81.2, //10
                                ),
                              ),
                              SizedBox(
                                height: _height! / 406, //7
                              ),
                            ],
                          ),
                    isFavorteAd
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              isEffectiveAd
                                  ? CustomButton(
                                      enableVerticalMargin: false,
                                      enableHorizontalMargin: false,
                                      width: _width! / 6.818181818181818, //55
                                      height: _height! / 40.6, //35
                                      btnLbl: AppLocalizations.of(context)!
                                          .translate("active"),
                                      onPressedFunction: () {},
                                      btnColor: whiteColor,
                                      boderRaduis: _height! / 162.4, //5
                                      btnStyle: TextStyle(
                                        color: Color(0xFF4EDA4E),
                                        fontSize: UserData.getUSerLang() == "ar"
                                            ? _height! / 81.2 //10
                                            : _height! / 101.5, //8
                                      ),
                                      borderColor: Color(0xFF4EDA4E),
                                    )
                                  : CustomButton(
                                      enableVerticalMargin: false,
                                      enableHorizontalMargin: false,
                                      width: UserData.getUSerLang() == "ar"
                                          ? _width! / 3.947368421052632
                                          : _width! /
                                              5.769230769230769, //95, 65
                                      height: _height! / 40.6, //35
                                      btnLbl: AppLocalizations.of(context)!
                                          .translate("Expired"),
                                      onPressedFunction: () {},
                                      btnColor: whiteColor,
                                      boderRaduis: _height! / 162.4, //5
                                      btnStyle: TextStyle(
                                          color: Color(0xFFF30333),
                                          fontSize: _height! / 90.2222),
                                      borderColor: Color(0xFFF30333),
                                    ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: _height! / 162.4, //5
                                  right: UserData.getUSerLang() == "en"
                                      ? _width! / 23.4375
                                      : 0, //16
                                  left: UserData.getUSerLang() == "ar"
                                      ? _width! / 23.4375
                                      : 0, //16
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: _width! / 7.5, //175
                                      child: SmallText(
                                        align: TextAlign.end,
                                        text: adDetails.price ?? "",
                                        color: blackColor,
                                        size: _height! / 67.66666666666667, //12
                                        typeOfFontWieght: 1,
                                      ),
                                    ),
                                    SmallText(
                                      text: UserData.getUSerLang() == "ar"
                                          ? " ر .س"
                                          : " R .S",
                                      color: blackColor,
                                      size: _height! / 67.66666666666667, //12
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height! / 58, //14
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        SizedBox(
          height: _height! / 135.3333333333333, //6
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isFavorteAd ? _width! / 11.71875 : _width! / 23.4375),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isFavorteAd
                  ? Row(
                      children: [
                        Image.asset("assets/images/eye.png"),
                        SizedBox(
                          width: _width! / 75, //4
                        ),
                        SmallText(
                          text: adDetails.views.toString(),
                          color: textGrayColor,
                          size: _height! / 81.2,
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Image.asset("assets/images/clock.png"),
                        SizedBox(
                          width: _width! / 125, //3
                        ),
                        SmallText(
                          size: _height! / 81.2, //10
                          color: textGrayColor,
                          text: adDetails.createdAt ?? "",
                        ),
                      ],
                    ),
              isFavorteAd
                  ? Row(
                      children: [
                        Image.asset("assets/images/clock.png"),
                        SizedBox(
                          width: _width! / 75, //4
                        ),
                        SmallText(
                          text: adDetails.createdAt ?? "",
                          color: textGrayColor,
                          size: _height! / 81.2,
                        )
                      ],
                    )
                  : SmallText(
                      size: _height! / 81.2, //10
                      color: textGrayColor,
                      text: adDetails.activeFrom ?? "",
                    ),
              isFavorteAd
                  ? Row(
                      children: [
                        Image.asset("assets/images/messagesmall.png"),
                        SizedBox(
                          width: _width! / 75, //4
                        ),
                        SmallText(
                          text: (adDetails.commentsCount).toString(),
                          color: textGrayColor,
                          size: _height! / 81.2,
                        )
                      ],
                    )
                  : SmallText(
                      size: _height! / 81.2, //10
                      color: textGrayColor,
                      text: isEffectiveAd
                          ? AppLocalizations.of(context)!
                                  .translate("Expires in") +
                              " " +
                              adDetails.endedIn.toString() +
                              " " +
                              AppLocalizations.of(context)!.translate("a_day")
                          : AppLocalizations.of(context)!
                                  .translate("Expires in") +
                              " : " +
                              AppLocalizations.of(context)!.translate("Ended"),
                    )
            ],
          ),
        ),
        SizedBox(
          height: isFavorteAd
              ? _height! / 54.13333333333333
              : _height! / 73.81818181818182, //11
        ),
        Divider(
          height: 0,
          color: isFavorteAd ? secondryMainColor : containerColor,
          thickness: isFavorteAd ? 5 : 0,
        ),
      ],
    );
  }
}
