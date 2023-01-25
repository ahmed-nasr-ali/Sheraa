// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/ad%20requests/ads/ads.dart';
import 'package:sheraa/ui/more/ad%20requests/order%20screen/orders_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdRequestsScreen extends StatefulWidget {
  const AdRequestsScreen({Key? key}) : super(key: key);

  @override
  State<AdRequestsScreen> createState() => _AdRequestsScreenState();
}

class _AdRequestsScreenState extends State<AdRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
        child: PageContainer(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  pinned: true,
                  floating: true,
                  snap: true,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon:
                          Image.asset("assets/images/arrow_simple_chock.png")),
                  title: SmallText(
                      color: blackColor,
                      size: _height / 50.75, //16
                      typeOfFontWieght: 1,
                      text: AppLocalizations.of(context)!
                          .translate("ad_requests")),
                  bottom: TabBar(
                      indicatorWeight: 3,
                      indicatorColor: mainAppColor,
                      indicatorPadding:
                          EdgeInsets.symmetric(horizontal: _width / 12.5),
                      labelColor: mainAppColor,
                      unselectedLabelColor: textGrayColor,
                      labelStyle: TextStyle(
                        fontFamily: 'RB',
                        fontWeight: FontWeight.bold,
                        fontSize: _height / 58, //14
                        overflow: TextOverflow.ellipsis,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontFamily: 'RB',
                        fontWeight: FontWeight.normal,
                        fontSize: _height / 58, //14
                        overflow: TextOverflow.ellipsis,
                      ),
                      tabs: [
                        Tab(
                          text:
                              AppLocalizations.of(context)!.translate("Orders"),
                        ),
                        Tab(
                          text: AppLocalizations.of(context)!.translate("ads"),
                        )
                      ]),
                ),
              ),
            ],
            body: TabBarView(
              children: [
                OrderScreen(),
                AdsRequest(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
