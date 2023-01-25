// ignore_for_file: unused_local_variable, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/providers/favorite%20ad/adding_ad_to_favorite_ad_list.dart';
import 'package:sheraa/ui/more/my%20ads/widgets/my_ad_body.dart';
import 'package:sheraa/utils/app_colors.dart';

class FavoriteAdsScreen extends StatefulWidget {
  const FavoriteAdsScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteAdsScreen> createState() => _FavoriteAdsScreenState();
}

class _FavoriteAdsScreenState extends State<FavoriteAdsScreen> {
  double? _height;

  double? _width;

  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<GetAllMyFavoriteAdsListProvider>(context, listen: false)
        .getMyFavoriteAdsList(context);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset("assets/images/arrow_simple_chock.png")),
            title: SmallText(
                color: blackColor,
                size: _height! / 50.75, //16
                typeOfFontWieght: 1,
                text: AppLocalizations.of(context)!.translate("Favorite Ads")),
          ),
          body: Column(
            children: [
              Divider(
                height: 0,
                color: containerColor,
              ),
              Expanded(child: buildMyFavoriteAdsList())
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMyFavoriteAdsList() {
    return Consumer<GetAllMyFavoriteAdsListProvider>(
        builder: (context, value, child) {
      return value.isLoading
          ? SpinKitFadingCircle(color: mainAppColor)
          : buildListOfFavoriteAds(value.myFavoriteAdsList);
    });
  }

  Widget buildListOfFavoriteAds(List<Ad> _myFavoriteAdList) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          height: 0,
          thickness: _height! / 135.3333333333333, //10
          color: secondryMainColor,
        );
      },
      itemCount: _myFavoriteAdList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => SpecificAdScreenDetails(
            //       pageName:
            //           "notmoreInformation", //moreInformation (second case)
            //       isMyAd: false,
            //       adDetails: _myFavoriteAdList[index],
            //     ),
            //   ),
            // );
          },
          child: MyAdBody(
            isHeartAppear: true,
            isFavorteAd: true,
            adDetails: _myFavoriteAdList[index],
            isEffectiveAd: true,
          ),
        );
      },
    );
  }
}
