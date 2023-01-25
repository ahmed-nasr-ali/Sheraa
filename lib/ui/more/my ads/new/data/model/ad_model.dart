import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/ui/more/user%20profile/data/model/user_model.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/ui/specific%20ad/data/models/comment_model.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/comments_entity.dart';

class AdModel extends AdEntity {
  AdModel({
    int? id,
    String? name,
    String? description,
    String? price,
    int? views,
    String? type,
    List<String>? image,
    List<SingleSelectionEntity>? singleSelection,
    List<MultiSelectionEntity>? multiSelection,
    CategoryEntity? category,
    CountryEntity? country,
    CityEntity? city,
    AreaEntity? area,
    UserEntity? user,
    bool? hideContacts,
    bool? disableComments,
    String? createdAt,
    String? activeFrom,
    int? endedIn,
    bool? isFavorite,
    int? commentsCount,
  }) : super(
          id: id,
          name: name,
          description: description,
          price: price,
          views: views,
          type: type,
          image: image,
          singleSelection: singleSelection,
          multiSelection: multiSelection,
          category: category,
          country: country,
          city: city,
          area: area,
          user: user,
          hideContacts: hideContacts,
          disableComments: disableComments,
          createdAt: createdAt,
          activeFrom: activeFrom,
          endedIn: endedIn,
          isFavorite: isFavorite,
          commentsCount: commentsCount,
        );

  factory AdModel.fromJson(Map<String, dynamic> json) {
    List<SingleSelectionModel> singleSelection = <SingleSelectionModel>[];
    if (json['single_selection'] != null) {
      json['single_selection'].forEach((v) {
        singleSelection.add(SingleSelectionModel.fromJson(v));
      });
    }
    List<MultiSelectionModel> multiSelection = <MultiSelectionModel>[];
    if (json['multi_selection'] != null) {
      json['multi_selection'].forEach((v) {
        multiSelection.add(MultiSelectionModel.fromJson(v));
      });
    }

    return AdModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      views: json['views'],
      type: json['type'],
      image: json['image'].cast<String>(),
      singleSelection: singleSelection,
      multiSelection: multiSelection,
      category: CategoryModel.fromJson(json['category']),
      country: CountryModel.fromJson(json['country']),
      city: CityModel.fromJson(json['city']),
      area: AreaModel.fromJson(json['area']),
      user: UserModel.fromJson(json['user']),
      hideContacts: json['hide_contacts'],
      disableComments: json['disable_comments'],
      createdAt: json['created_at'],
      activeFrom: json['active_from'],
      endedIn: json['ended_in'],
      isFavorite: json['is_favorite'],
      commentsCount: json['comments_count'],
    );
  }
}

class SingleSelectionModel extends SingleSelectionEntity {
  SingleSelectionModel(
      {int? optionId, String? optionName, int? featureId, String? featureName})
      : super(
            optionId: optionId,
            optionName: optionName,
            featureId: featureId,
            featureName: featureName);

  factory SingleSelectionModel.fromJson(Map<String, dynamic> json) {
    return SingleSelectionModel(
      optionId: json['option_id'],
      optionName: json['option_name'],
      featureId: json['feature_id'],
      featureName: json['feature_name'],
    );
  }
}

class MultiSelectionModel extends MultiSelectionEntity {
  MultiSelectionModel(
      {int? optionId, String? optionName, int? featureId, String? featureName})
      : super(
            optionId: optionId,
            optionName: optionName,
            featureId: featureId,
            featureName: featureName);

  factory MultiSelectionModel.fromJson(Map<String, dynamic> json) {
    return MultiSelectionModel(
      optionId: json['option_id'],
      optionName: json['option_name'],
      featureId: json['feature_id'],
      featureName: json['feature_name'],
    );
  }
}

class CategoryModel extends CategoryEntity {
  CategoryModel(
      {int? id, String? name, List<SubcategoriesEntity>? subcategories})
      : super(id: id, name: name, subcategories: subcategories);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    List<SubcategoriesModel> subcategories = <SubcategoriesModel>[];
    json['subcategories'].forEach((v) {
      subcategories.add(SubcategoriesModel.fromJson(v));
    });
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      subcategories: subcategories,
    );
  }
}

class SubcategoriesModel extends SubcategoriesEntity {
  SubcategoriesModel({
    int? id,
    String? name,
    String? image,
  }) : super(id: id, name: name, image: image);

  factory SubcategoriesModel.fromJson(Map<String, dynamic> json) {
    return SubcategoriesModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class CountryModel extends CountryEntity {
  CountryModel(
      {int? id,
      String? name,
      String? code,
      String? key,
      bool? isDefault,
      currency,
      String? flag})
      : super(
            id: id,
            name: name,
            code: code,
            key: key,
            isDefault: isDefault,
            currency: currency,
            flag: flag);

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      key: json['key'],
      isDefault: json['is_default'],
      currency: json['currency'],
      flag: json['flag'],
    );
  }
}

class CityModel extends CityEntity {
  CityModel({int? id, String? name}) : super(id: id, name: name);

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
    );
  }
}

class AreaModel extends AreaEntity {
  AreaModel({
    int? id,
    String? name,
  }) : super(id: id, name: name);

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
    );
  }
}
