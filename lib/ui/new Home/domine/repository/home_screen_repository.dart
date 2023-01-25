import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/slider_entity.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/store_icon_entity.dart';

abstract class HomeScreenRepository {
  Future<List<SliderEntity>> getSliderImageList(BuildContext context);

  Future<List<StoreIConEntity>> getStoreIcon(BuildContext context);

  Future<List<AdEntity>> getAllAdsList(BuildContext context);

  Future<AdEntity> getSpecificAd(BuildContext context, String adId);
}
