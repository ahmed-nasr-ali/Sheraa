// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdLocation extends StatelessWidget {
  bool? isSaveAd;
  String adCity;
  String adArea;
  AdLocation({
    Key? key,
    required this.adCity,
    required this.adArea,
    this.isSaveAd = false,
  }) : super(key: key);

  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height! / 81.2, //7
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width! / 23.4375, //16
          ),
          child: SmallText(
            text: AppLocalizations.of(context)!.translate("Location"),
            color: blackColor,
            typeOfFontWieght: 1,
            size: _height! / 67.66666666666667, //12
          ),
        ),
        SizedBox(
          height: _height! / 81.2, //14
        ),
        isSaveAd!
            ? Row(
                children: [
                  SizedBox(
                    width: _width! / 18.75, //20
                  ),
                  Image.asset("assets/images/location.png"),
                  SizedBox(
                    width: _width! / 93.75, //4
                  ),
                  SmallText(
                    text: adCity + " - " + adArea,
                    color: blackColor,
                    typeOfFontWieght: 1,
                    size: _height! / 67.66666666666667, //12
                  )
                ],
              )
            : Container(
                margin: EdgeInsets.symmetric(
                    horizontal: _width! / 22.05882352941176 //17
                    ),
                height: _height! / 6.105263157894737, //133
                width: _width,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(_height! / 54.13333333333333 //15
                            ),
                    border: Border.all(color: Colors.grey.shade200)),
                child: Column(
                  children: [
                    Container(
                      width: _width,
                      height: _height! / 10.82666666666667, //75
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                _height! / 54.13333333333333 //15
                                ),
                            topRight: Radius.circular(
                                _height! / 54.13333333333333 //15
                                ),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "http://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: _width! / 18.75, //20
                        ),
                        Image.asset("assets/images/location.png"),
                        SizedBox(
                          width: _width! / 93.75, //4
                        ),
                        SmallText(
                          text: adCity + " - " + adArea,
                          color: blackColor,
                          typeOfFontWieght: 1,
                          size: _height! / 67.66666666666667, //12
                        )
                      ],
                    )
                  ],
                ),
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
    );
  }
}
