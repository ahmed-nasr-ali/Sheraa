import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/new%20Home/domine/repository/home_screen_repository.dart';

class GetAllAdsUseCase {
  HomeScreenRepository homeScreenRepository;

  GetAllAdsUseCase({
    required this.homeScreenRepository,
  });

  Future<List<AdEntity>> call(BuildContext context) async {
    return await homeScreenRepository.getAllAdsList(context);
  }
}
