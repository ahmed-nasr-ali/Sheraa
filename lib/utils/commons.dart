import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:toast/toast.dart';

import 'app_colors.dart';

class Commons {
  // static const baseURL = "https://api.chucknorris.io/";
  // static const tileBackgroundColor = const Color(0xFFF1F1F1);
  // static const chuckyJokeBackgroundColor = const Color(0xFFF1F1F1);
  // static const chuckyJokeWaveBackgroundColor = const Color(0xFFA8184B);
  // static const gradientBackgroundColorEnd = const Color(0xFF601A36);
  // static const gradientBackgroundColorWhite = const Color(0xFFFFFFFF);
  // static const mainAppFontColor = const Color(0xFF4D0F29);
  // static const appBarBackGroundColor = const Color(0xFF4D0F28);
  // static const categoriesBackGroundColor = const Color(0xFFA8184B);
  // static const hintColor = const Color(0xFF4D0F29);
  // static const mainAppColor = const Color(0xFF4D0F29);
  // static const gradientBackgroundColorStart = const Color(0xFF4D0F29);
  // static const popupItemBackColor = const Color(0xFFDADADB);

  static Widget chuckyLoader() {
    return Center(child: SpinKitFoldingCube(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Color(0xFFFFFFFF) : Color(0xFF311433),
          ),
        );
      },
    ));
  }

  static void showError(
      {required BuildContext context,
      @required String? message,
      Function? onTapFunk}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(
                message!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15)),
              actions: <Widget>[
                FlatButton(
                    child: Text(AppLocalizations.of(context)!.translate('ok')),
                    textColor: Colors.black,
                    onPressed: () => onTapFunk != null
                        ? onTapFunk()
                        : Navigator.of(context).pop()),
              ],
            ));
  }

  static Widget chuckyLoading(String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(10), child: Text(message)),
        chuckyLoader(),
      ],
    );
  }

  static String? detectMonth(BuildContext context, int month) {
    if (month == 1)
      return AppLocalizations.of(context)!.translate('January');
    else if (month == 2)
      return AppLocalizations.of(context)!.translate('February');
    else if (month == 3)
      return AppLocalizations.of(context)!.translate('March');
    else if (month == 4)
      return AppLocalizations.of(context)!.translate('April');
    else if (month == 5)
      return AppLocalizations.of(context)!.translate('May');
    else if (month == 6)
      return AppLocalizations.of(context)!.translate('June');
    else if (month == 7)
      return AppLocalizations.of(context)!.translate('July');
    else if (month == 8)
      return AppLocalizations.of(context)!.translate('August');
    else if (month == 9)
      return AppLocalizations.of(context)!.translate('September');
    else if (month == 10)
      return AppLocalizations.of(context)!.translate('October');
    else if (month == 11)
      return AppLocalizations.of(context)!.translate('November');
    else
      return AppLocalizations.of(context)!.translate('December');
  }
  // static Future logout(BuildContext context) async {
  //   final storage = new FlutterSecureStorage();
  //   await storage.deleteAll();

  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => LoginScreen()));
  // }

// handleUnauthenticated(BuildContext context) {
//   showDialog(
//       barrierDismissible: false, // user must tap button!
//       context: context,
//       builder: (_) {
//         return ResponseAlertDialog(
//           alertTitle: 'عفواً',
//           alertMessage: 'يرجي تسجيل الدخول مجدداً',
//           alertBtn: 'موافق',
//           onPressedAlertBtn: () {
//             Navigator.pop(context);
//             SharedPreferencesHelper.remove("user");
//             Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/login_screen', (Route<dynamic> route) => false);
//           },
//         );
//       });
// }

// showErrorDialog(var message, BuildContext context) {
//   showDialog(
//       barrierDismissible: false, // user must tap button!
//       context: context,
//       builder: (_) {
//         return ResponseAlertDialog(
//           alertTitle: 'عفواً',
//           alertMessage: message,
//           alertBtn: 'موافق',
//           onPressedAlertBtn: () {},
//         );
//       });
// }

  static void showToast(
      {@required String? message,
      @required BuildContext? context,
      Color? color}) {
    return Toast.show(
      message!,
      backgroundColor: color == null ? mainAppColor : color,
      duration: Toast.lengthLong,
      gravity: Toast.bottom,
    );
  }
}
