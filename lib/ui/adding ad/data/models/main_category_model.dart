import 'package:sheraa/ui/adding%20ad/domin/entities/main_category_entity.dart';

class MainCategoryModel extends MainCategoryEntity {
  MainCategoryModel({required int id, required String name})
      : super(id: id, name: name);

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) {
    return MainCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
