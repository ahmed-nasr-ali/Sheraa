// ignore_for_file: unused_field, unused_local_variable, must_be_immutable, body_might_complete_normally_nullable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/favorite%20ad/adding_ad_to_favorite_ad_list.dart';
import 'package:sheraa/providers/navigation_provider.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/all_ads_provider.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/slider_image_provider.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/store_icon_provider.dart';
import 'package:sheraa/ui/new%20Home/presentation/widgets/ads_carousel_slider.dart';
import 'package:sheraa/ui/new%20Home/presentation/widgets/category_name_and_all_its_ads.dart';
import 'package:sheraa/ui/new%20Home/presentation/widgets/store_icons.dart';
import 'package:sheraa/ui/new%20Home/presentation/widgets/show_ads_List_according_to_category.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdsScreen extends StatefulWidget {
  ScrollController? scrollController;

  AdsScreen({
    Key? key,
    this.scrollController,
  }) : super(key: key);

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  double? _height;

  double? _width;

  bool isvisble = true;

  AdOnHomeScreenProvider? _adOnHomeScreenProvider;

  StoreIconProvider? _storeIconProvider;

  SliderListProvider? _sliderListProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _adOnHomeScreenProvider =
        Provider.of<AdOnHomeScreenProvider>(context, listen: false);

    _storeIconProvider = Provider.of<StoreIconProvider>(context, listen: false);

    _sliderListProvider =
        Provider.of<SliderListProvider>(context, listen: false);

    ///(api call من غير ما اعمل Ui عشان لو المستخدم ضاف اعلان لي اعلاناته المفضله احدث)
    ///(بستخدم الجزء دا في اي مكان بيظهر في الاعلانات زي)
    ///Home page , My ads , favorite Ad
    // final _favoriteAdUpdateUiProvider =
    //     Provider.of<FavoriteAdUpdateUiProvider>(context, listen: false);

    // _favoriteAdUpdateUiProvider.addingAdToFavoriteAdList.clear();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    final _navigationBarScreen =
        Provider.of<NavigationProvider>(context, listen: false);

    return Builder(
      builder: (context) => NotificationListener<ScrollUpdateNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (widget.scrollController!.position.userScrollDirection ==
              ScrollDirection.forward) {
            isvisble = true;

            _navigationBarScreen.updateNavigationBarVisbltiy(isvisble);
          } else if (widget.scrollController!.position.userScrollDirection ==
              ScrollDirection.reverse) {
            isvisble = false;
            _navigationBarScreen.updateNavigationBarVisbltiy(isvisble);
          }

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
                      SizedBox(
                        height: 0.01,
                      ),
                      Divider(
                        height: 0,
                        color: containerColor,
                      ),
                      buildCarouselSliderForAds(),
                      SizedBox(
                        height: _height! / 40.6, //20
                      ),
                      StoreIconWidget(
                        storeIconList: _storeIconProvider!.stroeIconList,
                      ),
                      SizedBox(
                        height: _height! / 40.6,
                      ),
                      CategoryNameAndItsAds(
                        onPressedFunction: () {
                          _navigationBarScreen.setAllAdsTapping(true);
                          print(
                              "navigation index :${_navigationBarScreen.navigationIndex}");
                        },
                        rightText:
                            AppLocalizations.of(context)!.translate('all_ads'),
                        leftText:
                            AppLocalizations.of(context)!.translate('show_all'),
                      ),
                      SizedBox(
                        height: _height! / 40.6,
                      ),
                      ShowAdsListAccordingToCategory(
                        adsList: _adOnHomeScreenProvider!.adList,
                      ),
                      SizedBox(
                        height: _height! / 40.6,
                      ),
                      SmallText(text: "text"),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 15,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(text: "text"),
                              )),
                    ],
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

  Widget buildCarouselSliderForAds() {
    return Container(
      child: AdsCarouselSliderWidget(
        imgList: _sliderListProvider!.sliderImageList,
      ),
    );
  }
}
