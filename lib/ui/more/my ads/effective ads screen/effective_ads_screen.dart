// ignore_for_file: unused_local_variable, unused_field, must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/ui/more/my%20ads/widgets/ad_views_and_status.dart';
import 'package:sheraa/ui/more/my%20ads/widgets/my_ad_body.dart';
import 'package:sheraa/ui/more/my%20ads/widgets/remaining_ads_widget.dart';
import 'package:sheraa/ui/more/my%20ads/widgets/statistics_edit_delete_ad.dart';
import 'package:sheraa/utils/app_colors.dart';

class EffectiveAdsScreen extends StatefulWidget {
  List<Ad> activeAd;
  int remaingAdVip;
  int remainingAdSpecial;
  EffectiveAdsScreen({
    Key? key,
    required this.activeAd,
    required this.remaingAdVip,
    required this.remainingAdSpecial,
  }) : super(key: key);

  @override
  State<EffectiveAdsScreen> createState() => _EffectiveAdsScreenState();
}

class _EffectiveAdsScreenState extends State<EffectiveAdsScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Builder(
      builder: (context) => NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            // print("come her");

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
                      buildRemainAds(_height, _width),
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
                    children: [
                      myAdBody(index, _height, _width),
                      index == (widget.activeAd.length - 1)
                          ? Container()
                          : Divider(
                              height: 0,
                              thickness: _height / 135.3333333333333, //10
                              color: secondryMainColor,
                            )
                    ],
                  );
                },
                childCount: widget.activeAd.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRemainAds(double _height, double _width) {
    return Column(
      children: [
        Divider(
          height: 0,
          color: containerColor,
        ),
        SizedBox(
          height: _height / 32.48, //25
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: _width / 23.4375 //16
              ),
          width: _width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              _height / 54.13333333333333, //15
            ),
            border: Border.all(
              color: containerColor,
            ),
          ),
          child: Column(
            children: [
              RemainingAdsWidget(
                height: _height,
                width: _width,
                imageUrl: "assets/images/medal_star.png",
                upperText: "Remaining Ads",
                lowerText: "You still have VIP ads activated",
                number: widget.remaingAdVip,
              ),
              RemainingAdsWidget(
                height: _height,
                width: _width,
                imageUrl: "assets/images/medal_star_blue.png",
                upperText: "Remaining Ads",
                lowerText: "You still have effective featured ads",
                number: widget.remainingAdSpecial,
                dividerTrue: 12,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget myAdBody(int index, double _height, double _width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => SpecificAdScreenDetails(
            //       pageName:
            //           "notmoreInformation", //moreInformation (second case)
            //       isMyAd: true,
            //       adDetails: widget.activeAd[index],
            //     ),
            //   ),
            // );
          },
          child: MyAdBody(
            isHeartAppear: false,
            isFavorteAd: false,
            isEffectiveAd: true,
            adDetails: widget.activeAd[index],
          ),
        ),
        StatisticsEditAndDeleteAd(
          adDetails: widget.activeAd[index],
          isEffectiveAd: true,
        ),
        AdViewsAndStatus(
          ad_Id: widget.activeAd[index].id ?? 0,
          adView: widget.activeAd[index].views ?? 1,
          statusNumber: widget.activeAd[index].endedIn ?? 0,
        ),
        SizedBox(
          height: _height / 40.6, //20
        ),
        CustomButton(
          enableVerticalMargin: false,
          enableHorizontalMargin: true,
          horizontalMargin: _width / 12.5, //30
          width: _width,
          height: _height / 18.04444444444444, //35
          btnLbl:
              AppLocalizations.of(context)!.translate("Add more information"),
          onPressedFunction: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => SpecificAdScreenDetails(
            //               pageName: "moreInformation",
            //               isMyAd: true,
            //               adDetails: widget.activeAd[index],
            //             )));
          },
          btnColor: whiteColor,
          btnStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: mainAppColor,
              fontSize: _height / 67.66666666666667),
          borderColor: mainAppColor,
        ),
        SizedBox(
          height: _height / 32.48,
        ),
      ],
    );
  }
}
