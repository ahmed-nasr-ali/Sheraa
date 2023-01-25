// ignore_for_file: unused_field, unused_local_variable

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/networking/api%20error/auth/api_errors.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/validation_mixin.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/auth_provider.dart';

import 'package:sheraa/ui/more/more_screen.dart';
import 'package:sheraa/ui/new%20Home/presentation/pages/home%20screen/new_home_screen.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';
import '../../../../../custom_widgets/buttons/custom_button.dart';
import '../../../../../utils/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with ValidationMixin {
  final TextEditingController _userFristName = TextEditingController();
  final TextEditingController _userFamilyName = TextEditingController();
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userPassward = TextEditingController();
  @override
  void initState() {
    super.initState();

    print("999999999999999999999999999999999999999999999");
    print(UserData.getUserPhoneNmberForRegester());
    print(UserData.getFirebaseUserToken());
    print(UserData.getCountryId());
    print(UserData.getUserGender());
  }

  double _height = 0, _width = 0;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  //ApiProvider _apiProvider = ApiProvider();
  AuthProvider? _authProvider;
  Widget _buildBody(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _height / 40.6, //20
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width / 75 //5
                    ),
                child: Row(
                  children: [
                    Flexible(
                      child: CustomTextFormField(
                        contentPadding: _width / 25, //15
                        controller: _userFristName,
                        hasHorizontalMargin: true,
                        enableBorder: false,
                        enabled: true,
                        labelText: AppLocalizations.of(context)!
                            .translate('first_name'),
                        // hintTxt:
                        //     AppLocalizations.of(context)!.translate('phone_ex'),
                        // onChangedFunc: (String text) {
                        //   _userName = text;
                        //   print(_userName);
                        // },
                        validationFunc: validateUserName,
                        isPassword: false,
                        readOnly: false,
                      ),
                    ),
                    Flexible(
                      child: CustomTextFormField(
                        contentPadding: _width / 25, //15
                        controller: _userFamilyName,
                        hasHorizontalMargin: true,
                        enableBorder: false,
                        enabled: true,
                        labelText: AppLocalizations.of(context)!
                            .translate('second_name'),
                        // onChangedFunc: (String text) {
                        //   _userFamilyName = text;
                        //   print(_userFamilyName);
                        // },
                        validationFunc: validateUserFamilyName,
                        isPassword: false,
                        readOnly: false,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: _height / 81.2, //10
              ),
              CustomTextFormField(
                contentPadding: _width / 25, //15
                controller: _userEmail,
                hasHorizontalMargin: true,
                enableBorder: false,
                enabled: true,
                inputData: TextInputType.emailAddress,
                isPassword: false,
                readOnly: false,
                labelText:
                    "${AppLocalizations.of(context)!.translate("email optional")})",
                // onChangedFunc: (String text) {
                //   _userEmail = text;
                //   print(_userEmail);
                // },
                // validationFunc: validateUserEmail,
              ),
              SizedBox(
                height: _height / 81.2, //10
              ),
              CustomTextFormField(
                contentPadding: _width / 25, //15
                controller: _userPassward,
                hasHorizontalMargin: true,
                enableBorder: false,
                enabled: true,
                inputData: TextInputType.text,
                isPassword: true,
                maxLines: 1,
                readOnly: false,
                labelText:
                    AppLocalizations.of(context)!.translate("password ") + "*",
                // onChangedFunc: (String text) {
                //   _userPassword = text;
                //   print(_userPassword);
                // },
                validationFunc: validatePassword,
              ),
              SizedBox(
                height: _height / 81.2, //10
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height *
                    0.061576354679803, //todo 50
                margin: EdgeInsets.symmetric(horizontal: _width / 25 //15
                    ),
                decoration: BoxDecoration(
                  color: Color(0xffF9F9F9),
                  borderRadius:
                      BorderRadius.all(Radius.circular(_height / 81.2)),
                  border: Border.all(color: containerColor),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 31.25, //12
                    ),
                    SmallText(
                      text: UserData.getCountryCode().toString(),
                      size: _height / 67.66666666666667, //12
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 37.5, //12
                    ),
                    SmallText(text: "|"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 37.5, //12
                    ),
                    SmallText(
                      text: UserData.getUserPhoneNumberWithoutCode().toString(),
                      size: _height / 67.66666666666667, //12
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset("assets/images/checkboxcirclefill.png"),
                        SizedBox(
                          width: _width / 25, //15
                        )
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: _height / 27.06666666666667, //30
              ),
              isLoading
                  ? SpinKitFadingCircle(color: mainAppColor)
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width / 25 //15
                          ),
                      child: CustomButton(
                        width: MediaQuery.of(context).size.width,
                        enableHorizontalMargin: false,
                        btnLbl: AppLocalizations.of(context)!
                            .translate("create account"),
                        borderColor: mainAppColor,
                        btnColor: mainAppColor,
                        btnStyle: TextStyle(
                            fontSize: _height / 40.6 //20
                            ,
                            color: whiteColor),
                        onPressedFunction: () {
                          setState(() {
                            _userRegister();
                          });
                        },
                      ),
                    ),
              SizedBox(
                height: _height / 40.6, //20
              ),
              Center(
                  child: Text(
                AppLocalizations.of(context)!.translate(
                    "By creating your account you agree to our Terms and Conditions"),
                //style: Theme.of(context).textTheme.headline3,
                style: TextStyle(color: textGrayColor, fontSize: 12),

                textAlign: TextAlign.center,
              )),
              InkWell(
                child: Center(
                    child: Text(
                  " الشروط والاحكام",
                  style: TextStyle(
                      color: mainAppColor,
                      fontSize: _height / 67.06666666666667 //12
                      ),
                  textAlign: TextAlign.center,
                )),
              ),
              SizedBox(
                height: _height / 40.6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // _authProvider = Provider.of<AuthProvider>(context);
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          //  backgroundColor: Colors.transparent,
          appBar: CustomAppbar(
            trailingWidget: Container(),
            hasBackBtn: true,
            hasDrawer: false,
            hasnotification: false,
            hasCenterLogo: false,
            title:
                AppLocalizations.of(context)!.translate("let's create account"),
            backButtonAction: () => Navigator.pop(context),
            leadingWidget: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close)),
          ),
          body: isLoading
              ? SpinKitFadingCircle(color: mainAppColor)
              : _buildBody(context),
        ),
      ),
    );
  }

  _userRegister() async {
    final _authError = Provider.of<AuthError>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      FocusScope.of(context).unfocus();
      final body = {
        "access_token": UserData.getFirebaseUserToken(),
        "firebase_id": await FirebaseMessaging.instance.getToken(),
        "name": _userFristName.text,
        "last_name": _userFamilyName.text,
        "email": _userEmail.text,
        "gender": UserData.getUserGender(),
        "age_group_id": UserData.getAgeId(),
        "country_id": UserData.getCountryId(),
        "phone": UserData.getUserPhoneNmberForRegester(),
        "password": _userPassward.text,
      };
      final response = await post(
        Uri.parse(
          Urls.REGETER_URL,
        ),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      print("====================================");
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        print("99999999999999999999999999999999");
        print(response.body);
        var body = jsonDecode(response.body);

        // UserData.setUserId(body["data"]["id"]);
        // print("user Id is :  ${UserData.getUserId()}");

        UserData.setUserName(body["data"]["name"]);
        var usernamee = UserData.getUserName();
        print("user Name is :  $usernamee");

        // UserData.setUserEmail(body["data"]["email"] ?? '');
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
        print("6666666666666666666666666666666666");
        var _body = jsonDecode(response.body);
        setState(() {
          _authError.autherror442(context, _body);
          isLoading = false;
        });
      } else if (response.statusCode == 404) {
        var body = jsonDecode(response.body);

        Commons.showError(
            context: context, message: "code send to you is inviald");
        setState(() {
          isLoading = false;
        });
      } else {
        Commons.showError(
            context: context, message: "code send to you is inviald");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NewHomeScreen()),
            (route) => false);
      }
    }
  }
}
