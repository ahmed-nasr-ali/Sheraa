import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/store_icon_entity.dart';
import 'package:sheraa/ui/new%20Home/domine/repository/home_screen_repository.dart';

class StoreIconsUseCase {
  HomeScreenRepository homeScreenRepository;

  StoreIconsUseCase({
    required this.homeScreenRepository,
  });

  Future<List<StoreIConEntity>> call(BuildContext context) async {
    return await homeScreenRepository.getStoreIcon(context);
  }
}
