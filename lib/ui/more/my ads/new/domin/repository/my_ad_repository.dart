import 'package:flutter/material.dart';

abstract class MyAdsRepository {
  getActiveAds(BuildContext context, int pageNumber);

  getUnactiveAds(BuildContext context);

  getRemainingSpecialAndVIPAds(BuildContext context);

  getAdStatistics(BuildContext context);

  Future<bool> deleteAd(BuildContext context, int adId);

  editAd(BuildContext context);
}
