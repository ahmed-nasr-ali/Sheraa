import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/providers/ads_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/main_category_entity.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/sub_category_screen/sub_category_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/main_category_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/sub_category_provider.dart';

class MainCategoryController {
  static Future fetchData(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    final _mainCategoryProvider =
        Provider.of<MainCategoryProvider>(context, listen: false);

    List<MainCategoryEntity> _mainCategoryList = await _mainCategoryProvider
        .getMainCategoryList(context, pageNumber, isSearching, searchingText);

    if (isSearching) {
      print("normal searching call =================================");

      _mainCategoryProvider.clearSearchingMainCategoryList();

      _mainCategoryProvider
          .setDataToSearchingMainCategoryList(_mainCategoryList);
    } else {
      print("normal call =================================");

      if (_mainCategoryList.length < 15) {
        _mainCategoryProvider.setPagenationApiLoading(false);
      }

      _mainCategoryProvider.clearMainCategoryList();

      _mainCategoryProvider.setDataToMainCategoryList(_mainCategoryList);

      _mainCategoryProvider.setIsLoading(false);
    }
  }

  static Future pagenationApi(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    final _mainCategoryProvider =
        Provider.of<MainCategoryProvider>(context, listen: false);

    if (_mainCategoryProvider.noMoreData) {
    } else {
      //(scroll و انا بعمل request اول سطرين عشان مايعملش 2)
      if (_mainCategoryProvider.isFecthData) return;
      _mainCategoryProvider.setIsFetchingData(true);

      List<MainCategoryEntity> _newMainCategoryList =
          await _mainCategoryProvider.getMainCategoryList(
              context, pageNumber, isSearching, searchingText);

      if (_newMainCategoryList.length < 15) {
        _mainCategoryProvider.setNoMoreData(true);
        _mainCategoryProvider.setPagenationApiLoading(false);
      }
      _mainCategoryProvider.setDataToMainCategoryList(_newMainCategoryList);

      _mainCategoryProvider.setIsFetchingData(false);
    }
  }

  static Future searchingPagenationApi(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    final _mainCategoryProvider =
        Provider.of<MainCategoryProvider>(context, listen: false);

    if (_mainCategoryProvider.noMoreSearchingData) {
    } else {
      //(scroll و انا بعمل request اول سطرين عشان مايعملش 2)
      if (_mainCategoryProvider.isFetchingSearchingData) return;
      _mainCategoryProvider.setIsFetchingSearchingData(true);

      List<MainCategoryEntity> _newSearchingMainCategoryPagenationList =
          await _mainCategoryProvider.getMainCategoryList(
              context, pageNumber, isSearching, searchingText);

      if (_newSearchingMainCategoryPagenationList.length < 15) {
        _mainCategoryProvider.setNoMoreSearchingData(true);
        _mainCategoryProvider.setSearchingPagenationApiLoading(false);
      }
      _mainCategoryProvider.setDataToSearchingMainCategoryList(
          _newSearchingMainCategoryPagenationList);

      _mainCategoryProvider.setIsFetchingSearchingData(false);
    }
  }

  static onTapOnCategoryAction(BuildContext context, String categoryName,
      int categoryId, bool chooseDepartmentForFilter) {
    UserData.setMainCategoryId(categoryId);
    UserData.setMainCategoryName(categoryName);

    print(UserData.getMainCategoryId());

    print(UserData.getMainCategoryName());

    Provider.of<AdsProvider>(context, listen: false)
        .setDepartmentId(categoryId);

    Provider.of<AdsProvider>(context, listen: false)
        .setDepartmentName(categoryName);

    UserData.setSubCategoryId(0);

    UserData.setSubCategoryName("");

    Provider.of<SubCategoryProvider>(context, listen: false)
        .setAllDateToDefault();

    if (chooseDepartmentForFilter) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SubCategoryScreen(
                  chooseSubDepartmentFilter: chooseDepartmentForFilter,
                  mainCategoryId: UserData.getMainCategoryId(),
                )),
      );
    } else
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubCategoryScreen(
            chooseSubDepartmentFilter: chooseDepartmentForFilter,
            mainCategoryId: UserData.getMainCategoryId(),
          ),
        ),
      );
  }
}
