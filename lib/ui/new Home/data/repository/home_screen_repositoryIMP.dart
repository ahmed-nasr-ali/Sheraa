import 'package:flutter/material.dart';

import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/new%20Home/data/data%20source/home_screen_remote_data_source.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/slider_entity.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/store_icon_entity.dart';
import 'package:sheraa/ui/new%20Home/domine/repository/home_screen_repository.dart';

class HomeScreenRepositoryIMP extends HomeScreenRepository {
  HomeScreenRemoteDataSource homeScreenRemoteDataSource;

  HomeScreenRepositoryIMP({
    required this.homeScreenRemoteDataSource,
  });
  @override
  Future<List<SliderEntity>> getSliderImageList(BuildContext context) async {
    return await homeScreenRemoteDataSource.getSliderImage(context);
  }

  @override
  Future<List<StoreIConEntity>> getStoreIcon(BuildContext context) async {
    return await homeScreenRemoteDataSource.getStoreIcons(context);
  }

  @override
  Future<List<AdEntity>> getAllAdsList(BuildContext context) async {
    return await homeScreenRemoteDataSource.getAdsList(context);
  }

  @override
  Future<AdEntity> getSpecificAd(BuildContext context, String adId) async {
    return await homeScreenRemoteDataSource.getSpecificAd(context, adId);
  }
}
