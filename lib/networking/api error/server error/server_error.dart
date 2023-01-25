// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

import 'server_error_screen.dart';

class HomeServerError extends ChangeNotifier {
  serverError(BuildContext context, int response) {
    if (response != 200 && response != 403 && response != 422) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ServerError()),
          (route) => false);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: mainAppColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              title: BigText(
                color: blackColor,
                text: AppLocalizations.of(context)!.translate("there is error"),
                typeOfFontWieght: 1,
                size: 12,
              ),
            );
          });
      notifyListeners();
    }
  }
}
