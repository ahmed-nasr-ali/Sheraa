import 'package:sheraa/ui/adding%20ad/domin/entities/area_entity.dart';

class AreaModel extends AreaEntity {
  AreaModel({required int id, required String text})
      : super(id: id, text: text);

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['text'] = text;
    return data;
  }
}
