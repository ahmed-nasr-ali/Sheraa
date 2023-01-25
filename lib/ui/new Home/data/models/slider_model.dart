import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/new%20Home/domine/entity/slider_entity.dart';

class SliderModel extends SliderEntity {
  SliderModel(
      {required int id,
      required String name,
      required String url,
      required String image})
      : super(id: id, name: name, url: url, image: image);

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json["id"],
      name: json["name"],
      url: json["url"],
      image: json["image"],
    );
  }
}
