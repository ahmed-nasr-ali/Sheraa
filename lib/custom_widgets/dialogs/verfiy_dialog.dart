import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/regester%20and%20log%20in/regester/regester%20screen/register_screen.dart';
import 'package:sheraa/ui/more/regester%20and%20log%20in/regester/regester%20screen/register_screen.dart';

import 'package:sheraa/utils/app_colors.dart';

class VerificationDialog extends StatefulWidget {
  // final String? verfiyImage;
  // final String? title;
  // final String? description;
  // const VerificationDialog({this.verfiyImage, this.title, this.description});

  @override
  _VerificationDialogState createState() => _VerificationDialogState();
}

class _VerificationDialogState extends State<VerificationDialog> {
  @override
  Widget build(BuildContext context) {
    double _height = 0, _width = 0;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    TextEditingController _textEditingController = TextEditingController();

    String _code = '';
    bool fillcode = false;
    StreamController<ErrorAnimationType> _errorController =
        StreamController<ErrorAnimationType>();

    @override
    void initState() {
      // _errorController = StreamController<ErrorAnimationType>();
      super.initState();
    }

    @override
    void dispose() {
      _errorController.close();

      super.dispose();
    }

    // return AlertDialog(
    //   contentPadding: EdgeInsets.only(top: 30),
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(Radius.circular(10.0))),
    //   content: Container(
    //     height: _width * 0.5,
    //     width: _width * 0.7,
    //     child: SingleChildScrollView(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Container(
    //             height: 80,
    //             width: 80,
    //             child: Image.asset(
    //               verfiyImage!,
    //               fit: BoxFit.scaleDown,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Text(
    //             title!,
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 fontFamily: 'Expo',
    //                 fontSize: 15,
    //                 color: accentColor,
    //                 fontWeight: FontWeight.w400),
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Text(description ?? "",
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontFamily: 'Expo',
    //                   fontSize: 15,
    //                   color: mainAppColor,
    //                   fontWeight: FontWeight.w500)),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 400,
          width: _width,
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
                //AppLocalizations.of(context)!.translate('login_or_singup'),
                "التحقق من رقم الهاتف",
                style: TextStyle(
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                // AppLocalizations.of(context)!.translate('signup_des'),
                "يرجى ادخال الكود المؤلف من من 4 أرقام والذي أرسلناه الى 35***58",
                style: TextStyle(color: secondGrayColor, fontSize: 14),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: _height * 0.025, horizontal: _width * 0.07),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      textStyle: TextStyle(color: mainAppColor),
                      backgroundColor: whiteColor,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          selectedFillColor: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          fieldHeight: _height * 0.075,
                          fieldWidth: _width * 0.15,
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
                        if (_code.length == 4)
                          setState(() {
                            fillcode = true;
                          });
                      },
                      onCompleted: (String value) {
                        _code = value;
                        if (_code.length == 4)
                          setState(() {
                            fillcode = true;
                          });
                        print(fillcode);
                      }),
                ),
              ),
              CustomButton(
                width: _width,
                height: 60,
                btnLbl: AppLocalizations.of(context)!.translate('confirm'),
                onPressedFunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => RegisterScreen())));
                },
                btnColor: fillcode ? grayColor : mainAppColor,
                btnStyle: TextStyle(color: whiteColor),
                borderColor: fillcode ? grayColor : mainAppColor,
              ),
              GestureDetector(
                //onTap:
                //() => _resendCode()

                child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: _height * 0.01, horizontal: _width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('لم يصلك الكود ؟',
                            style: TextStyle(
                                fontSize: 13,
                                color: textGrayColor,
                                fontWeight: FontWeight.w200)),
                        Text(' أرسله مرة أخرى',
                            style: TextStyle(
                                fontSize: 13,
                                color: mainAppColor,
                                fontWeight: FontWeight.w200)),
                        // _resendLoading
                        //     ? Container(
                        //         margin: EdgeInsets.only(right: _width * 0.05),
                        //         child: SpinKitDoubleBounce(
                        //           color: mainAppColor,
                        //           size: 30,
                        //         ),
                        //       )
                        //     :
                        Container()
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
