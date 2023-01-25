// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/favorite%20ad/adding_ad_to_favorite_ad_list.dart';
import 'package:sheraa/ui/more/favorite%20ads/presentation/controller/favorite_ad_controller.dart';
import 'package:sheraa/utils/app_colors.dart';

class successOperation extends StatefulWidget {
  String operationName;
  String comesFrom;
  int? adId;
  successOperation({
    Key? key,
    required this.operationName,
    required this.comesFrom,
    this.adId,
  }) : super(key: key);

  @override
  State<successOperation> createState() => _successOperationState();
}

class _successOperationState extends State<successOperation> {
  double? _height;

  double? _width;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
      child: Container(
        width: _width!,
        height: _height! / 4.06, //200
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_height! / 81.2),
              topRight: Radius.circular(_height! / 81.2)),
          color: whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _height! / 54.13333333333333, //15
            ),
            Center(
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 0),
                width: _width! / 9.375, //40
                height: _height! / 162.4, //5
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(_height! / 162.4)), //5
              ),
            ),
            SizedBox(
              height: _height! / 40.6, //50
            ),
            SizedBox(
              height: _height! / 32.48, //25
            ),
            Center(
              child: SmallText(
                text: AppLocalizations.of(context)!
                    .translate(widget.operationName),
                size: _height! / 58, //16
                typeOfFontWieght: 1,
                color: blackColor,
              ),
            ),
            SizedBox(
              height: _height! / 20.6,
            ),
            _saveAndCancledButton(_height!, _width!)
          ],
        ),
      ),
    );
  }

  _saveAndCancledButton(double _height, double _width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
              enableVerticalMargin: false,
              enableHorizontalMargin: false,
              height:
                  MediaQuery.of(context).size.height / 18.04444444444444, //45
              width:
                  MediaQuery.of(context).size.width / 2.272727272727273, //165
              btnLbl: AppLocalizations.of(context)!.translate("ok"),
              onPressedFunction: () async {
                if (widget.comesFrom == "Ad Page") {
                  Map<String, dynamic> _body = {
                    "ad_id": widget.adId,
                  };
                  await FavoriteAdCOntroller.deletingAdFromFavoriteAdsMethod(
                      context, _body, widget.adId!);
                }
              },
              btnColor: mainAppColor,
              btnStyle: TextStyle(color: whiteColor, fontSize: 14),
              borderColor: mainAppColor),
          CustomButton(
              enableVerticalMargin: false,
              enableHorizontalMargin: false,
              height:
                  MediaQuery.of(context).size.height / 18.04444444444444, //45
              width:
                  MediaQuery.of(context).size.width / 2.272727272727273, //165
              btnLbl: AppLocalizations.of(context)!.translate("cancel"),
              onPressedFunction: () {
                Navigator.pop(context, false);
              },
              btnColor: mainAppColor,
              btnStyle: TextStyle(color: whiteColor, fontSize: 14),
              borderColor: mainAppColor),
        ],
      ),
    );
  }
}
