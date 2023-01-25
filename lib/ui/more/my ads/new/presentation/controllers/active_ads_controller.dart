import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/providers/active_ads_provider.dart';

class MyActiveAdsController {
  static Future fetchData(BuildContext context, int pageNumber) async {
    final _myAdsProvider =
        Provider.of<MyActiveAdsProvider>(context, listen: false);

    List<AdEntity> myActiveAdsLIst =
        await _myAdsProvider.getMyActiveAds(context, pageNumber);

    print("normal call =================================");

    if (myActiveAdsLIst.length < 15) {
      _myAdsProvider.setPagenationApiLoading(false);
    }

    _myAdsProvider.clearMyActiveAdsList();

    _myAdsProvider.setDataToMyActiveAdsList(myActiveAdsLIst);

    _myAdsProvider.setIsLoading(false);
  }

  static Future pagenationApi(BuildContext context, int pageNumber) async {
    final _myActiveAdProvider =
        Provider.of<MyActiveAdsProvider>(context, listen: false);

    if (_myActiveAdProvider.noMoreData) {
    } else {
      if (_myActiveAdProvider.isFecthData) return;
      _myActiveAdProvider.setIsFetchingData(true);

      List<AdEntity> _newListofMyActiveAds =
          await _myActiveAdProvider.getMyActiveAds(context, pageNumber);

      if (_newListofMyActiveAds.length < 15) {
        _myActiveAdProvider.setNoMoreData(true);
        _myActiveAdProvider.setPagenationApiLoading(false);
      }
      _myActiveAdProvider.setDataToMyActiveAdsList(_newListofMyActiveAds);

      _myActiveAdProvider.setIsFetchingData(false);
    }
  }
}
