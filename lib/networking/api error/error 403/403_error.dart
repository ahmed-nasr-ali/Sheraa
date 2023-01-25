import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/big_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class Error403 extends ChangeNotifier {
  error403(BuildContext context, int response) {
    if (response == 403) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: mainAppColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              title: BigText(
                color: blackColor,
                text: AppLocalizations.of(context)!.translate(
                    "you do not have a perimission to do this operation"),
                typeOfFontWieght: 1,
                size: 12,
              ),
            );
          });
    }
  }
}
