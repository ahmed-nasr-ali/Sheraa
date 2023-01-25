import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/custom_widgets/dialogs/verfiy_dialog.dart';
import 'package:sheraa/locale/app_localizations.dart';

import '/utils/app_colors.dart';

class LoginDialog extends StatefulWidget {
  String? image;
  String? title;
  String? subTitle;
  StatefulWidget? navigateTo;
  bool? pop;
  int durationSeconds;
  LoginDialog(
      {this.image,
      this.title,
      this.subTitle,
      this.durationSeconds: 2000,
      this.navigateTo,
      this.pop});

  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  double width = 0;
  bool isLogin = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _navigateToHome();
  }

  // _navigateToHome() async {
  //   await Future.delayed(Duration(
  //     milliseconds: widget.durationSeconds,
  //   )).then((value) {
  //     if (widget.pop == true)
  //       Navigator.of(context).pop();
  //     else
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (ctx) => widget.navigateTo!));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget loginContent() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 400,
            width: width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.translate('login_or_singup'),
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.translate('signup_des'),
                  style: TextStyle(color: secondGrayColor, fontSize: 14),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  hasHorizontalMargin: true,
                  enableBorder: false,
                  enabled: true,
                  labelText:
                      AppLocalizations.of(context)!.translate('phone_no'),
                  hintTxt: AppLocalizations.of(context)!.translate('phone_ex'),
                  isPassword: false,
                  readOnly: false,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                    width: width,
                    height: 60,
                    btnLbl: AppLocalizations.of(context)!.translate('continue'),
                    onPressedFunction: () {
                      print("click");
                      isLogin = true;
                      setState(() {});
                    },
                    btnColor: mainAppColor,
                    btnStyle: TextStyle(color: whiteColor),
                    borderColor: mainAppColor)
              ],
            ),
          ),
        ],
      );
    }

    // Widget verificationCodeContent() {}

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      body: InkWell(
        onTap: () => Navigator.pop(context),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: isLogin ? VerificationDialog() : loginContent()),
      ),
    );
  }
}
