// ignore_for_file: deprecated_member_use, unused_field, unused_local_variable

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/networking/api%20error/auth/api_errors.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/validation_mixin.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/more_screen.dart';
import 'package:sheraa/ui/new%20Home/presentation/pages/home%20screen/new_home_screen.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> with ValidationMixin {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _passward = TextEditingController();
  bool isLoading = false;
  final TextEditingController _confirmPassward = TextEditingController();

  bool formError = false;

  bool _passwordError = false;
  bool _confirmPasswordError = false;
  @override
  void initState() {
    super.initState();

    print(UserData.getUserPhoneNmber());
    print(UserData.getFirebaseUserToken());
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: _height / 162.4, //5
            width: _width / 9.375, //40
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_height / 162.4 // 5
                  ),
              color: Colors.grey.shade300,
            ),
          ),
          SizedBox(
            height: _height / 81.2, //10
          ),
          Container(
            width: _width,
            // height: _passwordError && _confirmPasswordError
            //     ? _height / 2.055696202531646 //todo 430 check
            //     : _passwordError
            //         ? _height / 3.460606060606061 //410
            //         : _confirmPasswordError
            //             ? _height / 1.980487804878049 //410
            //             : _height / 2.460606060606061, //330
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
                child: isLoading
                    ? Container(
                        height: _height / 2.460606060606061, //330
                        child: Center(
                            child: SpinKitFadingCircle(color: mainAppColor)))
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: _height / 162.4 //5
                              ),
                          SmallText(
                            text: AppLocalizations.of(context)!
                                .translate("log in"),
                            color: blackColor,
                            size: _height / 58, //14
                            typeOfFontWieght: 1,
                          ),
                          SizedBox(
                            height: _height / 162.4, //5
                          ),
                          SmallText(
                            text: AppLocalizations.of(context)!
                                .translate('signup_des'),
                            maxLine: 2,
                            align: UserData.getUSerLang() == "ar"
                                ? TextAlign.right
                                : TextAlign.left,
                          ),
                          SizedBox(
                            height: _height / 40.6, //20
                          ),
                          CustomTextFormField(
                            contentPadding: _width / 25, //5
                            hasHorizontalMargin: false,
                            enableBorder: false,
                            enabled: true,
                            isPassword: true,
                            maxLines: 1,
                            readOnly: false,
                            labelText:
                                "${AppLocalizations.of(context)!.translate("new password")}*",
                            inputData: TextInputType.emailAddress,
                            validationFunc: (String? value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  _passwordError = true;
                                });
                                return AppLocalizations.of(context)!
                                    .translate("password required");
                              }
                              if (_passward.text != _confirmPassward.text) {
                                setState(() {
                                  _passwordError = true;
                                });
                                return AppLocalizations.of(context)!
                                    .translate("two password are different");
                              }
                              return null;
                            },
                            controller: _passward,
                          ),
                          SizedBox(
                            height: _height / 54.13333333333333, //15
                          ),
                          CustomTextFormField(
                            contentPadding: _width / 25,
                            hasHorizontalMargin: false,
                            enableBorder: false,
                            enabled: true,
                            isPassword: true,
                            maxLines: 1,
                            readOnly: false,
                            labelText:
                                "${AppLocalizations.of(context)!.translate("confirm password")}*",
                            inputData: TextInputType.emailAddress,
                            onChangedFunc: (String text) {},
                            validationFunc: (String? value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  _confirmPasswordError = true;
                                });
                                return AppLocalizations.of(context)!
                                    .translate("confirm password is required");
                              }
                              if (_passward.text != _confirmPassward.text) {
                                setState(() {
                                  _confirmPasswordError = true;
                                });
                                return AppLocalizations.of(context)!
                                    .translate("two password are different");
                              }
                              return null;
                            },
                            controller: _confirmPassward,
                          ),
                          SizedBox(
                            height: _height / 40.6, //20
                          ),
                          CustomButton(
                              width: _width,
                              height: _height / 16.24, //50
                              enableHorizontalMargin: false,
                              enableVerticalMargin: false,
                              btnLbl: AppLocalizations.of(context)!
                                  .translate('log in'),
                              onPressedFunction: restPassword,
                              btnColor: mainAppColor,
                              btnStyle: TextStyle(color: whiteColor),
                              borderColor: mainAppColor),
                          SizedBox(
                            height: _height / 27.06666666666667, //30
                          )
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  restPassword() async {
    final _restpassword = Provider.of<AuthError>(context, listen: false);

    if (_formkey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      print(UserData.getUserPhoneNmber());
      print(UserData.getFirebaseUserToken());
      final body = {
        "access_token": UserData.getFirebaseUserToken(),
        "phone": UserData.getUserPhoneNmber(),
        "firebase_id": await FirebaseMessaging.instance.getToken(),
        "password": _passward.text,
        "password_confirmation": _confirmPassward.text,
      };
      setState(() {
        isLoading = true;
      });

      final response = await post(
        Uri.parse(
          Urls.FORGETPASWARD_URL,
        ),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        // print('777777777777777777777777777777777777777');

        UserData.setUserName(body["data"]["name"]);
        var usernamee = UserData.getUserName();
        print("user Name is :  $usernamee");

        // UserData.setUserEmail(body["data"]["email"] ?? "");
        // var useremil = UserData.getUserEmail();
        // print("user Email is :  $useremil");

        // UserData.setUserphoneNumber(body["data"]["phone"]);
        // var userphone = UserData.getUserPhoneNmber();
        // print("user Email is :  $userphone");

        UserData.setUserApiToken(body['token']);
        var userapitoken = UserData.getUserApiToken();
        print("user api token is :  $userapitoken");

        UserData.setFirebaseUserToken('');
        UserData.setUserphoneNumberForRegester('');
        UserData.setUserphoneNumberWithoutCode("");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoreScreen(),
          ),
        );
      } else if (response.statusCode == 422) {
        print("6666666666666666666666666666");
        print(response.statusCode);
        print(response.body);
        var _body = jsonDecode(response.body);
        _restpassword.autherror442(context, _body);
        setState(() {
          isLoading = false;
          _passwordError = false;
          _confirmPasswordError = false;
        });
      } else if (response.statusCode == 403) {
        var body = jsonDecode(response.body);
        Commons.showError(
            context: context,
            message: AppLocalizations.of(context)!
                .translate("phone or password is not incorrect"));
        setState(() {
          isLoading = false;
          _passwordError = false;
          _confirmPasswordError = false;
        });

        print(body);
      } else if (response.statusCode == 404) {
        var body = jsonDecode(response.body);

        Commons.showError(
            context: context, message: "code send to you is inviald");
        setState(() {
          isLoading = false;
        });
      } else {
        Commons.showError(
            context: context,
            message: AppLocalizations.of(context)!.translate("error"));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NewHomeScreen()),
            (route) => false);
      }
    }
  }
}
