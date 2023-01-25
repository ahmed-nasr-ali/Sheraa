// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

import 'disable reply screen/disable_reply_feature.dart';

class AddingAdInformationBody extends StatefulWidget {
  TextEditingController adsPrice;

  TextEditingController phoneNumber;

  GlobalKey<FormState> formKey;
  AddingAdInformationBody({
    Key? key,
    required this.adsPrice,
    required this.phoneNumber,
    required this.formKey,
  }) : super(key: key);

  @override
  State<AddingAdInformationBody> createState() =>
      _AddingAdInformationBodyState();
}

class _AddingAdInformationBodyState extends State<AddingAdInformationBody> {
  double? _height;

  double? _width;

  bool _hiddenPhoneNumber = false;

  bool _disableReply = false;

  @override
  void initState() {
    super.initState();

    UserData.setHiddenComments("0");
    UserData.setHiddenContact("0");

    print("hidden comment ${UserData.getHiddenComments()}");
    print("hidden contact ${UserData.getHiddenContact()}");
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(
          child: Form(
            key: widget.formKey,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _width! / 20.83333333333333 //18
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: _height! / 54.13333333333333 //15
                          ),
                      SmallText(
                        text: AppLocalizations.of(context)!.translate("price"),
                        size: _height! / 58, //14
                        color: blackColor,
                        typeOfFontWieght: 1,
                      ),
                      SizedBox(
                        height: _height! / 81.2, //10
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: _width! / 1.209677419354839,
                            child: CustomTextFormField(
                              controller: widget.adsPrice,
                              contentPadding: _width! / 25, //15
                              hasHorizontalMargin: false,
                              maxLines: 1,
                              enableBorder: false,
                              enabled: true,
                              isPassword: false,
                              readOnly: false,
                              labelText: AppLocalizations.of(context)!
                                  .translate("price"),
                              hintSize: _height! / 67.66666666666667, //12
                              labelSize: _height! / 67.66666666666667, //12
                              inputData: TextInputType.number,
                              validationFunc: (value) {
                                if (value!.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .translate("please_enter_price");
                                }
                                return null;
                              },
                            ),
                          ),
                          SmallText(
                            text:
                                AppLocalizations.of(context)!.translate("rial"),
                            size: _height! / 67.66666666666667, //12
                            color: textGrayColor,
                            typeOfFontWieght: 0,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _height! / 162.4, //5
                      ),
                      SmallText(
                        text: AppLocalizations.of(context)!
                            .translate("phone number"),
                        size: _height! / 58, //14
                        color: blackColor,
                        typeOfFontWieght: 1,
                      ),
                      SizedBox(
                        height: _height! / 81.2, //10
                      ),
                      CustomTextFormField(
                        controller: widget.phoneNumber,
                        contentPadding: _width! / 25, //15
                        hasHorizontalMargin: false,
                        maxLines: 1,
                        enableBorder: false,
                        enabled: true,
                        isPassword: false,
                        readOnly: false,
                        labelText: "050XXXXXX",
                        hintSize: _height! / 67.66666666666667, //12
                        labelSize: _height! / 67.66666666666667, //12
                        inputData: TextInputType.phone,
                        validationFunc: (value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!
                                .translate("please_enter_phone_number");
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: _height! / 20.6, //13
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width! / 75),
                            child: SmallText(
                              text: AppLocalizations.of(context)!.translate(
                                  "Hide_mobile_number_and_WhatsApp_communication_feature"),
                              size: UserData.getUSerLang() == "ar"
                                  ? _height! / 58
                                  : 10, //14
                              color: blackColor,
                              typeOfFontWieght: 0,
                            ),
                          ),
                          Container(
                            width: 26,
                            height: 16,
                            child: Switch.adaptive(
                              activeColor: mainAppColor,
                              splashRadius: 0,
                              value: _hiddenPhoneNumber,
                              onChanged: (value) {
                                setState(() {
                                  _hiddenPhoneNumber = !_hiddenPhoneNumber;

                                  if (_hiddenPhoneNumber) {
                                    UserData.setHiddenContact("1");
                                  } else {
                                    UserData.setHiddenContact("0");
                                  }

                                  print(
                                      "hidden contact ${UserData.getHiddenContact()}");
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _height! / 45.11111111111111, //18
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width! / 75),
                            child: Row(
                              children: [
                                SmallText(
                                  text: AppLocalizations.of(context)!.translate(
                                      "Disable_the_reply_feature"), //todo
                                  size: _height! / 58, //14
                                  color: blackColor,
                                  typeOfFontWieght: 0,
                                ),
                                SizedBox(
                                  width: _width! / 75, //5
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DisableReplyFeature()));
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          top: _height! / 324.8), //2.5
                                      child: Container(
                                        width: _width! / 22.05882352941176, //17
                                        height:
                                            _height! / 47.76470588235294, //17
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/question-fill.png"),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 26,
                            height: 16,
                            child: Switch.adaptive(
                              activeColor: mainAppColor,
                              splashRadius: 0,
                              value: _disableReply,
                              onChanged: (value) {
                                setState(() {
                                  _disableReply = !_disableReply;

                                  if (_disableReply) {
                                    UserData.setHiddenComments("1");
                                  } else {
                                    UserData.setHiddenComments("0");
                                  }

                                  print(
                                      "hidden comment ${UserData.getHiddenComments()}");
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
