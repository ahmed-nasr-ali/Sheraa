// ignore_for_file: unused_local_variable, must_be_immutable, unused_field, non_constant_identifier_names, unnecessary_statements

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

class AuthorizedSellerScreen extends StatefulWidget {
  AccountUpgradeModel accountUpgradeModel;
  AuthorizedSellerScreen({
    Key? key,
    required this.accountUpgradeModel,
  }) : super(key: key);

  @override
  State<AuthorizedSellerScreen> createState() => _AuthorizedSellerScreenState();
}

class _AuthorizedSellerScreenState extends State<AuthorizedSellerScreen> {
  double? _height;

  double? _width;

  int selectedIndex = 0; //for showing

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AccountUpgradePakageId>(context, listen: false)
          .setSellerPackageId(widget.accountUpgradeModel.packages![0].id ?? 0);

      print("======================================");

      print(Provider.of<AccountUpgradePakageId>(context, listen: false)
          .sellerPackageId);
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
                    pageName: "seller",
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
                                  .sellerPackageId,
                              "promotion_type": "seller"
                            };

                            print(_body);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentMethodScreen(
                                          pageName: "account upgrade seller",
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
