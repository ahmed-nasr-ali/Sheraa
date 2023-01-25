import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/ads_provider.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/providers/favorite%20ad/adding_ad_to_favorite_ad_list.dart';
import 'package:sheraa/providers/navigation_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/cities_screen/choose_citiy_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/main_category_screen/main_category_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/main_category_provider.dart';
import 'package:sheraa/ui/all_ads/filter_ads_screen.dart';
import 'package:sheraa/ui/all_ads/widgets/ad_item_horizontal.dart';
import 'package:sheraa/utils/app_colors.dart';

import 'widgets/search_bar.dart';
import '../../providers/favorite ad/adding_ad_to_favorite_ad_list.dart';

class AllAdsScreen extends StatefulWidget {
  const AllAdsScreen({Key? key}) : super(key: key);

  @override
  State<AllAdsScreen> createState() => _AllAdsScreenState();
}

class _AllAdsScreenState extends State<AllAdsScreen> {
  double _width = 0, _height = 0;

  bool _initalRun = true;
  AuthProvider? _authProvider;
  NavigationProvider? _navigationProvider;
  final TextEditingController searchController = TextEditingController();
  AdsProvider? _adsProvider;

  final controller = ScrollController();
  int bannerIndex = 0;
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    UserData.setAddingAdCountryId(0);
    UserData.setAddingAdAreaId(0);
    UserData.setMainCategoryId(0);
    UserData.setMainCategoryName("");
    //  controller.addListener(listenScrolling);
    controller.addListener(() {
      loadListenerScrolling();
    });
  }

  bool isTop = false;
  // _scrollListener() {
  //   if (controller.offset >= controller.position.maxScrollExtent &&
  //       !controller.position.outOfRange) {
  //     setState(() {
  //       isTop=false;
  //     String  message = "reach the bottom";
  //     });
  //   }
  //   if (controller.offset <= controller.position.minScrollExtent &&
  //       !controller.position.outOfRange) {
  //     setState(() {
  //     String  message = "reach the top";
  //     isTop=true;
  //     });
  //   }
  // }
  // void listenScrolling() {
  //   if (controller.position.atEdge) {
  //      isTop = controller.position.pixels == 0;
  //     setState((){});
  //     if (isTop) {
  //       print("tooop");
  //     } else {
  //       print('bottoooom');
  //     }
  //   }
  // }

  void loadListenerScrolling() {
    if (_adsProvider!.allAdsRefreshController.position!.userScrollDirection ==
        ScrollDirection.forward) {
      print('scroll');
      bool isvisble = true;

      _navigationProvider!.updateNavigationBarVisbltiy(isvisble);
    } else if (controller.position.userScrollDirection ==
        ScrollDirection.reverse) {
      bool isvisble = false;
      _navigationProvider!.updateNavigationBarVisbltiy(isvisble);
    }

    if (_adsProvider!.allAdsRefreshController.position!.pixels ==
        _adsProvider!.allAdsRefreshController.position!.maxScrollExtent) {
      print("come her");
    } else {
      print('noooo');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initalRun) {
      _authProvider = Provider.of<AuthProvider>(context);
      _adsProvider = Provider.of<AdsProvider>(context);
      _navigationProvider = Provider.of<NavigationProvider>(context);
      _initalRun = false;

      ///(api call من غير ما اعمل Ui عشان لو المستخدم ضاف الي اعلان لي اعلاناته المفضله احدث)
      ///(بستخدم الجزء دا في اي مكان بيظهر في الاعلانات زي)
      ///Home page , My ads , favorite Ad
      final _favoriteAdUpdateUiProvider =
          Provider.of<FavoriteAdUpdateUiProvider>(context, listen: false);

      _favoriteAdUpdateUiProvider.addingAdToFavoriteAdList.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

// filtering ads widget
  Widget adsFilter() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<MainCategoryProvider>(context, listen: false)
                  .setAllDateToDefault();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MainCategoryScreen(chooseDepartmentFilter: true)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/list.png"),
                SizedBox(
                  width: 5,
                ),
                SmallText(
                  text: "جميع الاقسام",
                  fontWeight: FontWeight.w700,
                  color: blackColor,
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 1,
            height: 20,
            color: grayColor,
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChooseCitiesScreen(fromFilter: true)
                      // ChooseCountryForAds(
                      //       fromFilter: true,
                      //     )
                      ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/location_city.png"),
                SizedBox(
                  width: 5,
                ),
                SmallText(
                  text: AppLocalizations.of(context)!.translate("city"),
                  fontWeight: FontWeight.w700,
                  color: blackColor,
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 1,
            height: 20,
            color: grayColor,
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FilterAdsScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/filter.png"),
                SizedBox(
                  width: 5,
                ),
                SmallText(
                  text: "فلترة",
                  fontWeight: FontWeight.w700,
                  color: blackColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

// serach results count

  Widget searchResultsData() {
    List<String> items = [
      "سيارات ومركبات",
      "سيارات ومركبات",
      "سيارات ومركبات",
      "سيارات ومركبات",
      "سيارات ومركبات"
    ];
    return Container(
      height: 70,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmallText(
                  text: "نتائج البحث  (${_adsProvider!.adsList.length})",
                  color: textGrayColor,
                  fontWeight: FontWeight.w300,
                ),
                InkWell(
                  onTap: () {
                    _adsProvider!.setChangingAdView();
                  },
                  child: Image.asset(
                    "assets/images/element_equal.png",
                    color: _adsProvider!.isChangingAdView == false
                        ? textGrayColor
                        : mainAppColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: accentColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        SmallText(
                          text: item,
                          size: 12,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.close,
                            size: 12,
                            color: textGrayColor,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }

  // AdsBody

  Widget adsBody() {
    return Column(
      children: [
        // searching ad
        isTop == false
            ? SearchBar(
                controller: searchController,
                hint: AppLocalizations.of(context)!
                    .translate("search_for_ads_to_buy"),
                prefixwidget: GestureDetector(
                  onTap: () {
                    print("search:${searchController.text}");
                  },
                  child: Image.asset('assets/images/search.png'),
                ), //30
                suffixwidget: Container(
                  // height: 10,
                  // width: 10,
                  margin: EdgeInsets.symmetric(horizontal: 10),

                  child: CircleAvatar(
                    radius: 5,
                    backgroundImage:
                        NetworkImage(_authProvider!.currentCountry.image),
                  ),
                ))
            : Container(),
        // ads filter by all departments, city, or all
        adsFilter(),
        Divider(),
        Column(
          children: [
            searchResultsData(),
            Divider(
              thickness: 5,
              color: accentColor,
            ),
          ],
        ),
        Expanded(
          child: Container(
            height: _height * 0.9,
            child:
                Consumer<AdsProvider>(builder: (context, adsProvider, child) {
              return SmartRefresher(
                  controller: adsProvider.allAdsRefreshController,
                  enablePullUp: true,
                  // enablePullDown: true,
                  physics: ScrollPhysics(),
                  onRefresh: () async {
                    print(" ads on refresh");
                    final result =
                        await adsProvider.getAllAds(context, isRefresh: true);
                    if (result) {
                      adsProvider.allAdsRefreshController.refreshCompleted();
                    } else {
                      adsProvider.allAdsRefreshController.refreshFailed();
                    }
                  },
                  onLoading: () async {
                    print(" ads on loading");
                    final result = await adsProvider.getAllAdsMoreData(context);
                    if (result) {
                      adsProvider.allAdsRefreshController.loadComplete();
                    } else {
                      adsProvider.allAdsRefreshController.loadFailed();
                    }
                  },
                  child: Builder(
                    builder: (BuildContext context) => NotificationListener<
                            ScrollUpdateNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          print("notific: ${scrollInfo.metrics.pixels} ");

                          if (scrollInfo is ScrollStartNotification) {
                            print(scrollInfo.metrics.atEdge);
                          }
                          if (controller.position.userScrollDirection ==
                              ScrollDirection.forward) {
                            print('scroll');
                            bool isvisble = true;

                            _navigationProvider!
                                .updateNavigationBarVisbltiy(isvisble);
                          } else if (controller.position.userScrollDirection ==
                              ScrollDirection.reverse) {
                            bool isvisble = false;
                            _navigationProvider!
                                .updateNavigationBarVisbltiy(isvisble);
                          }

                          if (scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                            print("come her");
                          } else {
                            print('noooo');
                          }
                          return true;
                        },
                        child: ListView.separated(
                          controller: controller,
                          shrinkWrap: true,
                          // physics: ScrollPhysics(),
                          itemCount: adsProvider.adsList.length,
                          itemBuilder: (context, index) {
                            final ad = adsProvider.adsList[index];
                            print("adslength:${adsProvider.adsList.length}");
                            bannerIndex = index + 1;

                            return Column(
                              children: [
                                Container(
                                    child: AdItemHorizontal(
                                  ad: ad,
                                )),
                                bannerIndex % 7 == 0
                                    ? Container(
                                        child: Image.asset(
                                          "assets/images/banner.png",
                                          fit: BoxFit.cover,
                                          width: _width,
                                          height: _height * .18,
                                        ),
                                      )
                                    : Container()
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: 5,
                              color: accentColor,
                            );
                          },
                        )),
                  ));
            }),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    print(searchController.text);
    return WillPopScope(
      onWillPop: () async => false,
      child: NetworkIndicator(
          child: PageContainer(
        child: Scaffold(
            appBar: CustomAppbar(
              hasCenterLogo: false,
              title: AppLocalizations.of(context)!.translate('ads'),
              hasBackBtn: true,
              backButtonAction: () {
                print("back");
                _navigationProvider!.setAllAdsTapping(false);

                //  _navigationProvider!.upadateNavigationIndex(0);

                // Navigator.pop(context);

                // setState(() {
                //
                // });
                // Navigator.pushNamed(context, '/bottom_navigation');
              },
            ),
            body: adsBody()),
      )),
    );
  }
}
