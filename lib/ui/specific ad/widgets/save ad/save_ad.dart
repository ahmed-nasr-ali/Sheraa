// ignore_for_file: must_be_immutable, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/utils/app_colors.dart';

import 'save_ad_screen.dart';

class SaveAd extends StatefulWidget {
  AdEntity adDetails;
  SaveAd({
    Key? key,
    required this.adDetails,
  }) : super(key: key);

  @override
  State<SaveAd> createState() => _SaveAdState();
}

class _SaveAdState extends State<SaveAd> {
  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: _height! / 67.66666666666667, //12
        ),
        CustomButton(
            enableVerticalMargin: false,
            verticalMargin: _height! / 81.2,
            enableHorizontalMargin: true,
            horizontalMargin: _width! / 23.4375, //16,
            width: _width,
            height: _height! / 18.04444444444444, //35
            btnLbl:
                AppLocalizations.of(context)!.translate("save advertisement"),
            onPressedFunction: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SaveAdScreen(
                    adDetails: widget.adDetails,
                  ),
                ),
              );
            },
            btnColor: mainAppColor,
            btnStyle: TextStyle(color: whiteColor, fontSize: _height! / 58),
            borderColor: mainAppColor),
        SizedBox(
          height: _height! / 54.13333333333333, //12
        ),
        Divider(
          height: 0,
          thickness: _height! / 162.4,
          color: Color(0xffF8F9FB),
        )
      ],
    );
  }
}
