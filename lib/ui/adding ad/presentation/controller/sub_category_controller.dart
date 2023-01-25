// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/add_ads_provider.dart';
import 'package:sheraa/providers/ads_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/sub_category_entity.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/feature_screen/feature_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/sub_category_provider.dart';

class SubCategoryController {
  static Future fetchData(int mainCategoryId, BuildContext context,
      int pageNumber, bool isSearching, String searchingText) async {
    final _subCategoryProvider =
        Provider.of<SubCategoryProvider>(context, listen: false);

    final _subCategoryList = await _subCategoryProvider.getSubCategoryList(
        mainCategoryId, context, pageNumber, isSearching, searchingText);

    if (isSearching) {
      print("normal searching call =================================");

      _subCategoryProvider.clearSearchingSubCategoryList();

      _subCategoryProvider.setDataToSearchingSubCategoryList(_subCategoryList);
    } else {
      print("normal call =================================");
      if (_subCategoryList.length < 15) {
        _subCategoryProvider.setPagenationApiLoading(false);
      }

      _subCategoryProvider.clearSubCategoryList();

      _subCategoryProvider.setDataToSubCategoryList(_subCategoryList);

      _subCategoryProvider.setIsLoading(false);
    }
  }

  static Future pagenationApi(int mainCategoryId, BuildContext context,
      int pageNumber, bool isSearching, String searchingText) async {
    final _subCategoryProvider =
        Provider.of<SubCategoryProvider>(context, listen: false);

    if (_subCategoryProvider.noMoreData) {
    } else {
      //(scroll و انا بعمل request اول سطرين عشان مايعملش 2)
      if (_subCategoryProvider.isFecthData) return;
      _subCategoryProvider.setIsFetchingData(true);

      List<SubCategoryEntity> _newSubCategoryList =
          await _subCategoryProvider.getSubCategoryList(
              mainCategoryId, context, pageNumber, isSearching, searchingText);

      if (_newSubCategoryList.length < 15) {
        _subCategoryProvider.setNoMoreData(true);
        _subCategoryProvider.setPagenationApiLoading(false);
      }
      _subCategoryProvider.setDataToSubCategoryList(_newSubCategoryList);

      _subCategoryProvider.setIsFetchingData(false);
    }
  }

  static Future searchingPagenationApi(int mainCategoryId, BuildContext context,
      int pageNumber, bool isSearching, String searchingText) async {
    final _subCategoryProvider =
        Provider.of<SubCategoryProvider>(context, listen: false);

    if (_subCategoryProvider.noMoreSearchingData) {
    } else {
      //(scroll و انا بعمل request اول سطرين عشان مايعملش 2)
      if (_subCategoryProvider.isFetchingSearchingData) return;
      _subCategoryProvider.setIsFetchingSearchingData(true);

      List<SubCategoryEntity> _newSearchingSubCategoryPagenationList =
          await _subCategoryProvider.getSubCategoryList(
              mainCategoryId, context, pageNumber, isSearching, searchingText);

      if (_newSearchingSubCategoryPagenationList.length < 15) {
        _subCategoryProvider.setNoMoreSearchingData(true);
        _subCategoryProvider.setSearchingPagenationApiLoading(false);
      }
      _subCategoryProvider.setDataToSearchingSubCategoryList(
        _newSearchingSubCategoryPagenationList,
      );

      _subCategoryProvider.setIsFetchingSearchingData(false);
    }
  }

  static onTapOnCategoryAction(BuildContext context, String categoryName,
      int categoryId, bool chooseDepartmentForFilter) {
    Provider.of<AdsProvider>(context, listen: false)
        .setSubDepartmentId(categoryId);

    Provider.of<AdsProvider>(context, listen: false)
        .setSubDepartmentName(categoryName);

    UserData.setSubCategoryId(categoryId);

    UserData.setSubCategoryName(categoryName);

    print("=================================");

    print(UserData.getSubCategoryId());

    print(UserData.getSubCategoryName());

    Provider.of<AddOptionsIdAndFeatureName>(context, listen: false)
        .setAllDataToDefault();

    Provider.of<FeatureProvider>(context, listen: false).setAllDateToDefault();

    Provider.of<FeatureProvider>(context, listen: false)
        .setCheckFeatureSelecttoDefault();

    if (chooseDepartmentForFilter == true) {
      Navigator.pop(context);
    } else
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FeatureScreen(categoryId: categoryId)),
      );
    UserData.setAddingAdAreaId(0);
    UserData.setAddingAdCountryId(0);
  }
}
