import 'package:flutter/material.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/adding%20ad%20information%20screen/adding_ad_informations_screen.dart';

class AdNameAndDecribtionController {
  static onTapToNavigate(
      BuildContext context, String adName, String adDescribtion) {
    UserData.setAdsPrice("0");
    UserData.setAdsPhoneNumber("");

    UserData.setHiddenComments("0");
    UserData.setHiddenContact("0");

    UserData.setAdsName(adName);
    UserData.setAdsDescribtion(adDescribtion);

    print(UserData.getAdsName());
    print(UserData.getAdsDescribtion());

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AddingAdInformationScreen()));
  }
}
