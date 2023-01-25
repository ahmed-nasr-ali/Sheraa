// ignore_for_file: close_sinks, unused_field, unused_element, unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/firebase_auth_provider.dart';
import 'package:sheraa/ui/more/regester%20and%20log%20in/regester/regester%20screen/register_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class VerfySignUp extends StatefulWidget {
  const VerfySignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<VerfySignUp> createState() => _VerfySignUpState();
}

class _VerfySignUpState extends State<VerfySignUp> {
  TextEditingController _textEditingController = TextEditingController();

  String _code = '';
  bool fillcode = false;
  StreamController<ErrorAnimationType> _errorController =
      StreamController<ErrorAnimationType>();

  late Timer _timer;
  bool _sendCode = true;
  int timerLeft = 30;

  ///timer method
  void _startCountDown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerLeft > 0) {
        if (mounted) {
          setState(() {
            timerLeft--;
          });
        }
      } else if (timerLeft == 0) {
        if (mounted) {
          setState(() {
            _sendCode = false;
          });
        }
      } else {
        timer.cancel();
        _sendCode = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

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
          // height: _height / 2.8, //290
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _height / 162.4, //5
                  ),
                  SmallText(
                    text: AppLocalizations.of(context)!
                        .translate("verfing phone number"),
                    color: blackColor,
                    size: _height / 58, //14
                    typeOfFontWieght: 1,
                  ),
                  SizedBox(
                    height: _height / 162.4, //5
                  ),
                  SmallText(
                    text: AppLocalizations.of(context)!.translate(
                        "Please enter the 6-digit code that we sent to 35***58"),
                    color: textGrayColor,
                    size: _height / 67.66666666666667, //12
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _height / 27.06666666666667, bottom: 0),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeTextField(
                          // scrollPadding: EdgeInsets.all(0),
                          appContext: context,
                          length: 6,
                          textStyle: TextStyle(color: mainAppColor),
                          backgroundColor: whiteColor,
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              selectedFillColor: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                              fieldHeight: _height / 16.24,
                              fieldWidth: _width / 7.5,
                              selectedColor: mainAppColor,
                              activeColor: mainAppColor,
                              inactiveColor: Color(0xffEEEEEE),
                              borderWidth: 1),
                          animationDuration: Duration(milliseconds: 300),
                          animationType: AnimationType.scale,
                          controller: _textEditingController,
                          errorAnimationController: _errorController,
                          onChanged: (val) {
                            _code = val;
                            if (_code.length == 6)
                              setState(() {
                                fillcode = true;
                              });
                          },
                          onCompleted: (String value) {
                            _code = value;
                            if (_code.length == 6)
                              setState(() {
                                fillcode = true;
                              });
                            print(fillcode);
                            print(_code);
                            final provider = Provider.of<FirebaseAutProvider>(
                                context,
                                listen: false);
                            provider.sendCodeToFirebase(
                                context: context, code: _code);
                          }),
                    ),
                  ),
                  CustomButton(
                    width: _width,
                    height: _height / 16.24, //50
                    enableHorizontalMargin: false,
                    btnLbl: AppLocalizations.of(context)!.translate('confirm'),
                    onPressedFunction: () {
                      if (fillcode) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => RegisterScreen())));
                      }
                    },
                    btnColor: fillcode ? mainAppColor : grayColor,
                    btnStyle: TextStyle(color: whiteColor),
                    borderColor: fillcode ? mainAppColor : grayColor,
                  ),
                  SizedBox(
                    height: _height / 162.4, //5
                  ),
                  _sendCode
                      ? SmallText(
                          text: AppLocalizations.of(context)!
                                  .translate("resend code after") +
                              " " +
                              "${timerLeft} " +
                              AppLocalizations.of(context)!.translate("second"))
                      //لم يصلك الكود ؟  أرسله مرة أخرى
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              _sendCode = true;
                              timerLeft = 30;
                            });
                            _textEditingController.clear();

                            FirebaseAutProvider _firebaseAutProvider =
                                Provider.of<FirebaseAutProvider>(context,
                                    listen: false);
                            String phoneNumber = UserData.getUserPhoneNmber()!;
                            print(phoneNumber);
                            _firebaseAutProvider.verifyPhoneNumber(phoneNumber);
                            _firebaseAutProvider.sendCodeToFirebase(
                              context: context,
                              code: _code,
                            );
                            final snackBar = SnackBar(
                                content: Text('will re send code to you Now'),
                                backgroundColor: Colors.blue);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            print('taped');
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: _height / 162.4, horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    AppLocalizations.of(context)!.translate(
                                        "You did not receive the code"),
                                    style: TextStyle(
                                        fontSize:
                                            _height / 62.46153846153846, //13
                                        color: textGrayColor,
                                        fontWeight: FontWeight.w200)),
                                Text(
                                    AppLocalizations.of(context)!
                                        .translate("send it again"),
                                    style: TextStyle(
                                        fontSize:
                                            _height / 62.46153846153846, //13
                                        color: mainAppColor,
                                        fontWeight: FontWeight.w200)),
                                Container()
                              ],
                            ),
                          ),
                        ),
                  SizedBox(
                    height: _height / 30.07407407407407, //30
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
