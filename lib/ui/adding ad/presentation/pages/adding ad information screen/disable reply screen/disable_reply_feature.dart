// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

import 'disable_reply_feature_body.dart';

class DisableReplyFeature extends StatefulWidget {
  const DisableReplyFeature({Key? key}) : super(key: key);

  @override
  State<DisableReplyFeature> createState() => _DisableReplyFeatureState();
}

class _DisableReplyFeatureState extends State<DisableReplyFeature> {
  double _width = 0, _height = 0;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
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
              size: _height / 50.75, //16
              typeOfFontWieght: 1,
              text: AppLocalizations.of(context)!
                  .translate("Disable_the_reply_feature")),
        ),
        body: DisableReplyFeatureBody(),
      ),
    ));
  }
}
