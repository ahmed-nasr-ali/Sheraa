// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_question_mark, prefer_void_to_null

import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';

class AdEntity {
  int? id;
  String? name;
  String? description;
  String? price;
  int? views;
  String? type;
  List<String>? image;
  List<SingleSelectionEntity>? singleSelection;
  List<MultiSelectionEntity>? multiSelection;
  CategoryEntity? category;
  CountryEntity? country;
  CityEntity? city;
  AreaEntity? area;
  UserEntity? user;
  bool? hideContacts;
  bool? disableComments;
  String? createdAt;
  String? activeFrom;
  int? endedIn;
  bool? isFavorite;
  int? commentsCount;

  AdEntity({
    this.id,
    this.name,
    this.description,
    this.price,
    this.views,
    this.type,
    this.image,
    this.singleSelection,
    this.multiSelection,
    this.category,
    this.country,
    this.city,
    this.area,
    this.user,
    this.hideContacts,
    this.disableComments,
    this.createdAt,
    this.activeFrom,
    this.endedIn,
    this.isFavorite,
    this.commentsCount,
  });
}

class SingleSelectionEntity {
  int? optionId;
  String? optionName;
  int? featureId;
  String? featureName;

  SingleSelectionEntity({
    this.optionId,
    this.optionName,
    this.featureId,
    this.featureName,
  });
}

class MultiSelectionEntity {
  int? optionId;
  String? optionName;
  int? featureId;
  String? featureName;

  MultiSelectionEntity({
    this.optionId,
    this.optionName,
    this.featureId,
    this.featureName,
  });
}

class CategoryEntity {
  int? id;
  String? name;
  List<SubcategoriesEntity>? subcategories;

  CategoryEntity({
    this.id,
    this.name,
    this.subcategories,
  });
}

class SubcategoriesEntity {
  int? id;
  String? name;
  String? image;

  SubcategoriesEntity({
    this.id,
    this.name,
    this.image,
  });
}

class CountryEntity {
  int? id;
  String? name;
  String? code;
  String? key;
  bool? isDefault;
  dynamic? currency;
  String? flag;

  CountryEntity({
    this.id,
    this.name,
    this.code,
    this.key,
    this.isDefault,
    this.currency,
    this.flag,
  });
}

class CityEntity {
  int? id;
  String? name;

  CityEntity({
    this.id,
    this.name,
  });
}

class AreaEntity {
  int? id;
  String? name;

  AreaEntity({
    this.id,
    this.name,
  });
}
