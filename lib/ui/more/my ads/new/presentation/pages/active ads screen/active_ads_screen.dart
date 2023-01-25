import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/controllers/delete_ad_controller.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/pages/active%20ads%20screen/active_ads_list_ui.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/providers/active_ads_provider.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/providers/deleting_ad_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class MyActiveAdsScreen extends StatefulWidget {
  MyActiveAdsScreen({Key? key}) : super(key: key);

  @override
  State<MyActiveAdsScreen> createState() => _MyActiveAdsScreenState();
}

class _MyActiveAdsScreenState extends State<MyActiveAdsScreen> {
  double? _height;

  MyActiveAdsProvider? _myActiveAdsProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _myActiveAdsProvider =
        Provider.of<MyActiveAdsProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    return Builder(
      builder: (context) => NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            // print("come her must call pagenation");

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
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    Provider.of<DeletingAdProvider>(context, listen: false)
                            .deletingAdList
                            .contains(
                                _myActiveAdsProvider!.myActiveAdsList[index].id)
                        ? Container(
                            height: 400,
                            child: Center(
                              child: SpinKitFadingCircle(color: mainAppColor),
                            ))
                        : MyActiveAdsListUi(
                            myActiveAdDetails:
                                _myActiveAdsProvider!.myActiveAdsList[index],
                            onTap: () async {
                              DeleteAdController.onTaponDeleteAd(
                                  context,
                                  _myActiveAdsProvider!
                                          .myActiveAdsList[index].id ??
                                      0);
                              setState(() {});
                              print(index);

                              await DeleteAdController.deleteAdMethod(
                                context,
                                _myActiveAdsProvider!
                                        .myActiveAdsList[index].id ??
                                    0,
                                index,
                              );

                              setState(() {});
                            },
                          ),
                    index == (_myActiveAdsProvider!.myActiveAdsList.length - 1)
                        ? Container()
                        : Divider(
                            height: 0,
                            thickness: _height! / 135.3333333333333, //10
                            color: secondryMainColor,
                          ),
                  ],
                );
              }, childCount: _myActiveAdsProvider!.myActiveAdsList.length),
            )
          ],
        ),
      ),
    );
  }
}
