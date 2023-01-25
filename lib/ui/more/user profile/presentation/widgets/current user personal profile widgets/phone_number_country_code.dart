// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/providers/update_current_user_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class PhoneNoAndCountryCode extends StatefulWidget {
  String countryCode;
  String phoneNo;
  PhoneNoAndCountryCode({
    Key? key,
    required this.countryCode,
    required this.phoneNo,
  }) : super(key: key);

  @override
  State<PhoneNoAndCountryCode> createState() => _PhoneNoAndCountryCodeState();
}

class _PhoneNoAndCountryCodeState extends State<PhoneNoAndCountryCode> {
  double? _height;

  double? _width;

  bool hidePhoneNumbr = false;

  @override
  void initState() {
    super.initState();
    hidePhoneNumbr = UserData.getHiddenUserPhoneNumber() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<UpdateCurrentUserProvider>(context, listen: false);

    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: _height! / 81.2,
        ),
        hidePhoneNumbr
            ? Container()
            : Container(
                width: _width!,
                height: _height! / 13.53333333333333, //60
                margin: EdgeInsets.symmetric(horizontal: _width! / 23.4375),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: containerColor),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: _width! / 31.25, //12
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: _height! / 90.22222222222222, //9
                        ),
                        SmallText(
                          text: AppLocalizations.of(context)!
                              .translate("country code"),
                          size: _height! / 81.2,
                          color: blackColor,
                        ),
                        SmallText(
                          text: widget.countryCode + "+",
                          size: _height! / 67.66666666666667,
                          color: textGrayColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: _width! / 37.5,
                    ),
                    VerticalDivider(
                      width: 0,
                      thickness: 0,
                      color: containerColor,
                      endIndent: _height! / 54.13333333333333,
                      indent: _height! / 54.13333333333333,
                    ),
                    SizedBox(
                      width: _width! / 37.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: _height! / 90.22222222222222, //9
                        ),
                        SmallText(
                          text: "9 " +
                              AppLocalizations.of(context)!
                                  .translate("9 numbers for your phone"),
                          size: _height! / 81.2,
                          color: blackColor,
                        ),
                        SmallText(
                          text: widget.phoneNo,
                          size: _height! / 67.66666666666667,
                          color: textGrayColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        SizedBox(
          height: _height! / 81.2,
        ),
        Row(
          children: [
            SizedBox(
              width: _width! / 23.4375, //16
            ),
            InkWell(
              onTap: () {
                setState(() {
                  hidePhoneNumbr = !hidePhoneNumbr;
                });
                authProvider.setHiddenUserPhone(hidePhoneNumbr);
              },
              child: hidePhoneNumbr
                  ? Image.asset("assets/images/checkboxcirclefill.png")
                  : Image.asset("assets/images/checkbox.png"),
            ),
            SizedBox(
              width: _width! / 75, //5
            ),
            SmallText(
              text: AppLocalizations.of(context)!
                  .translate("Hide phone number from my profile"),
              color: blackColor,
              size: _height! / 67.66666666666667, //12
            )
          ],
        ),
      ],
    );
  }
}
