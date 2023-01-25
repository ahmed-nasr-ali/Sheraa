// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/navigation_provider.dart';
import 'package:sheraa/ui/bottom_navigation/bottom_navigation.dart';
import 'package:sheraa/utils/app_colors.dart';

class IncreaseViewsOrAccountupgardeSucces extends StatefulWidget {
  String pageName;
  IncreaseViewsOrAccountupgardeSucces({
    Key? key,
    required this.pageName,
  }) : super(key: key);

  @override
  State<IncreaseViewsOrAccountupgardeSucces> createState() =>
      _IncreaseViewsOrAccountupgardeSuccesState();
}

class _IncreaseViewsOrAccountupgardeSuccesState
    extends State<IncreaseViewsOrAccountupgardeSucces> {
  double? _height;

  double? _width;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
        child: Column(
      children: [
        Expanded(child: Container()),
        Container(
          height: _height! / 162.4, //5
          width: _width! / 9.375, //40
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_height! / 162.4 // 5
                ),
            color: Color(0xFFEFEFEF),
          ),
        ),
        SizedBox(
          height: _height! / 81.2, //10
        ),
        Container(
          width: _width,
          child: Container(
            padding: EdgeInsets.only(
              left: _width! / 18.75, //20
              right: _width! / 18.75, //20
              top: _height! / 40.6, //20
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_height! / 32.48), //25
                topRight: Radius.circular(_height! / 32.48), //25
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _height! / 24.60606060606061, //33
                ),
                Center(
                  child: Image.asset("assets/images/img.png"),
                ),
                SizedBox(
                  height: _height! / 67.66666666666667, //12
                ),
                Center(
                  child: SmallText(
                    text: widget.pageName == "increase views"
                        ? AppLocalizations.of(context)!
                            .translate("Your ad has been viewed successfully")
                        : AppLocalizations.of(context)!.translate(
                            "Your account has been successfully upgraded"), //todo
                    size: _height! / 58, //14
                    color: blackColor,
                    typeOfFontWieght: 1,
                  ),
                ),
                SizedBox(
                  height: _height! / 67.66666666666667, //12
                ),
                Center(
                  child: CustomButton(
                    width: _width! / 1.442307692307692, //260
                    enableHorizontalMargin: false,
                    enableVerticalMargin: false,
                    height: _height! / 20.3, //40
                    btnLbl: "الذهاب الى حسايك", //todo
                    onPressedFunction: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigation()),
                          (route) => false);

                      Provider.of<NavigationProvider>(
                        context,
                        listen: false,
                      ).upadateNavigationIndex(4);
                    },
                    btnColor: mainAppColor,
                    btnStyle: TextStyle(
                        color: whiteColor,
                        fontSize: _height! / 67.66666666666666666667),
                    borderColor: mainAppColor,
                  ),
                ),
                SizedBox(
                  height: _height! / 40.6,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
