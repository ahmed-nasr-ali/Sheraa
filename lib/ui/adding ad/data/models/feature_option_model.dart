import 'package:sheraa/ui/adding%20ad/domin/entities/feature_options_entity.dart';

class FeatureOptionModel extends FeatureOptionEntity {
  FeatureOptionModel(
      {required int id, required String text, required String imgUrl})
      : super(id: id, text: text, imgUrl: imgUrl);

  factory FeatureOptionModel.fromJson(Map<String, dynamic> json) {
    return FeatureOptionModel(
      id: json['id'],
      text: json['text'],
      imgUrl: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['text'] = text;
    data['image'] = imgUrl;
    return data;
  }
}
