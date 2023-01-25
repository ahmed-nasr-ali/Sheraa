import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/more/my%20ads/new/domin/repository/my_ad_repository.dart';

class DeleteMyAdUseCase {
  MyAdsRepository myAdsRepository;

  DeleteMyAdUseCase({
    required this.myAdsRepository,
  });

  Future<bool> call(BuildContext context, int adId) async {
    return await myAdsRepository.deleteAd(context, adId);
  }
}
