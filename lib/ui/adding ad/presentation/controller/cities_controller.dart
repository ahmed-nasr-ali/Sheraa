import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/add_ads_provider.dart';
import 'package:sheraa/providers/ads_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/cities_entities.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/area_screen/choose_area_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_area_provider.dart';

import '../provider/adding_ad_cities_provider.dart';

class AddingAdCitiesController {
  static Future fetchData(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    final _citiesProvider =
        Provider.of<AddingAdCitiesProvider>(context, listen: false);

    List<CitiesEntity> _areasList = await _citiesProvider.getCitiesList(
        context, pageNumber, isSearching, searchingText);

    if (isSearching) {
      print("normal searching call =================================");

      _citiesProvider.clearSearchingCitiesList();

      _citiesProvider.setDataToSearchingCitiesList(_areasList);
    } else {
      print("normal call =================================");

      if (_areasList.length < 15) {
        _citiesProvider.setPagenationApiLoading(false);
      }

      _citiesProvider.clearCitiesList();

      _citiesProvider.setDataToCitiesList(_areasList);

      _citiesProvider.setIsLoading(false);
    }
  }

  static Future pagenationApi(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    final _citiesProvider =
        Provider.of<AddingAdCitiesProvider>(context, listen: false);

    if (_citiesProvider.noMoreData) {
    } else {
      if (_citiesProvider.isFecthData) return;
      _citiesProvider.setIsFetchingData(true);

      List<CitiesEntity> _newCitiesList = await _citiesProvider.getCitiesList(
          context, pageNumber, isSearching, searchingText);

      if (_newCitiesList.length < 15) {
        _citiesProvider.setNoMoreData(true);
        _citiesProvider.setPagenationApiLoading(false);
      }
      _citiesProvider.setDataToCitiesList(_newCitiesList);

      _citiesProvider.setIsFetchingData(false);
    }
  }

  static Future searchingPagenationApi(BuildContext context, int pageNumber,
      bool isSearching, String searchingText) async {
    final _citiesProvider =
        Provider.of<AddingAdCitiesProvider>(context, listen: false);

    if (_citiesProvider.noMoreSearchingData) {
    } else {
      //(scroll و انا بعمل request اول سطرين عشان مايعملش 2)
      if (_citiesProvider.isFetchingSearchingData) return;
      _citiesProvider.setIsFetchingSearchingData(true);

      List<CitiesEntity> _newSearchingAreaPagenationList = await _citiesProvider
          .getCitiesList(context, pageNumber, isSearching, searchingText);

      if (_newSearchingAreaPagenationList.length < 15) {
        _citiesProvider.setNoMoreSearchingData(true);
        _citiesProvider.setSearchingPagenationApiLoading(false);
      }
      _citiesProvider
          .setDataToSearchingCitiesList(_newSearchingAreaPagenationList);

      _citiesProvider.setIsFetchingSearchingData(false);
    }
  }

  static onTapOnCategoryAction(
      BuildContext context, String cityName, int cityId, bool fromFilter) {
    UserData.setAddingAdCountryId(cityId);

    Provider.of<AdsProvider>(context, listen: false).setCityId(cityId);

    Provider.of<AdsProvider>(context, listen: false).setCityName(cityName);

    Provider.of<AddOptionsIdAndFeatureName>(context, listen: false)
        .addAdsOpptionName(
      {
        "Feature_Name": AppLocalizations.of(context)!.translate("_country"),
        "Selected_Name": cityName
      },
      AppLocalizations.of(context)!.translate("_country"),
    );

    print("show opption name");
    print(Provider.of<AddOptionsIdAndFeatureName>(context, listen: false)
        .opttinName);

    Provider.of<AddingAdAreaProvider>(context, listen: false)
        .setAllDateToDefault();

    UserData.setAddingAdAreaId(0);

    if (fromFilter) {
      Navigator.pop(context);
    } else
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChooseAreaScreen(fromFilter: fromFilter)));
  }
}
