import 'package:flutter/material.dart';

import 'package:sheraa/ui/more/my%20ads/new/data/data%20source/my_ads_remote_data_sourcse.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/repository/my_ad_repository.dart';

class MyAdsRepositoryIMP extends MyAdsRepository {
  MyAdsRemoteDataSource myAdsRemoteDataSource;

  MyAdsRepositoryIMP({
    required this.myAdsRemoteDataSource,
  });

  @override
  getActiveAds(BuildContext context, int pageNumber) async {
    return await myAdsRemoteDataSource.getMyActiveAds(context, pageNumber);
  }

  @override
  Future<bool> deleteAd(BuildContext context, int adId) async {
    return await myAdsRemoteDataSource.deleteAd(context, adId);
  }

  @override
  editAd(BuildContext context) {
    // TODO: implement editAd
    throw UnimplementedError();
  }

  @override
  getAdStatistics(BuildContext context) {
    // TODO: implement getAdStatistics
    throw UnimplementedError();
  }

  @override
  getRemainingSpecialAndVIPAds(BuildContext context) {
    // TODO: implement getRemainingSpecialAndVIPAds
    throw UnimplementedError();
  }

  @override
  getUnactiveAds(BuildContext context) {
    // TODO: implement getUnactiveAds
    throw UnimplementedError();
  }
}
