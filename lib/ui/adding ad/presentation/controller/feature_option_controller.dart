import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/add_ads_provider.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/feature_options_entity.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_option_provider.dart';

class FeatureOptionController {
  static Future fetchData(
      BuildContext context, int pageNumber, int featureId) async {
    final _featureOptionProvider =
        Provider.of<FeatureOptionProvider>(context, listen: false);

    List<FeatureOptionEntity> _featureOptionList = await _featureOptionProvider
        .getFeatureOptionList(context, pageNumber, featureId);

    print("normal call =================================");

    if (_featureOptionList.length < 15) {
      _featureOptionProvider.setPagenationApiLoading(false);
    }

    _featureOptionProvider.clearFeatureOptionList();

    _featureOptionProvider.setDataToFeatureOptionList(_featureOptionList);

    _featureOptionProvider.setIsLoading(false);
  }

  static Future pagenationApi(
      BuildContext context, int pageNumber, int featureId) async {
    final _featureOptionProvider =
        Provider.of<FeatureOptionProvider>(context, listen: false);

    if (_featureOptionProvider.noMoreData) {
    } else {
      //(scroll و انا بعمل request اول سطرين عشان مايعملش 2)
      if (_featureOptionProvider.isFecthData) return;
      _featureOptionProvider.setIsFetchingData(true);

      List<FeatureOptionEntity> _newFeatureOptionList =
          await _featureOptionProvider.getFeatureOptionList(
              context, pageNumber, featureId);

      if (_newFeatureOptionList.length < 15) {
        _featureOptionProvider.setNoMoreData(true);
        _featureOptionProvider.setPagenationApiLoading(false);
      }
      _featureOptionProvider.setDataToFeatureOptionList(_newFeatureOptionList);

      _featureOptionProvider.setIsFetchingData(false);
    }
  }

  static afterBuildOptionList(BuildContext context, String slectType,
      String featureName, List itemSelect) {
    final _addAdsProviderForShowing =
        Provider.of<AddOptionsIdAndFeatureName>(context, listen: false);
    slectType == "single"
        ? _addAdsProviderForShowing.opptionIDForShowing.forEach((element) {
            if (element.containsKey(featureName)) {
              itemSelect.add(element[featureName]);
            }
          })
        : itemSelect = _addAdsProviderForShowing.categoryID;
  }

  static onTapOnOptionSingleSelect(BuildContext context, String featureName,
      String optionName, int optionId, List itemSelect) {
    AddOptionsIdAndFeatureName _addAddsProvider =
        Provider.of(context, listen: false);

    _addAddsProvider.addAdsOpptionName(
      {
        "Feature_Name": featureName,
        "Selected_Name": optionName,
      },
      featureName,
    );
    print("show opption name");
    print(_addAddsProvider.opttinName);
    print("===============================================");

    ///==================================================================

    _addAddsProvider.addOpptionId(
      {
        "id": optionId,
        "Name": featureName,
      },
      featureName,
    );

    print("show opption id");
    print(_addAddsProvider.opptionID);

    _addAddsProvider.addOpptionIDForShow(
      {
        featureName: optionId,
      },
      featureName,
    );

    _addAddsProvider.opptionIDForShowing.forEach((item) {
      if (item.containsKey(featureName)) {
        itemSelect.add(item[featureName]);
      }
    });

    Navigator.pop(context, optionName);
  }

  static onTapOnOptionMultiSelect(BuildContext context, String featureName,
      String optionName, int optionId, List itemSelect) {
    AddOptionsIdAndFeatureName _addAddsProvider =
        Provider.of(context, listen: false);

    _addAddsProvider.addCategoryId(optionId);
    _addAddsProvider.addCategoryName(optionName);

    if (_addAddsProvider.categoryID.isNotEmpty &&
        _addAddsProvider.categoryName.isNotEmpty) {
      _addAddsProvider.addAdsOpptionName({
        "Feature_Name": featureName,
        "Selected_Name": _addAddsProvider.categoryName.join(",").toString()
      }, featureName);

      print("list is name" + "${_addAddsProvider.opttinName}");

      ///==================================================================
      itemSelect = _addAddsProvider.categoryID;

      // print("item List is :  ${itemSelect}");
    } else {
      int x = _addAddsProvider.opttinName
          .indexWhere((element) => element["Feature_Name"] == featureName);
      _addAddsProvider.opttinName.removeAt(x);
      print(_addAddsProvider.opttinName);
    }
  }
}
