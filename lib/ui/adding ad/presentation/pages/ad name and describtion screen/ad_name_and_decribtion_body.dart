// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/app_colors.dart';

class AdNameAndDescribtionBody extends StatelessWidget {
  GlobalKey<FormState> formKey;
  TextEditingController adsName;
  TextEditingController adsDescribtion;
  AdNameAndDescribtionBody({
    Key? key,
    required this.formKey,
    required this.adsName,
    required this.adsDescribtion,
  }) : super(key: key);

  double? _height;
  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _width! / 28.83333333333333),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: _height! / 54.13333333333333 //15
                        ),
                    SmallText(
                      text: AppLocalizations.of(context)!.translate("ads_name"),
                      size: _height! / 58, //14
                      color: blackColor,
                      typeOfFontWieght: 1,
                    ),
                    SizedBox(
                      height: _height! / 81.2, //10
                    ),
                    CustomTextFormField(
                      controller: adsName,
                      contentPadding: _width! / 25, //15
                      hasHorizontalMargin: false,
                      maxLines: 1,
                      enableBorder: false,
                      enabled: true,
                      isPassword: false,
                      readOnly: false,
                      labelText: AppLocalizations.of(context)!
                          .translate("ads_name_exampel"),
                      hintSize: _height! / 67.66666666666667, //12
                      labelSize: _height! / 67.66666666666667, //12
                      inputData: TextInputType.name,
                      validationFunc: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .translate("please_enter_ads_name");
                        }
                      },
                    ),
                    SizedBox(
                      height: _height! / 162.4, //5
                    ),
                    SmallText(
                      text: AppLocalizations.of(context)!
                          .translate("ads_decribtion"),
                      size: _height! / 58, //14
                      color: blackColor,
                      typeOfFontWieght: 1,
                    ),
                    SizedBox(
                      height: _height! / 81.2, //10
                    ),
                    CustomTextFormField(
                      controller: adsDescribtion,
                      contentPadding: _width! / 25, //15
                      hasHorizontalMargin: false,
                      maxLines: 5,
                      enableBorder: false,
                      enabled: true,
                      isPassword: false,
                      readOnly: false,
                      hintTxt: AppLocalizations.of(context)!
                          .translate("ads_decribtion"),
                      hintSize: _height! / 67.66666666666667, //12
                      labelSize: _height! / 67.66666666666667, //12
                      inputData: TextInputType.name,
                      validationFunc: (value) {
                        if (value!.isEmpty) {
                          {
                            return AppLocalizations.of(context)!
                                .translate("please_enter_ads_decribation");
                          }
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
