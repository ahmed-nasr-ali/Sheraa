// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/account%20upgrade/widgets/account_features.dart';
import 'package:sheraa/utils/app_colors.dart';

class AccountTypeDetailsScreen extends StatefulWidget {
  bool isUpgrade;
  AccountTypeDetailsScreen({
    Key? key,
    required this.isUpgrade,
  }) : super(key: key);

  @override
  State<AccountTypeDetailsScreen> createState() =>
      _AccountTypeDetailsScreenState();
}

class _AccountTypeDetailsScreenState extends State<AccountTypeDetailsScreen> {
  List apiList = [1, 2, 3, 4, 5, 6];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        height: 0,
                        color: containerColor,
                      ),
                      SizedBox(
                        height: _height / 47.76470588235294, //17
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: _width / 23.4375, //16
                        ),
                        child: SmallText(
                          text: AppLocalizations.of(context)!
                              .translate("Account Features"),
                          color: blackColor,
                          typeOfFontWieght: 1,
                          size: _height / 58, //14
                        ),
                      ),
                      SizedBox(
                        height: _height / 81.2, //10
                      ),
                      Divider(
                        height: 0,
                        color: containerColor,
                      ),
                      SizedBox(
                        height: _height / 81.2,
                      )
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AccountFeatures(
                        isTrailImage: false,
                        imageUrl: "assets/images/checked.png",
                        rightText: "اعلانات مميزة",
                        bottomRightText:
                            "بالامكان معرفة من قام بمشاهدة اعلانك ومن اتصل بك و تواصل معك",
                        leftText: "5",
                      ),
                      index == 14
                          ? Container()
                          : Divider(
                              height: 0,
                              color: containerColor,
                            )
                    ],
                  );
                },
                childCount: 15,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return widget.isUpgrade
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: _height / 32.48 //25,
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                enableVerticalMargin: false,
                                enableHorizontalMargin: false,
                                horizontalMargin: _width / 12.5, //30
                                width: _width / 1.19047619047619, //315
                                height: _height / 18.04444444444444, //35
                                btnLbl: AppLocalizations.of(context)!
                                    .translate("account_upgrade"),
                                onPressedFunction: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             AddMoreInformationScreen()));
                                },
                                btnColor: whiteColor,
                                btnStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mainAppColor,
                                    fontSize: _height / 67.66666666666667),
                                borderColor: mainAppColor,
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: _height / 81.2,
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
