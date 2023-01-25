// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class DisableReplyFeatureBody extends StatefulWidget {
  const DisableReplyFeatureBody({Key? key}) : super(key: key);

  @override
  State<DisableReplyFeatureBody> createState() =>
      _DisableReplyFeatureBodyState();
}

class _DisableReplyFeatureBodyState extends State<DisableReplyFeatureBody> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: _height / 81.2, //10
        ),
        Divider(
          thickness: 1,
          height: 0,
          color: containerColor,
        ),
        SizedBox(
          height: _height / 36.90909090909091, //22
        ),
        Center(
          child: Image.asset("assets/images/imgman.png"),
        ),
        SizedBox(
          height: _height / 32.48, //25
        ),
        Center(
          child: SmallText(
            text: AppLocalizations.of(context)!.translate(
              'Disable_the_reply_feature',
            ),
            color: blackColor,
            typeOfFontWieght: 1,
            size: _height / 58, //14
          ),
        ),
        SizedBox(
          height: _height / 40.6,
        ),
        Container(
          width: _width / 1.175548589341693, //319
          child: SmallText(
            align: TextAlign.center,
            maxLine: UserData.getUSerLang() == "ar" ? 2 : 3,
            text: AppLocalizations.of(context)!.translate(
                "When the feature is activated, the responses in the advertisement are disabled. Only the authorized seller and authorized store can activate this feature"),
            size: _height / 67.66666666666667, //12
          ),
        ),
      ],
    );
  }
}
