import 'package:sheraa/ui/adding%20ad/domin/entities/feature_entity.dart';

class FeatureModel extends FeatureEntity {
  FeatureModel(
      {required int id, required String name, required String selectionType})
      : super(id: id, name: name, selectionType: selectionType);

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
        id: json['id'],
        name: json['name'],
        selectionType: json["selection_type"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data["selection_type"] = selectionType;
    return data;
  }
}
