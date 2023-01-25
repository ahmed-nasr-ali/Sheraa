import 'package:sheraa/ui/new%20Home/domine/entity/store_icon_entity.dart';

class StoreIconModel extends StoreIConEntity {
  StoreIconModel({required int id, required String store, required String icon})
      : super(id: id, store: store, icon: icon);

  factory StoreIconModel.fromJson(Map<String, dynamic> json) {
    return StoreIconModel(
      id: json['id'],
      store: json['store'],
      icon: json['icon'],
    );
  }
}
