// ignore_for_file: deprecated_member_use, unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/custom_widgets/SelectCountry/select_country.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/ui/more/regester%20and%20log%20in/log%20in/log%20in/log_in.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/validation_mixin.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/firebase_auth_provider.dart';
import 'package:sheraa/ui/more/regester%20and%20log%20in/regester/verify%20sign%20up/verfiy_sign_up.dart';
import 'package:sheraa/utils/app_colors.dart';

class SignUPScreen extends StatefulWidget {
  SignUPScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> with ValidationMixin {
  Map<String, dynamic> data = {"name": "Egypt", "code": "+2"};
  Map<String, dynamic>? dataResult;

  String _userPhone = '';
  final _formkey = GlobalKey<FormState>();

  bool _notVaild = false;
  @override
  void initState() {
    super.initState();

    UserData.setCountryCode('+2');

    print(UserData.getCountryCode());
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Expanded(child: Container()),
        Container(
          height: _height / 162.4, //5
          width: _width / 9.375, //40
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_height / 162.4 // 5
                ),
            color: Color(0xFFEFEFEF),
          ),
        ),
        SizedBox(
          height: _height / 81.2, //10
        ),
        Container(
          width: _width,
          child: Container(
            padding: EdgeInsets.only(
              left: _width / 18.75, //20
              right: _width / 18.75, //20
              top: _height / 40.6, //20
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_height / 32.48), //25
                topRight: Radius.circular(_height / 32.48), //25
              ),
            ),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _height / 162.4, //5
                  ),
                  SmallText(
                    text: AppLocalizations.of(context)!
                        .translate('login_or_singup'),
                    color: blackColor,
                    size: _height / 58, //14
                    typeOfFontWieght: 1,
                  ),
                  SizedBox(
                    height: _height / 162.4, //5
                  ),
                  SmallText(
                    text: AppLocalizations.of(context)!.translate('signup_des'),
                    maxLine: 2,
                    align: UserData.getUSerLang() == "ar"
                        ? TextAlign.right
                        : TextAlign.left,
                  ),
                  SizedBox(
                    height: _height / 40.6, //20
                  ),
                  CustomTextFormField(
                    hasHorizontalMargin: false,
                    enableBorder: false,
                    enabled: true,
                    isPassword: false,
                    readOnly: false,
                    // hintTxt: "رقم الهاتف \n 548321",
                    labelText:
                        "${AppLocalizations.of(context)!.translate("phone_no")} \n ${AppLocalizations.of(context)!.translate("phone_ex")}",
                    prefixIcon: Container(
                      width: UserData.getUSerLang() == "ar"
                          ? _width / 3.676470588235294 //102,
                          : _width / 3.125 //120

                      ,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: _width / 37.5), //10
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: _width / 75), //5
                                  child: SmallText(
                                    text: AppLocalizations.of(context)!
                                        .translate("country code"),
                                    size: _height / 58, //14
                                    color: mainAppColor,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: _width / 7.5, //50
                                      height: _height / 27.06666666666667, //30
                                      child: InkWell(
                                        onTap: () async {
                                          dataResult = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SelectCountry(),
                                            ),
                                          );
                                          setState(() {
                                            data = dataResult!;
                                          });
                                        },
                                        child: Center(
                                          child: SmallText(
                                            text: data['code'],
                                            size: _height / 58, //14
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              " | ",
                              style: TextStyle(color: Color(0xff707070)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    inputData: TextInputType.phone,
                    onChangedFunc: (String text) {
                      _userPhone = data['code'] + text;

                      setState(() {
                        UserData.setCountryCode(data['code']);

                        print(UserData.getCountryCode());

                        UserData.setUserphoneNumberWithoutCode(text);

                        print(UserData.getUserPhoneNumberWithoutCode());

                        UserData.setUserphoneNumberForRegester(
                            data['code'] + text);
                        print(UserData.getUserPhoneNmberForRegester());
                      });
                    },
                    validationFunc: (value) {
                      if (value!.isEmpty) {
                        setState(() {
                          _notVaild = true;
                        });
                        return AppLocalizations.of(context)!
                            .translate("please entre phone number");
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: _height / 54.13333333333333, //15
                  ),
                  CustomButton(
                    width: _width,
                    enableHorizontalMargin: false,
                    height: _height / 16.24, //40
                    btnLbl: AppLocalizations.of(context)!.translate('continue'),
                    onPressedFunction: vaildate,
                    btnColor: mainAppColor,
                    btnStyle: TextStyle(color: whiteColor),
                    borderColor: mainAppColor,
                  ),
                  InkWell(
                    onTap: () {
                      print("object");
                      Navigator.pop(context);
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: LogInScreen(),
                            );
                          });
                    },
                    highlightColor: mainAppColor,
                    hoverColor: mainAppColor,
                    splashColor: mainAppColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: _height / 81.2),
                      child: SmallText(
                        text: AppLocalizations.of(context)!.translate("log in"),
                        size: _height / 58,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _height / 54.13333333333333, //15
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  vaildate() {
    if (_formkey.currentState!.validate()) {
      FirebaseAutProvider _firebaseAutProvider =
          Provider.of<FirebaseAutProvider>(context, listen: false);

      _firebaseAutProvider.verifyPhoneNumber(_userPhone);
      UserData.setUserphoneNumber(_userPhone);

      Navigator.pop(context);
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: VerfySignUp(),
            );
          });
    }
  }
}
