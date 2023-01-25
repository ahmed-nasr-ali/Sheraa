import 'package:flutter/material.dart';

import 'package:sheraa/ui/adding%20ad/data/data%20source/adding_ad_remote_data_source.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/cities_entities.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/area_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/feature_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/feature_options_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/main_category_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/sub_category_entity.dart';
import 'package:sheraa/ui/adding%20ad/domin/repository/adding_ad_repository.dart';

class AddingAdRepositoryIMP implements AddingAdRepository {
  AddingAdRemoteDataSource adRemoteDataSource;
  AddingAdRepositoryIMP({
    required this.adRemoteDataSource,
  });
  @override
  Future<List<MainCategoryEntity>> getMainCategoryList(BuildContext context,
      int pageNumber, bool isSearching, String searchingText) async {
    return await adRemoteDataSource.getMainCategoryList(
        context, pageNumber, isSearching, searchingText);
  }

  @override
  Future<List<SubCategoryEntity>> getSubCategoryList(
      int mainCategoryId,
      BuildContext context,
      int pageNumber,
      bool isSearching,
      String searchingText) async {
    return await adRemoteDataSource.getSubCategoryList(
        mainCategoryId, context, pageNumber, isSearching, searchingText);
  }

  @override
  Future<List<AreaEntity>> getAreasList(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    return await adRemoteDataSource.getAreasList(
        context, pageNumber, isSearching, searchingText);
  }

  @override
  Future<List<CitiesEntity>> getCitiesList(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    return await adRemoteDataSource.getCitiesList(
        context, pageNumber, isSearching, searchingText);
  }

  @override
  Future<List<FeatureEntity>> getFeatureList(
      BuildContext context, int pageNumber, int categoryId) async {
    return await adRemoteDataSource.getFeatureList(
        context, pageNumber, categoryId);
  }

  @override
  Future<List<FeatureOptionEntity>> getFeatureOptionList(
      BuildContext context, int pageNumber, int featureId) async {
    return await adRemoteDataSource.getFeatureOptionList(
        context, pageNumber, featureId);
  }

  @override
  Future<bool> addingAdMethod(
      BuildContext context, Map<String, dynamic> body) async {
    return await adRemoteDataSource.addingAdMethod(context, body);
  }
}
