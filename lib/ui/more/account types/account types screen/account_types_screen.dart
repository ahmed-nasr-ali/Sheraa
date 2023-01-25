import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/account%20types/account%20type%20details%20screen/account_type_details_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class AccountTypesScreen extends StatefulWidget {
  const AccountTypesScreen({Key? key}) : super(key: key);

  @override
  State<AccountTypesScreen> createState() => _AccountTypesScreenState();
}

class _AccountTypesScreenState extends State<AccountTypesScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
      child: PageContainer(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            // account_upgrade
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
                        size: _height / 50.75, //16
                        typeOfFontWieght: 1,
                        text: AppLocalizations.of(context)!
                            .translate("account_type_title")),
                    bottom: TabBar(
                      isScrollable: true,
                      indicatorWeight: 3,
                      indicatorColor: mainAppColor,
                      indicatorPadding:
                          EdgeInsets.symmetric(horizontal: _width / 25),
                      labelColor: mainAppColor,
                      unselectedLabelColor: textGrayColor,
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: _width / 15),
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
                              AppLocalizations.of(context)!.translate("Member"),
                        ),
                        Tab(
                          text: AppLocalizations.of(context)!
                              .translate("authorized seller"),
                        ),
                        Tab(
                          text:
                              AppLocalizations.of(context)!.translate("Store"),
                        ),
                        Tab(
                          text: AppLocalizations.of(context)!
                              .translate("authorized store"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              body: TabBarView(
                children: [
                  AccountTypeDetailsScreen(
                    isUpgrade: false,
                  ),
                  AccountTypeDetailsScreen(
                    isUpgrade: true,
                  ),
                  AccountTypeDetailsScreen(
                    isUpgrade: false,
                  ),
                  AccountTypeDetailsScreen(
                    isUpgrade: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
