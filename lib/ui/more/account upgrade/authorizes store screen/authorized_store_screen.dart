// ignore_for_file: unused_field, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/account_upgrade.dart';
import 'package:sheraa/providers/account%20upgrade/account_upgrade_provider.dart';
import 'package:sheraa/ui/more/account%20upgrade/widgets/account_upgrade_package_widget.dart';
import 'package:sheraa/ui/more/account%20upgrade/widgets/static_data_widget.dart';
import 'package:sheraa/ui/more/balance/payment%20method/payment_method_screen.dart';

import 'package:sheraa/utils/app_colors.dart';

class AuthorizedStoreScreen extends StatefulWidget {
  AccountUpgradeModel accountUpgradeModel;

  AuthorizedStoreScreen({
    Key? key,
    required this.accountUpgradeModel,
  }) : super(key: key);

  @override
  State<AuthorizedStoreScreen> createState() => _AuthorizedStoreScreenState();
}

class _AuthorizedStoreScreenState extends State<AuthorizedStoreScreen> {
  double? _height;

  double? _width;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AccountUpgradePakageId>(context, listen: false)
          .setStorePackageId(widget.accountUpgradeModel.packages![0].id ?? 0);

      print("======================================");

      print(Provider.of<AccountUpgradePakageId>(context, listen: false)
          .storePackageId);
    });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return Builder(
      builder: (context) => NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            // print("come her");

            ///load next page here
            // _loadMore();
            //romove part of controller from loadmore
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      Divider(
                        height: 0,
                        color: containerColor,
                      ),
                      SizedBox(
                        height: _height! / 27.06666666666667, //30
                      ),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountUpgradePackageWidget(
                    packageList: widget.accountUpgradeModel.packages ?? [],
                    selection: selectedIndex,
                    pageName: "store",
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StaticDataAccountUpgrade(),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: _height! / 32.48 //25,
                            ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          enableVerticalMargin: false,
                          enableHorizontalMargin: false,
                          horizontalMargin: _width! / 12.5, //30
                          width: _width! / 1.19047619047619, //315
                          height: _height! / 18.04444444444444, //35
                          btnLbl: AppLocalizations.of(context)!
                              .translate("account_upgrade"),
                          onPressedFunction: () {
                            Map _body = {
                              "package_id": Provider.of<AccountUpgradePakageId>(
                                      context,
                                      listen: false)
                                  .storePackageId,
                              "promotion_type": "certified_store"
                            };

                            print("===================");

                            print(_body);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentMethodScreen(
                                          pageName: "account upgrade store",
                                          body: _body,
                                        )));
                          },
                          btnColor: whiteColor,
                          btnStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: mainAppColor,
                              fontSize: _height! / 67.66666666666667),
                          borderColor: mainAppColor,
                        ),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
