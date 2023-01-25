// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/account%20upgrade/account_upgrade_provider.dart';
import 'package:sheraa/ui/more/account%20upgrade/authorized%20seller%20screen/authorized_seller_screen.dart';
import 'package:sheraa/ui/more/account%20upgrade/authorizes%20store%20screen/authorized_store_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class AccountUpgradeScreen extends StatefulWidget {
  const AccountUpgradeScreen({Key? key}) : super(key: key);

  @override
  State<AccountUpgradeScreen> createState() => _AccountUpgradeScreenState();
}

class _AccountUpgradeScreenState extends State<AccountUpgradeScreen> {
  double? _height;

  double? _width;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<AccountUpgradeProvider>(context, listen: false)
        .accountUpgradedata(context);
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
                      icon:
                          Image.asset("assets/images/arrow_simple_chock.png")),
                  title: SmallText(
                      color: blackColor,
                      size: _height! / 50.75, //16
                      typeOfFontWieght: 1,
                      text: AppLocalizations.of(context)!
                          .translate("account_upgrade")),
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
                            .translate("authorized seller"),
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
                buildAuhorizedSeller(),
                buildAuhorizedStore(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget buildAuhorizedSeller() {
    return Consumer<AccountUpgradeProvider>(
      builder: (context, value, child) {
        print("Authorized seller refresh");

        return value.isLoading
            ? SpinKitFadingCircle(color: mainAppColor)
            : AuthorizedSellerScreen(
                accountUpgradeModel: value.accountUpgradeList[1],
              );
      },
    );
  }

  Widget buildAuhorizedStore() {
    return Consumer<AccountUpgradeProvider>(
      builder: (context, value, child) {
        print("Authorized store refresh");

        return value.isLoading
            ? SpinKitFadingCircle(color: mainAppColor)
            : AuthorizedStoreScreen(
                accountUpgradeModel: value.accountUpgradeList[0],
              );
      },
    );
  }
}
