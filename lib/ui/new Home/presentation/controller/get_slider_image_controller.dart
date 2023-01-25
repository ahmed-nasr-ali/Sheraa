import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/slider_entity.dart';
import 'package:sheraa/ui/new%20Home/presentation/providers/slider_image_provider.dart';

class SliderImageController {
  static getSliderImageList(BuildContext context) async {
    final _sliderImageProvider =
        Provider.of<SliderListProvider>(context, listen: false);

    if (_sliderImageProvider.sliderImageList.isEmpty) {
      List<SliderEntity> sliderImageList =
          await _sliderImageProvider.getsliderImageList(context);

      _sliderImageProvider.setDataToSliderImageList(sliderImageList);
      _sliderImageProvider.setLoading(false);
    }
  }
}
