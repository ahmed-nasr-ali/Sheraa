// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/account_upgrade.dart';
import 'package:sheraa/providers/account%20upgrade/account_upgrade_provider.dart';
import 'package:sheraa/ui/more/account%20upgrade/widgets/account_features.dart';
import 'package:sheraa/utils/app_colors.dart';

class AccountUpgradePackageWidget extends StatefulWidget {
  List<Packages> packageList;

  int selection;

  String pageName;

  AccountUpgradePackageWidget({
    Key? key,
    required this.packageList,
    required this.selection,
    required this.pageName,
  }) : super(key: key);

  @override
  State<AccountUpgradePackageWidget> createState() =>
      _AccountUpgradePackageWidgetState();
}

class _AccountUpgradePackageWidgetState
    extends State<AccountUpgradePackageWidget> {
  double? _height;

  double? _width;

  String? vipAdNumber;
  String? specialAdNumber;

  @override
  void initState() {
    super.initState();
    vipAdNumber = widget.packageList[0].vipNo.toString();
    specialAdNumber = widget.packageList[0].specialNo.toString();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: _height! / 8.12, //10
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: _width! / 37.5, //10
            ),
            scrollDirection: Axis.horizontal,
            itemCount: widget.packageList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    widget.selection = index;
                    specialAdNumber =
                        widget.packageList[index].specialNo ?? "0";
                    vipAdNumber = widget.packageList[index].vipNo ?? "0";

                    // widget.package_Id = widget.packageList[index].id ?? 0;
                  });

                  if (widget.pageName == "seller") {
                    Provider.of<AccountUpgradePakageId>(context, listen: false)
                        .setSellerPackageId(widget.packageList[index].id ?? 0);

                    print("======================================");

                    print(Provider.of<AccountUpgradePakageId>(context,
                            listen: false)
                        .sellerPackageId);
                  } else {
                    Provider.of<AccountUpgradePakageId>(context, listen: false)
                        .setStorePackageId(widget.packageList[index].id ?? 0);

                    print("======================================");

                    print(Provider.of<AccountUpgradePakageId>(context,
                            listen: false)
                        .storePackageId);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: _height! / 9.022222222222222, //95
                  width: _width! / 3.75, //100
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: widget.selection == index
                          ? mainAppColor
                          : Color(0xFFEBEBEB),
                    ),
                    borderRadius: BorderRadius.circular(_height! / 81.2), //10
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: _height! / 27.06666666666667, //30
                        width: _width! / 3.504672897196262, //95
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_height! / 81.2), //10
                            topRight: Radius.circular(_height! / 81.2), //10
                          ),
                          color: widget.selection == index
                              ? mainAppColor
                              : Color(0xFFEBEBEB),
                        ),
                        child: Center(
                          child: SmallText(
                            align: TextAlign.center,
                            text: widget.packageList[index].title ?? "لا يوجد",
                            color: widget.selection == index
                                ? whiteColor
                                : textGrayColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: _width! / 75),
                        child: Container(
                          height: _height! / 32.48,
                          width: _width! / 3.504672897196262, //95
                          child: SmallText(
                            text: widget.packageList[index].price ?? "0",
                            size: _height! / 45.11111111111111,
                            typeOfFontWieght: 1,
                            color: blackColor,
                          ),
                        ),
                      ),
                      SmallText(
                        text: AppLocalizations.of(context)!.translate("rial"),
                        size: _height! / 67.66666666666667, //12
                        typeOfFontWieght: 1,
                        color: blackColor,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: _height! / 81.2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width! / 23.4375, //16
          ),
          child: SmallText(
            text: AppLocalizations.of(context)!.translate("Account Features"),
            color: blackColor,
            typeOfFontWieght: 1,
            size: _height! / 58, //14
          ),
        ),
        SizedBox(
          height: _height! / 81.2, //10
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        SizedBox(
          height: _height! / 81.2, //81.2
        ),
        AccountFeatures(
          isTrailImage: false,
          rightText: AppLocalizations.of(context)!.translate("VIP Ads"),
          bottomRightText: AppLocalizations.of(context)!.translate(
              "The ad received 10 ad (the ad is valid for the duration of its subscription)"),
          leftText: vipAdNumber ?? '0',
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
        AccountFeatures(
          isTrailImage: false,
          rightText: AppLocalizations.of(context)!.translate("Featured ads"),
          bottomRightText: AppLocalizations.of(context)!.translate(
              "The ad received 10 ad (the ad is valid for the duration of its subscription)"),
          leftText: specialAdNumber ?? '0',
        ),
        Divider(
          height: 0,
          color: containerColor,
        ),
      ],
    );
  }
}
