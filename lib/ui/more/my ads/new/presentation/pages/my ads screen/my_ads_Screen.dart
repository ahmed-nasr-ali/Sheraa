// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/controllers/active_ads_controller.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/pages/active%20ads%20screen/active_ads_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class MyAdsScreen extends StatefulWidget {
  MyAdsScreen({Key? key}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  double? _height;

  double? _width;

  bool _isMyActiveAdLoading = true;

  fetch() async {
    await MyActiveAdsController.fetchData(context, 1);

    setState(() {
      _isMyActiveAdLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    fetch();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
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
                        icon: Image.asset(
                            "assets/images/arrow_simple_chock.png")),
                    title: SmallText(
                        color: blackColor,
                        size: _height! / 50.75, //16
                        typeOfFontWieght: 1,
                        text:
                            AppLocalizations.of(context)!.translate("my_ads")),
                    bottom: TabBar(
                      indicatorWeight: 3,
                      indicatorColor: mainAppColor,
                      indicatorPadding:
                          EdgeInsets.symmetric(horizontal: _width! / 12.5),
                      labelColor: mainAppColor,
                      unselectedLabelColor: textGrayColor,
                      labelStyle: TextStyle(
                        fontFamily: 'RB',
                        fontWeight: FontWeight.bold,
                        fontSize: _height! / 58, //14
                        overflow: TextOverflow.ellipsis,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontFamily: 'RB',
                        fontWeight: FontWeight.normal,
                        fontSize: _height! / 58, //14
                        overflow: TextOverflow.ellipsis,
                      ),
                      tabs: [
                        Tab(
                          text: AppLocalizations.of(context)!
                              .translate("Effective Ads"),
                        ),
                        Tab(
                          text: AppLocalizations.of(context)!
                              .translate("Ineffective Ads"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              body: TabBarView(children: [
                _isMyActiveAdLoading
                    ? Center(
                        child: SpinKitFadingCircle(color: mainAppColor),
                      )
                    : MyActiveAdsScreen(),
                SmallText(text: "text"),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
