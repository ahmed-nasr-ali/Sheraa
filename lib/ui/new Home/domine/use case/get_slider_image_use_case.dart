import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/slider_entity.dart';
import 'package:sheraa/ui/new%20Home/domine/repository/home_screen_repository.dart';

class GetSliderImageUseCase {
  HomeScreenRepository homeScreenRepository;

  GetSliderImageUseCase({
    required this.homeScreenRepository,
  });

  Future<List<SliderEntity>> call(BuildContext context) async {
    return await homeScreenRepository.getSliderImageList(context);
  }
}
