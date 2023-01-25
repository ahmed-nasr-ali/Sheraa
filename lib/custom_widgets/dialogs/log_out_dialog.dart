import 'package:flutter/material.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class LogoutDialog extends StatelessWidget {
  final String alertMessage;
  final Function? onPressedConfirm;

  const LogoutDialog({this.alertMessage = '', this.onPressedConfirm});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              alertMessage,
              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 15, height: 1.5,color: mainAppColor),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
              color: Color(0xff707070),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                        AppLocalizations.of(context)!.translate('cancel'),
                        style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500))),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.black,
                ),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      onPressedConfirm!();
                    },
                    child: Text(AppLocalizations.of(context)!.translate('ok'),
                        style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
