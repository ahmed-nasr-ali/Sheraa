import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/domin/entities/feature_entity.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/cities_screen/choose_citiy_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/feature%20option%20screen/feature_option_screen.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_cities_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_option_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class FeatureController {
  static Future fetchData(
      BuildContext context, int pageNumber, int categoryId) async {
    final _featureProvider =
        Provider.of<FeatureProvider>(context, listen: false);

    List<FeatureEntity> _featureList =
        await _featureProvider.getFeatureList(context, pageNumber, categoryId);

    print("normal call =================================");

    if (_featureList.length < 15) {
      _featureProvider.setPagenationApiLoading(false);
    }

    _featureProvider.clearFeatureList();

    _featureProvider.setDataToFeatureList(_featureList);

    _featureProvider.setIsLoading(false);
  }

  static Future pagenationApi(
      BuildContext context, int pageNumber, int categoryId) async {
    final _featureProvider =
        Provider.of<FeatureProvider>(context, listen: false);

    if (_featureProvider.noMoreData) {
    } else {
      //(scroll و انا بعمل request اول سطرين عشان مايعملش 2)
      if (_featureProvider.isFecthData) return;
      _featureProvider.setIsFetchingData(true);

      List<FeatureEntity> _newFeatureList = await _featureProvider
          .getFeatureList(context, pageNumber, categoryId);

      if (_newFeatureList.length < 15) {
        _featureProvider.setNoMoreData(true);
        _featureProvider.setPagenationApiLoading(false);
      }
      _featureProvider.setDataToFeatureList(_newFeatureList);

      _featureProvider.setIsFetchingData(false);
    }
  }

  static onTapOnFeature(BuildContext context, String featureName, int featureId,
      String slectType) async {
    Provider.of<FeatureOptionProvider>(context, listen: false)
        .setAllDateToDefault();
    var x = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => FeatureOptionScreen(
                  featureId: featureId,
                  appBarText: featureName,
                  slectType: slectType,
                )));

    return x;
  }

  static onTapOnCategoryAction(BuildContext context) {
    final _featureProvider =
        Provider.of<FeatureProvider>(context, listen: false);

    _featureProvider.checkSelect(context);

    if (_featureProvider.showMessage == "" &&
        _featureProvider.featureList.isNotEmpty) {
      UserData.setAddingAdCountryId(0);
      UserData.setAddingAdAreaId(0);

      Provider.of<AddingAdCitiesProvider>(context, listen: false)
          .setAllDateToDefault();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ChooseCitiesScreen(fromFilter: false)));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: mainAppColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              title: BigText(
                color: blackColor,
                text: "you must choose ${_featureProvider.showMessage}",
                typeOfFontWieght: 1,
                size: 12,
              ),
            );
          });
    }
  }
}
