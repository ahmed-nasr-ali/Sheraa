// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/providers/update_current_user_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class ChooseGender extends StatefulWidget {
  const ChooseGender({Key? key}) : super(key: key);

  @override
  State<ChooseGender> createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  double? _width;

  double? _height;

  bool _isMale = false;
  bool _isFemale = false;

  @override
  void initState() {
    super.initState();
    if (UserData.getUserGender() == "male") {
      setState(() {
        _isMale = true;
      });
    } else if (UserData.getUserGender() == "female") {
      setState(() {
        _isFemale = true;
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<UpdateCurrentUserProvider>(context, listen: false);

    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height! / 40.6, //20
        ),
        Divider(
          height: 0,
          thickness: _height! / 162.4,
          color: accentColor,
        ),
        SizedBox(
          height: _height! / 81.2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width! / 23.4375 //16
              ),
          child: SmallText(
              typeOfFontWieght: 1,
              color: blackColor,
              size: _height! / 67.66666666666667, //12
              text: AppLocalizations.of(context)!.translate("Type")),
        ),
        SizedBox(
          height: _height! / 81.2, //10
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width! / 23.4375, //16
          ),
          child: Row(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  print("male");
                  setState(() {
                    _isMale = true;
                    _isFemale = false;
                  });
                  authProvider.setUserGender("male");
                },
                child: Row(
                  children: [
                    _isMale
                        ? Image.asset("assets/images/checkboxcirclefill.png")
                        : Image.asset("assets/images/checkbox.png"),
                    SizedBox(
                      width: _width! / 75,
                    ),
                    SmallText(
                      typeOfFontWieght: _isMale ? 1 : 0,
                      text: AppLocalizations.of(context)!.translate("male"),
                      size: _height! / 67.66666666666667, //12
                      color: blackColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: _width! / 18.785, //20
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  print("female");
                  setState(() {
                    _isFemale = true;

                    _isMale = false;
                  });

                  authProvider.setUserGender("female");
                },
                child: Row(
                  children: [
                    _isFemale
                        ? Image.asset("assets/images/checkboxcirclefill.png")
                        : Image.asset("assets/images/checkbox.png"),
                    SizedBox(
                      width: _width! / 75,
                    ),
                    SmallText(
                      typeOfFontWieght: _isFemale ? 1 : 0,
                      text: AppLocalizations.of(context)!.translate("female"),
                      size: _height! / 67.66666666666667, //12
                      color: blackColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height! / 40.6, //10
        ),
        Divider(
          height: 0,
          thickness: _height! / 162.4,
          color: accentColor,
        ),
        SizedBox(
          height: _height! / 81.2,
        ),
      ],
    );
  }
}
