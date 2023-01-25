import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/new%20Home/domine/repository/home_screen_repository.dart';

class GetSpecificAdUseCase {
  HomeScreenRepository homeScreenRepository;
  GetSpecificAdUseCase({
    required this.homeScreenRepository,
  });

  Future<AdEntity> call(BuildContext context, String adId) async {
    return await homeScreenRepository.getSpecificAd(context, adId);
  }
}
