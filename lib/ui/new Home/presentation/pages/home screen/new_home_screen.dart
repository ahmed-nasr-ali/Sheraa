// ignore_for_file: unused_field, body_might_complete_normally_nullable, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/searching%20bar/seaarching_bar.dart';
import 'package:sheraa/deep%20link/firebase_dynamic_link.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/firebase%20notifications/firebase_notification.dart';
import 'package:sheraa/providers/follow%20methods/follow_methods.dart';
import 'package:sheraa/ui/new%20Home/presentation/pages/ads%20screen/ads_screen.dart';
import 'package:sheraa/ui/new%20Home/presentation/controller/get_alladscontroller.dart';
import 'package:sheraa/ui/new%20Home/presentation/controller/get_slider_image_controller.dart';
import 'package:sheraa/ui/new%20Home/presentation/controller/get_store_iocns_controller.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/all_ads_provider.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/slider_image_provider.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/store_icon_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

/// changes begin here
class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  ScrollController _scrollController = ScrollController();

  late FocusNode _searchFocusNode;

  final TextEditingController searchController = TextEditingController();

  double? _height;

  double? _width;

  Future fetchAllHomeScreenData() async {
    await SliderImageController.getSliderImageList(context);

    await StoreIconController.getStoreIconImageList(context);

    await AdsController.getAdsList(context);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _searchFocusNode = FocusNode();

    CreateFirebaseDynamicLink.initDynamicLink(context);

    ///Notification in case app is open
    FirebaseNotifcationMessages.reciveNotifactionWhenAppIsOpen(context);

    ///Notification in case app is on BackGround
    FirebaseNotifcationMessages.onTapOnNotificationWhenAppOnBackground(context);

    ///Notification in case app is Teremnated
    FirebaseNotifcationMessages.onTapOnNotificationWhenAppInTermenated(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<FollowMethodsProvider>(context, listen: false)
        .followedUser
        .clear();

    fetchAllHomeScreenData();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: NetworkIndicator(
        child: Scaffold(
          body: NestedScrollView(
            controller: _scrollController,
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
                  title: SearchingBar(
                    isHome: true,
                    searchFocusNode: _searchFocusNode,
                    searchController: searchController,
                  ),
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
                        text: AppLocalizations.of(context)!.translate('ads'),
                      ),
                      Tab(
                        text: AppLocalizations.of(context)!.translate('stores'),
                      )
                    ],
                  ),
                ),
              ),
            ],
            body: TabBarView(
              children: [
                buildAdsScreenMethod(),
                Center(child: SmallText(text: "Store")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAdsScreenMethod() {
    final _adOnHomeScreenProvider =
        Provider.of<AdOnHomeScreenProvider>(context, listen: false);

    final _storeIconProvider =
        Provider.of<StoreIconProvider>(context, listen: false);

    final _sliderListProvider =
        Provider.of<SliderListProvider>(context, listen: false);

    if (_adOnHomeScreenProvider.isLoading == true &&
        _storeIconProvider.isLoading == true &&
        _sliderListProvider.isLoading == true) {
      return Center(
        child: SpinKitFadingCircle(color: mainAppColor),
      );
    } else {
      return AdsScreen(
        scrollController: _scrollController,
      );
    }
  }
}
