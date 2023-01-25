// ignore_for_file: unused_local_variable, unused_field, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _currenPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  double? _height;

  double? _width;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
        child: PageContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset("assets/images/arrow_simple_chock.png")),
          title: SmallText(
              color: blackColor,
              size: _height! / 50.75, //16
              typeOfFontWieght: 1,
              text: AppLocalizations.of(context)!.translate("Change password")),
        ),
        body: Column(
          children: [
            Expanded(
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: _height! / 162.4, //5
                    ),
                    Divider(
                      height: 0,
                      color: containerColor,
                    ),
                    SizedBox(
                      height: _height! / 36.90909090909091, //22
                    ),
                    CustomTextFormField(
                      containerUnselectedColor: whiteColor,
                      contentPadding: _width! / 25, //15
                      controller: _currenPassword,
                      hasHorizontalMargin: true,
                      enableBorder: false,
                      enabled: true,
                      inputData: TextInputType.text,
                      isPassword: true,
                      maxLines: 1,
                      readOnly: false,
                      labelText: AppLocalizations.of(context)!
                          .translate("Current password"),
                      validationFunc: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .translate("Current password is required");
                        }
                      },
                    ),
                    SizedBox(
                      height: _height! / 81.2,
                    ),
                    CustomTextFormField(
                      containerUnselectedColor: whiteColor,
                      contentPadding: _width! / 25, //15
                      controller: _newPassword,
                      hasHorizontalMargin: true,
                      enableBorder: false,
                      enabled: true,
                      inputData: TextInputType.text,
                      isPassword: true,
                      maxLines: 1,
                      readOnly: false,
                      labelText: AppLocalizations.of(context)!
                          .translate("new_password"),
                      validationFunc: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .translate("new password is required");
                        }
                      },
                    ),
                    SizedBox(
                      height: _height! / 81.2,
                    ),
                    CustomTextFormField(
                      containerUnselectedColor: whiteColor,

                      contentPadding: _width! / 25, //15
                      controller: _confirmPassword,
                      hasHorizontalMargin: true,
                      enableBorder: false,
                      enabled: true,
                      inputData: TextInputType.text,
                      isPassword: true,
                      maxLines: 1,
                      readOnly: false,
                      labelText: AppLocalizations.of(context)!
                          .translate("confirm_new_password"),

                      validationFunc: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .translate("confirm new password is required");
                        }
                      },
                    ),
                    SizedBox(
                      height: _height! / 81.2,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                width: MediaQuery.of(context).size.width / 1.19047619047619,
                height: _height! / 16.24, //50
                enableHorizontalMargin: false,
                btnLbl: AppLocalizations.of(context)!.translate("Save Changes"),
                borderColor: mainAppColor,
                btnColor: mainAppColor,
                btnStyle: TextStyle(
                    fontSize: _height! / 58 //20
                    ,
                    color: whiteColor),
                onPressedFunction: () {
                  if (formKey.currentState!.validate()) {
                    print("valided");
                  }
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
