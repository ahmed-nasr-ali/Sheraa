// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/commons.dart';

class AuthError extends ChangeNotifier {
  autherror442(BuildContext context, dynamic body) {
    if (body["errors"]["country_id"] != null) {
      print(body["errors"]["country_id"]);
      Navigator.pushReplacementNamed(context, '/choose_country');

      Commons.showError(context: context, message: "يجب اختيار الدولة");

      notifyListeners();
    }

    if (body["errors"]["age_group_id"] != null) {
      Navigator.pushReplacementNamed(context, '/select_gender');
      Commons.showError(context: context, message: "يجب اختيار الفئه العمريه");

      notifyListeners();
    }

    if (body["errors"]["gender"] != null) {
      Navigator.pushReplacementNamed(context, '/select_gender');
      Commons.showError(context: context, message: "يجب اختيار النوع");

      notifyListeners();
    }

    if (body["errors"]["name"] != null) {
      Commons.showError(
          context: context,
          message: "${AppLocalizations.of(context)!.translate("error in ")}" +
              " "
                  "${AppLocalizations.of(context)!.translate("first_name")}");

      notifyListeners();
    }

    if (body["errors"]["last_name"] != null) {
      Commons.showError(
          context: context,
          message: "${AppLocalizations.of(context)!.translate("error in ")}" +
              " "
                  "${AppLocalizations.of(context)!.translate("second_name")}");

      notifyListeners();
    }

    if (body["errors"]["email"] != null) {
      Commons.showError(
          context: context,
          message: "${AppLocalizations.of(context)!.translate("error in ")}" +
              " "
                  "${AppLocalizations.of(context)!.translate("email validation")}");

      notifyListeners();
    }

    if (body["errors"]["phone"] != null) {
      Commons.showError(
          context: context,
          message: "${AppLocalizations.of(context)!.translate("error in ")}" +
              " "
                  "${AppLocalizations.of(context)!.translate("phone validation")}");

      notifyListeners();
    }

    if (body["errors"]["password"] != null) {
      Commons.showError(
          context: context,
          message:
              "the Password must have 8 characters \n one symbol \n and one number");

      notifyListeners();
    }
    if (body["errors"]["access_token"] != null) {
      Commons.showError(
          context: context, message: "code send to you is inviald");
    }
    if (body["errors"]["firebase_id"] != null) {
      Commons.showError(
          context: context, message: "code send to you is inviald");
    } else
      return "";
  }
}
