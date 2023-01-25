import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/custom_widgets/SelectCountry/select_country.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/validation_mixin.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/firebase_auth_provider.dart';
import 'package:sheraa/ui/more/regester%20and%20log%20in/log%20in/forget%20password/verify%20forget%20password/verfiy_forget_passward.dart';
import 'package:sheraa/utils/app_colors.dart';

class ForgetPasswardBottomSheet extends StatefulWidget {
  ForgetPasswardBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetPasswardBottomSheet> createState() =>
      _ForgetPasswardBottomSheetState();
}

class _ForgetPasswardBottomSheetState extends State<ForgetPasswardBottomSheet>
    with ValidationMixin {
  Map<String, dynamic> data = {"name": "Egypt", "code": "+2"};
  Map<String, dynamic>? dataResult;

  String _userPhone = '';
  final _formkey = GlobalKey<FormState>();

  bool _notVaild = false;

  @override
  void initState() {
    super.initState();
    UserData.setUserphoneNumberForRegester('');
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
            color: Colors.grey.shade300,
          ),
        ),
        SizedBox(
          height: _height / 81.2, //10
        ),
        Container(
          width: _width,
          // height: _notVaild
          //     ? _height / 2.849122807017544
          //     : _height / 3.248, //280 280
          color: Color(0xff757575),
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
                  SizedBox(height: _height / 162.4 //5
                      ),
                  SmallText(
                    text: AppLocalizations.of(context)!
                        .translate("forget password"),
                    size: _height / 58,
                    color: blackColor,
                    typeOfFontWieght: 1,
                  ),
                  SizedBox(
                    height: _height / 162.4, //5
                  ),
                  SmallText(
                      text: AppLocalizations.of(context)!.translate(
                          "Enter your phone number to send the code to retrieve your password")),
                  SizedBox(
                    height: _height / 40.6, //20
                  ),
                  CustomTextFormField(
                    hasHorizontalMargin: false,
                    enableBorder: false,
                    enabled: true,
                    isPassword: false,
                    readOnly: false,
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
                    height: _height / 27.06666666666667, //30
                  ),
                  CustomButton(
                    enableVerticalMargin: false,
                    enableHorizontalMargin: false,
                    width: _width,
                    height: _height / 16.24, //40
                    btnLbl: AppLocalizations.of(context)!
                        .translate("reset password"),
                    onPressedFunction: () {
                      vaildate();
                    },
                    btnColor: mainAppColor,
                    btnStyle: TextStyle(color: whiteColor),
                    borderColor: mainAppColor,
                  ),
                  SizedBox(
                    height: _height / 27.06666666666667, //30
                  )
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
      final FirebaseAutProvider _firebaseAutProvider =
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
              child: VerfyForgetPasswardBottomSheet(),
            );
          });
    }
  }
}
