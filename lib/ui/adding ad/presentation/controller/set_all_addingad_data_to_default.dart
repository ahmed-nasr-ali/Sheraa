import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/add_ads_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_area_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_cities_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_option_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/feature_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/main_category_provider.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/sub_category_provider.dart';

class ClearAddingAdData {
  static setAllAddingDataToDefault(BuildContext context) {
    //Main category
    UserData.setMainCategoryId(0);
    UserData.setMainCategoryName("");
    Provider.of<MainCategoryProvider>(context, listen: false)
        .setAllDateToDefault();

    //sub category
    UserData.setSubCategoryId(0);
    UserData.setSubCategoryName("");
    Provider.of<SubCategoryProvider>(context, listen: false)
        .setAllDateToDefault();

    //Feature
    Provider.of<FeatureProvider>(context, listen: false).setAllDateToDefault();

    Provider.of<FeatureProvider>(context, listen: false)
        .setCheckFeatureSelecttoDefault();

    //option
    Provider.of<FeatureOptionProvider>(context, listen: false)
        .setAllDateToDefault();

    //feature and options provider
    Provider.of<AddOptionsIdAndFeatureName>(context, listen: false)
        .setAllDataToDefault();

    //country
    UserData.setAddingAdCountryId(0);

    Provider.of<AddingAdCitiesProvider>(context, listen: false)
        .setAllDateToDefault();

    //area
    UserData.setAddingAdAreaId(0);
    Provider.of<AddingAdAreaProvider>(context, listen: false)
        .setAllDateToDefault();

    //Ad name and describtion
    UserData.setAdsName("");
    UserData.setAdsDescribtion("");

    //ad price
    UserData.setAdsPrice("0");
    //ad user phone number
    UserData.setAdsPhoneNumber("");

    //hidden comments
    UserData.setHiddenComments("0");
    //hidden contact
    UserData.setHiddenContact("0");
  }
}
