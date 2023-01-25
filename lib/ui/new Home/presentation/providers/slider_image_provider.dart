import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/slider_entity.dart';

import 'package:sheraa/ui/new%20Home/domine/use%20case/get_slider_image_use_case.dart';

class SliderListProvider extends ChangeNotifier {
  GetSliderImageUseCase getSliderImageUseCase;

  SliderListProvider({
    required this.getSliderImageUseCase,
  });

  Future<List<SliderEntity>> getsliderImageList(BuildContext context) async {
    return await getSliderImageUseCase.call(context);
  }

  List<SliderEntity> _sliderImageList = [];

  List<SliderEntity> get sliderImageList => _sliderImageList;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  setDataToSliderImageList(List<SliderEntity> sliderImageList) {
    _sliderImageList.addAll(sliderImageList);

    print("slider Image List is : ${_sliderImageList.length}");
    notifyListeners();
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    print("isLoading is : $_isLoading");
    notifyListeners();
  }

  setAllDataToDefault() {
    _sliderImageList.clear();
    _isLoading = true;
  }
}
