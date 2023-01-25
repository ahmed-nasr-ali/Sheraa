// ignore_for_file: unused_local_variable, unused_field, must_be_immutable, equal_keys_in_map, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/balance/terms%20and%20conditions%20screen/terms_and_conditions_screen.dart';
import 'package:sheraa/ui/more/my%20ads/effective%20ads%20screen/increase%20views%20screen/widgets/increase_views_widget.dart';
import 'package:sheraa/utils/app_colors.dart';

class IncreaseViewsScreen extends StatefulWidget {
  int ad_Id;
  IncreaseViewsScreen({
    Key? key,
    required this.ad_Id,
  }) : super(key: key);

  @override
  State<IncreaseViewsScreen> createState() => _IncreaseViewsScreenState();
}

class _IncreaseViewsScreenState extends State<IncreaseViewsScreen> {
  double? _height;
  double? _width;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

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
                size: _height! / 50.75, //16
                typeOfFontWieght: 1,
                text:
                    AppLocalizations.of(context)!.translate("Increase Views")),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: _height! / 162.4, //5
                        ),
                        Container(
                          width: _width,
                          color: accentColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: _width! / 23.4375, //16
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: _height! / 116, //7
                                ),
                                SmallText(
                                  color: blackColor,
                                  typeOfFontWieght: 1,
                                  text: AppLocalizations.of(context)!.translate(
                                      "Increase your ad views by choosing one of the features"),
                                ),
                                SizedBox(
                                  height: _height! / 116, //7
                                ),
                              ],
                            ),
                          ),
                        ),
                        IncreaseViewsWidget(
                          ad_Id: widget.ad_Id,
                          imageUrl: "assets/images/medal_star.png",
                          adtype:
                              AppLocalizations.of(context)!.translate("ad") +
                                  "Vip",
                          isVip: true,
                        ),
                        Divider(
                          height: 0,
                          thickness: _height! / 162.4,
                          color: accentColor,
                        ),
                        IncreaseViewsWidget(
                          ad_Id: widget.ad_Id,
                          imageUrl: "assets/images/medal_star_blue.png",
                          adtype:
                              AppLocalizations.of(context)!.translate("ad") +
                                  " " +
                                  AppLocalizations.of(context)!
                                      .translate("special"),
                          isVip: false,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _width! / 18.75, vertical: _height! / 40.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .translate("common questions"),
                      style: TextStyle(
                          fontSize: _height! / 67.66666666666667, //12

                          decoration: TextDecoration.underline,
                          color: mainAppColor),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TermsAndConditionsScreen()));
                      },
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate("Terms and Conditions"),
                        style: TextStyle(
                            fontSize: _height! / 67.66666666666667, //12
                            decoration: TextDecoration.underline,
                            color: mainAppColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
