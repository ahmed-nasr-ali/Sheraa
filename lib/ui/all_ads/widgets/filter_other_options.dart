import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/ads_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class FilterOtherOptions extends StatefulWidget {
  const FilterOtherOptions({Key? key}) : super(key: key);

  @override
  State<FilterOtherOptions> createState() => _FilterOtherOptionsState();
}

class _FilterOtherOptionsState extends State<FilterOtherOptions> {
  double _width = 0, _height = 0;
  AdsProvider? _adsProvider;
 bool _initialRun=true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _adsProvider = Provider.of<AdsProvider>(context);

      _initialRun = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Container(
            margin:EdgeInsets.symmetric(horizontal: _width*0.02,) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                    Text(
                  AppLocalizations.of(context)!.translate("Favorite Ads"),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),

                     Switch(
                  value: _adsProvider!.adsFavoriteIsSwitched,
                  onChanged: _adsProvider!.setAdsFavoriteSwitcher,
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: mainAppColor,
                )

              ],
            ),
          ),
         Divider(
           indent: 5,
         ),  Container(
            margin:EdgeInsets.symmetric(horizontal: _width*0.02,) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.translate("ads_with_images"),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                Switch(
                  value: _adsProvider!.adsWithImagesIsSwitched,
                  onChanged: _adsProvider!.setAdsWithImagesIsSwitcher,
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: mainAppColor,
                )

              ],
            ),
          ),
          Divider(
            indent: 5,
          ),  Container(
            margin:EdgeInsets.symmetric(horizontal: _width*0.02,) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  AppLocalizations.of(context)!.translate("ads_with_price"),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),

                Switch(
                  value: _adsProvider!.adsWithPriceIsSwitched,
                  onChanged: _adsProvider!.setAdsWithPriceIsSwitcher,
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: mainAppColor,
                )

              ],
            ),
          ),
          Divider(
            indent: 5,
          ),  Container(
            margin:EdgeInsets.symmetric(horizontal: _width*0.02,) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  AppLocalizations.of(context)!.translate("members_ads"),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),


                Switch(
                  value: _adsProvider!.membersAdsIsSwitched,
                  onChanged: _adsProvider!.setMembersAdIsSwitcher,
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: mainAppColor,
                )

              ],
            ),
          ),
          Divider(
            indent: 5,
          ),  Container(
            margin:EdgeInsets.symmetric(horizontal: _width*0.02,) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                Text(
                  AppLocalizations.of(context)!.translate("stores_ads"),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),


                Switch(
                  value: _adsProvider!.storesAdsIsSwitched,
                  onChanged: _adsProvider!.setStoresAdIsSwitcher,
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: mainAppColor,
                )

              ],
            ),
          ),
          Divider(
            indent: 5,
          ),  Container(
            margin:EdgeInsets.symmetric(horizontal: _width*0.02,) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                Text(
                  AppLocalizations.of(context)!.translate("featured_ads"),
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),


                Switch(
                  value: _adsProvider!.featuredAdsIsSwitched,
                  onChanged: _adsProvider!.setFeaturedAdsIsSwitcher,
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: mainAppColor,
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
}
