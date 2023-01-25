import 'package:sheraa/ui/adding%20ad/domin/entities/cities_entities.dart';

class CitiesModel extends CitiesEntity {
  CitiesModel({required int id, required String text})
      : super(id: id, text: text);

  factory CitiesModel.fromJson(Map<String, dynamic> json) {
    return CitiesModel(
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
