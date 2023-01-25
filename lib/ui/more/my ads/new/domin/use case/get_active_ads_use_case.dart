import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/repository/my_ad_repository.dart';

class MyAdsGetActiveAdsUseCase {
  MyAdsRepository myAdsRepository;

  MyAdsGetActiveAdsUseCase({
    required this.myAdsRepository,
  });

  Future<List<AdEntity>> call(BuildContext context, int pageNumber) async {
    return await myAdsRepository.getActiveAds(context, pageNumber);
  }
}
