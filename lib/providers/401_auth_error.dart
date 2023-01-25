// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/navigation_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/bottom_navigation/bottom_navigation.dart';

Auth401Error(BuildContext context) {
  final navigatonBarScreen =
      Provider.of<NavigationProvider>(context, listen: false);

  navigatonBarScreen.upadateNavigationIndex(4);
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigation()),
      (route) => false);

  snakBarWidget(
      context: context,
      content: AppLocalizations.of(context)!.translate("login_register_des"));
}

bool unAuthUser(BuildContext context, {bool isHome = false}) {
  if (UserData.getUserApiToken() == null) {
    if (isHome) {
      snakBarWidget(
          context: context,
          content:
              AppLocalizations.of(context)!.translate("login_register_des"));
    } else {
      final navigatonBarScreen =
          Provider.of<NavigationProvider>(context, listen: false);

      navigatonBarScreen.upadateNavigationIndex(4);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigation()),
          (route) => false);

      snakBarWidget(
          context: context,
          content:
              AppLocalizations.of(context)!.translate("login_register_des"));
    }

    return true;
  } else {
    return false;
  }
}
