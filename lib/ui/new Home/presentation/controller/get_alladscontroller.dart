import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/all_ads_provider.dart';

class AdsController {
  static Future getAdsList(BuildContext context) async {
    final _adsprovider =
        Provider.of<AdOnHomeScreenProvider>(context, listen: false);

    if (_adsprovider.adList.isEmpty) {
      List<AdEntity> _adList = await _adsprovider.getAllAdsList(context);

      _adsprovider.setDataToAdListList(_adList);
      _adsprovider.setLoading(false);
    }
  }
}
