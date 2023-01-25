// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/widgets/rate_details.dart';
import 'package:sheraa/utils/app_colors.dart';

class RateingScreen extends StatefulWidget {
  const RateingScreen({Key? key}) : super(key: key);

  @override
  State<RateingScreen> createState() => _RateingScreenState();
}

class _RateingScreenState extends State<RateingScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

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
                  icon: Image.asset("assets/images/arrow_simple_chock.png")),
              title: SmallText(
                  color: blackColor,
                  size: _height / 50.75, //16
                  typeOfFontWieght: 1,
                  text: AppLocalizations.of(context)!.translate("rateing")),
            ),
            body: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: _height / 162.4, //5
                    ),
                    Divider(
                      height: 0,
                      color: containerColor,
                    ),
                    RateDetails(
                      rateNumber: 0,
                      starNumber: 0,
                    ),
                    SizedBox(
                      height: _height / 81.2, //10
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _width / 20.83333333333333),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            size: _height / 58,
                            text: AppLocalizations.of(context)!
                                .translate("comments"),
                            typeOfFontWieght: 1,
                            color: blackColor,
                          ),
                          SmallText(
                            size: _height / 67.66666666666667, //12
                            text:
                                "0 ${AppLocalizations.of(context)!.translate("comment")}",
                            color: textGrayColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height / 62.46153846153846, //25
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
