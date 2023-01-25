// ignore_for_file: unused_field, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/ui/more/my%20ads/widgets/my_ad_body.dart';
import 'package:sheraa/ui/more/my%20ads/widgets/statistics_edit_delete_ad.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/specific%20ad%20screen/specific_ad_screen.dart';
import 'package:sheraa/ui/specific%20ad/presentation/providers/get_all_comments_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class IneffectiveAdsScreen extends StatefulWidget {
  List inActiveAd;

  IneffectiveAdsScreen({
    Key? key,
    required this.inActiveAd,
  }) : super(key: key);

  @override
  State<IneffectiveAdsScreen> createState() => _IneffectiveAdsScreenState();
}

class _IneffectiveAdsScreenState extends State<IneffectiveAdsScreen> {
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
                    children: [
                      SizedBox(
                        height: 0.01,
                      ),
                      Divider(
                        height: 0,
                        color: containerColor,
                      ),
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
                      index == (widget.inActiveAd.length - 1)
                          ? Container()
                          : Divider(
                              height: 0,
                              thickness: _height / 135.3333333333333, //10
                              color: secondryMainColor,
                            )
                    ],
                  );
                },
                childCount: widget.inActiveAd.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myAdBody(int index, double _height, double _width) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Provider.of<GetAllCommentsProvider>(context, listen: false)
                .setAllDateToDefault();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => SpecificAdScreenDetails(
                          pageName: "notmoreInformation",
                          isMyAd: true,
                          adDetails: widget.inActiveAd[index],
                        )));
          },
          child: MyAdBody(
            isHeartAppear: false,
            isFavorteAd: false,
            isEffectiveAd: false,
            adDetails: widget.inActiveAd[index],
          ),
        ),
        StatisticsEditAndDeleteAd(
          isEffectiveAd: false,
          adDetails: widget.inActiveAd[index],
        ),
      ],
    );
  }
}
