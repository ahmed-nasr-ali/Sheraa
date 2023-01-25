import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/add_ads_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/area_entity.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/ad%20name%20and%20describtion%20screen/ad_name_and_describtion_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_area_provider.dart';

import '../../../../providers/ads_provider.dart';

class AddingAdAreaController {
  static Future fetchData(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    final _areaProvider =
        Provider.of<AddingAdAreaProvider>(context, listen: false);

    List<AreaEntity> _areasList = await _areaProvider.getAreaList(
        context, pageNumber, isSearching, searchingText);

    if (isSearching) {
      print("normal searching call =================================");

      _areaProvider.clearSearchingAreaList();

      _areaProvider.setDataToSearchingAreaList(_areasList);
    } else {
      print("normal call =================================");

      if (_areasList.length < 15) {
        _areaProvider.setPagenationApiLoading(false);
      }

      _areaProvider.clearAreaList();

      _areaProvider.setDataToAreaList(_areasList);

      _areaProvider.setIsLoading(false);
    }
  }

  static Future pagenationApi(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    final _areaProvider =
        Provider.of<AddingAdAreaProvider>(context, listen: false);

    if (_areaProvider.noMoreData) {
    } else {
      if (_areaProvider.isFecthData) return;
      _areaProvider.setIsFetchingData(true);

      List<AreaEntity> _newAreaList = await _areaProvider.getAreaList(
          context, pageNumber, isSearching, searchingText);

      if (_newAreaList.length < 15) {
        _areaProvider.setNoMoreData(true);
        _areaProvider.setPagenationApiLoading(false);
      }
      _areaProvider.setDataToAreaList(_newAreaList);

      _areaProvider.setIsFetchingData(false);
    }
  }

  static Future searchingPagenationApi(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    final _areaProvider =
        Provider.of<AddingAdAreaProvider>(context, listen: false);

    if (_areaProvider.noMoreSearchingData) {
    } else {
      //(scroll و انا بعمل request اول سطرين عشان مايعملش 2)
      if (_areaProvider.isFetchingSearchingData) return;
      _areaProvider.setIsFetchingSearchingData(true);

      List<AreaEntity> _newSearchingAreaPagenationList = await _areaProvider
          .getAreaList(context, pageNumber, isSearching, searchingText);

      if (_newSearchingAreaPagenationList.length < 15) {
        _areaProvider.setNoMoreSearchingData(true);
        _areaProvider.setSearchingPagenationApiLoading(false);
      }
      _areaProvider.setDataToSearchingAreaList(_newSearchingAreaPagenationList);

      _areaProvider.setIsFetchingSearchingData(false);
    }
  }

  static onTapOnCategoryAction(
      BuildContext context, String areaName, int areaId, bool fromFilter) {
    UserData.setAddingAdAreaId(areaId);

    print(UserData.getAddingAdAreaId());

    Provider.of<AdsProvider>(context, listen: false).setCityId(areaId);

    Provider.of<AdsProvider>(context, listen: false).setCityName(areaName);

    Provider.of<AddOptionsIdAndFeatureName>(context, listen: false)
        .addAdsOpptionName(
      {
        "Feature_Name": AppLocalizations.of(context)!.translate("Area"),
        "Selected_Name": areaName
      },
      AppLocalizations.of(context)!.translate("Area"),
    );

    print("show opption name");
    print(Provider.of<AddOptionsIdAndFeatureName>(context, listen: false)
        .opttinName);

    if (fromFilter) {
      Navigator.pop(context);
    } else {
      UserData.setAdsName("");
      UserData.setAdsDescribtion("");

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AdNameAndDescribtionScreen()));
    }
  }
}
