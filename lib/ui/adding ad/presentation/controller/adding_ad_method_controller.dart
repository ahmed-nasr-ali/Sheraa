import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/providers/navigation_provider.dart';
import 'package:sheraa/ui/adding%20ad/widgets/create_ad_successfully.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/add_ads_provider.dart';
import 'package:sheraa/providers/media_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/presentation/provider/adding_ad_method_provider.dart';
import 'package:sheraa/ui/bottom_navigation/bottom_navigation.dart';

class AddingAdMethodController {
  static addingAdMethod(BuildContext context) async {
    List _addingAdOptionsId = [];

    AddOptionsIdAndFeatureName _addAdsProvider =
        Provider.of<AddOptionsIdAndFeatureName>(context, listen: false);

    _addAdsProvider.categoryID.forEach((element) {
      _addingAdOptionsId.add(element);
    });

    _addAdsProvider.opptionID.forEach((element) {
      _addingAdOptionsId.add(element["id"]);
    });

    print("option list is : $_addingAdOptionsId");

    Map<String, dynamic> _body = {
      "name:ar": UserData.getAdsName(),
      "name:en": UserData.getAdsName(),
      "description:ar": UserData.getAdsDescribtion(),
      "description:en": UserData.getAdsDescribtion(),
      "price": UserData.getAdsPrice(),
      "category_id": UserData.getMainCategoryId(),
      "sub_category_id": UserData.getSubCategoryId(),
      "country_id": UserData.getCountryId(),
      "options": _addingAdOptionsId.isEmpty ? [] : _addingAdOptionsId,
      "city_id": UserData.getAddingAddCountryId(),
      "area_id": UserData.getAddingAdAreaId(),
      "media": Provider.of<MediaProvider>(context, listen: false).mediaToken,
      "hide_contacts": UserData.getHiddenContact(),
      "disable_comments": UserData.getHiddenComments(),
    };

    print(_body);

    bool x = await Provider.of<AddingAdMethodProvider>(context, listen: false)
        .addingAdMethod(context, _body);

    return x;
  }

  static afterAddingAdSuccufulyNavigateToHome(BuildContext context) {
    Provider.of<NavigationProvider>(context, listen: false)
        .upadateNavigationIndex(0);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
        (route) => false);

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: CreateAdSuccessfully(),
          );
        });
  }
}
