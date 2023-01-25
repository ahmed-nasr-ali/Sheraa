// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class ViewsScreeen extends StatefulWidget {
  const ViewsScreeen({Key? key}) : super(key: key);

  @override
  State<ViewsScreeen> createState() => _ViewsScreeenState();
}

class _ViewsScreeenState extends State<ViewsScreeen> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> views = [
      {
        "name": AppLocalizations.of(context)!.translate("All views"),
        "descrabtion": AppLocalizations.of(context)!.translate(
            "Total views of your account and ads since the account was created"),
        "number": "0"
      },
      {
        "name": AppLocalizations.of(context)!.translate("Ad views"),
        "descrabtion": AppLocalizations.of(context)!.translate(
            "The number of views your ads have seen since the account was created"),
        "number": "0"
      },
      {
        "name": AppLocalizations.of(context)!.translate("Account Views"),
        "descrabtion": AppLocalizations.of(context)!.translate(
            "The number of views your account has seen since the account was created"),
        "number": "0"
      },
      {
        "name": AppLocalizations.of(context)!
            .translate("The number of views of your promoted ads"),
        "descrabtion": AppLocalizations.of(context)!.translate(
            "The number of views of your promoted ads since the account was created"),
        "number": "0"
      },
      {
        "name": AppLocalizations.of(context)!
            .translate("The number of people who contacted you"),
        "descrabtion": AppLocalizations.of(context)!.translate(
            "The number of people who have contacted you since the account was created"),
        "number": "0"
      },
    ];
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
                text: AppLocalizations.of(context)!.translate("views")),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: _height / 162.4, //5
                  ),
                  Divider(
                    height: 0,
                    color: containerColor,
                  ),
                  SizedBox(
                    height: _height / 67.66666666666667, //12
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: views.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        thickness: 5,
                        color: Color(0xFFF8F9FB),
                      );
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: _width / 25, //15
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: _height / 162.4,
                            ),
                            SmallText(
                              text: views[index]["number"],
                              size: _height / 40.3,
                              color: mainAppColor,
                              typeOfFontWieght: 1,
                            ),
                            SmallText(
                              text: views[index]["name"],
                              color: blackColor,
                              size: _height / 67.66666666666667, //12
                              typeOfFontWieght: 1,
                            ),
                            SizedBox(
                              height: _height / 162.4,
                            ),
                            SmallText(
                              text: views[index]["descrabtion"],
                              color: textGrayColor,
                              size: _height / 81.2, //10
                            ),
                            SizedBox(
                              height: _height / 50.75, //16
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
