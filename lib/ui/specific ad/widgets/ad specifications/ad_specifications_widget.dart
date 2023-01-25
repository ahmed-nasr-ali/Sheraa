// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/specific%20ad/widgets/ad%20specifications/specification_container.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdSpecificationsAndDecribtionWidget extends StatelessWidget {
  String adID;
  String adName;
  List adSingleOptions;
  List adMultiOptions;
  String adDescribtion;
  String adCreatedAt;
  bool isSave;
  AdSpecificationsAndDecribtionWidget({
    Key? key,
    required this.adID,
    required this.adName,
    required this.adSingleOptions,
    required this.adMultiOptions,
    required this.adDescribtion,
    required this.adCreatedAt,
    this.isSave = false,
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
        Center(
          child: SmallText(
            text: adName,
            typeOfFontWieght: 1,
            size: _height! / 58,
            color: blackColor,
          ),
        ),
        SizedBox(
          height: _height! / 67.66666666666667, //12
        ),
        isSave
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _width! / 23.4375, //16
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      text: AppLocalizations.of(context)!
                          .translate("Specifications"),
                      color: blackColor,
                      size: _height! / 67.66666666666667, //12
                      typeOfFontWieght: 1,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/clock.png"),
                        SizedBox(width: _width! / _width!),
                        SmallText(
                          text: adCreatedAt,
                          size: _height! / 81.2, //10
                        )
                      ],
                    ),
                  ],
                ),
              ),
        SizedBox(
          height: isSave ? 0 : _height! / 40.6,
        ),
        isSave
            ? Container()
            : adSingleOptions.isEmpty
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: _width! / 25),
                    width: _width,
                    height: _height! / 27.06666666666667, //30
                    color: secondryMainColor,
                    child: Center(
                      child: SmallText(
                        text: AppLocalizations.of(context)!.translate(
                            "There are no specifications to advertise"),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: adSingleOptions.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SpecificationContainer(
                        containerColor: index % 2 == 0
                            ? secondryMainColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        startText: adSingleOptions[index].featureName ?? "",
                        endText: adSingleOptions[index].optionName ?? "",
                      );
                    },
                  ),
        SpecificationContainer(
          containerColor: isSave
              ? secondryMainColor
              : adSingleOptions.isEmpty
                  ? Theme.of(context).scaffoldBackgroundColor
                  : adSingleOptions.length % 2 == 0
                      ? secondryMainColor
                      : Theme.of(context).scaffoldBackgroundColor,
          startText: "رقم الاعلان",
          endText: adID,
        ),
        SizedBox(
          height: isSave ? _height! / 81.2 : _height! / 54.13333333333333, //15
        ),
        isSave
            ? Container()
            : adMultiOptions.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _width! / 23.4375, //16
                    ),
                    child: SmallText(
                      text: AppLocalizations.of(context)!
                          .translate("Additional specifications"),
                      color: blackColor,
                      size: _height! / 67.66666666666667, //12
                      typeOfFontWieght: 1,
                    ),
                  )
                : Container(),
        isSave
            ? Container()
            : SizedBox(
                height: isSave ? 0 : _height! / 81.2,
              ),
        isSave
            ? Container()
            : adMultiOptions.isNotEmpty
                ? ListView.builder(
                    itemCount: adMultiOptions.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SpecificationContainer(
                        containerColor: index % 2 == 0
                            ? secondryMainColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        startText: adMultiOptions[index].featureName ?? "",
                        endText: adMultiOptions[index].optionName ?? "",
                      );
                    })
                : Container(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width! / 23.4375, //16
          ),
          child: SmallText(
            text: AppLocalizations.of(context)!.translate("describtion"),
            color: blackColor,
            size: _height! / 67.66666666666667, //12
            typeOfFontWieght: 1,
          ),
        ),
        SizedBox(
          height: _height! / 81.2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width! / 23.4375, //16
          ),
          child: Container(
            child: SmallText(
              maxLine: 2,
              align: TextAlign.start,
              text: adDescribtion,
              size: _height! / 67.66666666666667, //12
              color: blackColor,
            ),
          ),
        ),
        SizedBox(
          height: isSave ? _height! / 54.13333333333333 : _height! / 40.6, //20
        ),
        Divider(
          height: 0,
        ),
      ],
    );
  }
}
