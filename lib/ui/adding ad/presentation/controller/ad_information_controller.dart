import 'package:flutter/material.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/adding%20ad/presentation/pages/request%20adding%20ad%20screen/request_adding_ad_screen.dart';

class AdInformationController {
  static onTapToNavigate(
      BuildContext context, String adPrice, String phoneNumber) {
    UserData.setAdsPrice(adPrice);
    UserData.setAdsPhoneNumber(phoneNumber);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RequestAddingAdScreen()));
  }
}
