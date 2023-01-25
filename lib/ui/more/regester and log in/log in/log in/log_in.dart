// ignore_for_file: non_constant_identifier_names, deprecated_member_use, unused_local_variable, unused_field

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/networking/api%20error/auth/api_errors.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/providers/navigation_provider.dart';
import 'package:sheraa/shared_preferences/shared_preferences_helper.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/custom_widgets/SelectCountry/select_country.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/validation_mixin.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/regester%20and%20log%20in/log%20in/forget%20password/forget%20password%20sheet/forget_passward.dart';
import 'package:sheraa/ui/new%20Home/presentation/pages/home%20screen/new_home_screen.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> with ValidationMixin {
  final TextEditingController _userPhone = TextEditingController();
  final TextEditingController _userpassword = TextEditingController();

  Map<String, dynamic> data = {"name": "Egypt", "code": "+2"};
  Map<String, dynamic>? dataResult;
  bool isLoading = false;
  // String _userPhone = '';
  // String _userPassward = '';
  final _formkey = GlobalKey<FormState>();

  bool formError = false;

  bool _phoneNumberNotVaild = false;
  bool _passwordNotVaild = false;
  AuthProvider? _authProvider;
  NavigationProvider? _navigationProvider;
  @override
  Widget build(BuildContext context) {
    setState(() {});
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    _authProvider = Provider.of<AuthProvider>(context);
    _navigationProvider = Provider.of<NavigationProvider>(context);
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
            // height: _passwordNotVaild && _phoneNumberNotVaild
            //     ? _height / 1.845454545454545 //todo 430 check
            //     : _passwordNotVaild
            //         ? _height / 1.980487804878049 //410
            //         : _phoneNumberNotVaild
            //             ? _height / 1.980487804878049 //410
            //             : _height / 2.148148148148148, //398
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
                        height: _height / 2.148148148148148, //398,
                        child: Center(
                            child: SpinKitFadingCircle(color: mainAppColor)))
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: _height / 162.4, //5
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
                            controller: _userPhone,
                            hasHorizontalMargin: false,
                            enableBorder: false,
                            enabled: true,
                            isPassword: false,
                            readOnly: false,
                            labelText: AppLocalizations.of(context)!
                                .translate("phone number"),
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
                                              height: _height /
                                                  27.06666666666667, //30
                                              child: InkWell(
                                                onTap: () async {
                                                  dataResult =
                                                      await Navigator.push(
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
                                      style:
                                          TextStyle(color: Color(0xff707070)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            inputData: TextInputType.phone,
                            // onChangedFunc: (String text) {
                            //   print(data["code"] + _userPhone.text);

                            // },
                            validationFunc: (value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  _phoneNumberNotVaild = true;
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
                          CustomTextFormField(
                            controller: _userpassword,
                            contentPadding: _width / 18.75, //20
                            hasHorizontalMargin: false,
                            maxLines: 1,
                            enableBorder: false,
                            enabled: true,
                            isPassword: true,
                            readOnly: false,
                            labelText: AppLocalizations.of(context)!
                                .translate("password"),
                            inputData: TextInputType.visiblePassword,
                            validationFunc: (value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  _passwordNotVaild = true;
                                });
                                return AppLocalizations.of(context)!
                                    .translate("please entre phone number");
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: _height / 81.2, //10
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: ForgetPasswardBottomSheet(),
                                    );
                                  });
                            },
                            child: SmallText(
                              text: AppLocalizations.of(context)!
                                  .translate("forget_password"),
                              color: mainAppColor,
                              size: _height / 62.46153846153846, //13
                              typeOfFontWieght: 0,
                            ),
                          ),
                          SizedBox(
                            height: _height / 54.13333333333333, //15
                          ),

                          // SizedBox(
                          //   height: _height / 162.4, //5
                          // ),
                          CustomButton(
                              width: _width,
                              height: _height / 16.24, //50
                              enableHorizontalMargin: false,
                              enableVerticalMargin: false,
                              btnLbl: AppLocalizations.of(context)!
                                  .translate('log in'),
                              onPressedFunction: UserLogIn,
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

  UserLogIn() async {
    final _logInError = Provider.of<AuthError>(context, listen: false);

    if (_formkey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      print(_userpassword);
      print(data["code"] + _userPhone.text);
      final body = {
        "phone": data["code"] + _userPhone.text,
        "password": _userpassword.text,
        "firebase_id": await FirebaseMessaging.instance.getToken(),
      };
      setState(() {
        isLoading = true;
      });

      final response = await post(
        Uri.parse(
          Urls.LOGIN_URL_,
        ),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        print("body response:$body");
        UserData.setUserId(body["data"]["id"]);
        print("user Id is :  ${UserData.getUserId()}");

        UserData.setUserName(body["data"]["name"]);
        var usernamee = UserData.getUserName();
        print("user Name is :  $usernamee");

        // UserData.setUserEmail(body["data"]["email"] ?? "");
        // var useremil = UserData.getUserEmail();
        // print("user Email is :  $useremil");
        //
        // UserData.setUserphoneNumber(body["data"]["phone"]);
        // var userphone = UserData.getUserPhoneNmber();
        // print("user Email is :  $userphone");

        UserData.setUserApiToken(body['token']);
        var userapitoken = UserData.getUserApiToken();
        print("user api token is :  $userapitoken");
        //AuthUser _authUser=new AuthUser.fromJson(body['data']);
        // _authProvider!.setCurrentUser(new AuthUser.fromJson(body['response']['data']));
        // SharedPreferencesHelper.save(
        //     "user", _authProvider!.currentUser);
        SharedPreferencesHelper.setUserToken(body['token']);
        _authProvider!.setUserToken(body['token']);
        _authProvider!.getUserProfileData(context).then((value) {
          if (value == true) {
            _navigationProvider!.upadateNavigationIndex(4);
            Navigator.pop(context);
          }
        });
      } else if (response.statusCode == 422) {
        print('===============================');
        var body = jsonDecode(response.body);
        print(body);

        _logInError.autherror442(context, body);
        setState(() {
          isLoading = false;
          _passwordNotVaild = false;
          _phoneNumberNotVaild = false;
        });
      } else if (response.statusCode == 403) {
        var body = jsonDecode(response.body);
        Commons.showError(
            context: context,
            message: AppLocalizations.of(context)!
                .translate("phone or password is not incorrect"));
        setState(() {
          isLoading = false;
          _passwordNotVaild = false;
          _phoneNumberNotVaild = false;
        });

        print(body);
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
