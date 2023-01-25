import 'package:flutter/cupertino.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/area_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/cities_entities.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/feature_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/feature_options_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/main_category_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/sub_category_entity.dart';

abstract class AddingAdRepository {
  Future<List<MainCategoryEntity>> getMainCategoryList(BuildContext context,
      int pageNumber, bool isSearching, String searchingText);

  Future<List<SubCategoryEntity>> getSubCategoryList(
      int mainCategoryId,
      BuildContext context,
      int pageNumber,
      bool isSearching,
      String searchingText);

  Future<List<CitiesEntity>> getCitiesList(BuildContext context, int pageNumber,
      bool isSearching, String searchingText);

  Future<List<AreaEntity>> getAreasList(BuildContext context, int pageNumber,
      bool isSearching, String searchingText);

  Future<List<FeatureEntity>> getFeatureList(
      BuildContext context, int pageNumber, int categoryId);

  Future<List<FeatureOptionEntity>> getFeatureOptionList(
      BuildContext context, int pageNumber, int featureId);

  Future<bool> addingAdMethod(BuildContext context, Map<String, dynamic> body);
}
