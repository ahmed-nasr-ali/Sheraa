// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class RequestAddingAdInfromationWidget extends StatefulWidget {
  RequestAddingAdInfromationWidget({Key? key}) : super(key: key);

  @override
  State<RequestAddingAdInfromationWidget> createState() =>
      _RequestAddingAdInfromationWidgetState();
}

class _RequestAddingAdInfromationWidgetState
    extends State<RequestAddingAdInfromationWidget> {
  TextEditingController _adsName = TextEditingController();

  TextEditingController _adsDescribtion = TextEditingController();

  TextEditingController _adsPrice = TextEditingController();

  TextEditingController _adsPhoneNumber = TextEditingController();

  double? _width;

  double? _height;

  @override
  void initState() {
    super.initState();

    _adsName.text = UserData.getAdsName();
    _adsDescribtion.text = UserData.getAdsDescribtion();
    _adsPrice.text = UserData.getAdsPrice();
    _adsPhoneNumber.text = UserData.getAdsPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height! / 81.2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width! / 18.75 //20
              ),
          child: SmallText(
            text: AppLocalizations.of(context)!.translate("ads_name"),
            size: _height! / 58, //14
            color: blackColor,
            typeOfFontWieght: 1,
          ),
        ),
        SizedBox(
          height: _height! / 81.2, //10
        ),
        SizedBox(
          height: _height! / 81.2, //10
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: _width! / 20.83333333333333 //18
                  ),
          child: CustomTextFormField(
            controller: _adsName,

            contentPadding: _width! / 25, //15
            hasHorizontalMargin: false,
            maxLines: 1,
            enableBorder: false,
            enabled: true,
            isPassword: false,
            readOnly: true,
            hintSize: _height! / 67.66666666666667, //12
            labelSize: _height! / 67.66666666666667, //12
            inputData: TextInputType.name,
          ),
        ),
        SizedBox(
          height: _height! / 162.4, //5
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width! / 18.75 //20
              ),
          child: SmallText(
            text: AppLocalizations.of(context)!.translate("ads_decribtion"),
            size: _height! / 58, //14
            color: blackColor,
            typeOfFontWieght: 1,
          ),
        ),
        SizedBox(
          height: _height! / 81.2, //10
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: _width! / 20.83333333333333 //18
                  ),
          child: CustomTextFormField(
            controller: _adsDescribtion,
            contentPadding: _width! / 25, //15
            hasHorizontalMargin: false,
            maxLines: 5,
            enableBorder: false,
            enabled: true,
            isPassword: false,
            readOnly: true,
            hintTxt: AppLocalizations.of(context)!.translate("ads_decribtion"),
            hintSize: _height! / 67.66666666666667, //12
            labelSize: _height! / 67.66666666666667, //12
            inputData: TextInputType.name,
          ),
        ),
        SizedBox(
          height: _height! / 162.4, //5
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: _width! / 20.83333333333333 //18,
                  ),
          child: SmallText(
            text: AppLocalizations.of(context)!.translate("price"),
            size: _height! / 58, //14
            color: blackColor,
            typeOfFontWieght: 1,
          ),
        ),
        SizedBox(
          height: _height! / 81.2, //10
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: _width! / 20.83333333333333 //18
                  ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _width! / 1.209677419354839,
                child: CustomTextFormField(
                  controller: _adsPrice,
                  contentPadding: _width! / 25, //15
                  hasHorizontalMargin: false,
                  maxLines: 1,
                  enableBorder: false,
                  enabled: true,
                  isPassword: false,
                  readOnly: true,
                  hintSize: _height! / 67.66666666666667, //12
                  labelSize: _height! / 67.66666666666667, //12
                  inputData: TextInputType.number,
                ),
              ),
              SmallText(
                text: AppLocalizations.of(context)!.translate("rial"),
                size: _height! / 67.66666666666667, //12
                color: textGrayColor,
                typeOfFontWieght: 0,
              ),
            ],
          ),
        ),
        SizedBox(
          height: _height! / 162.4, //5
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: _width! / 20.83333333333333 //18
                  ),
          child: SmallText(
            text: AppLocalizations.of(context)!.translate("phone number"),
            size: _height! / 58, //14
            color: blackColor,
            typeOfFontWieght: 1,
          ),
        ),
        SizedBox(
          height: _height! / 81.2, //10
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: _width! / 20.83333333333333 //18
                  ),
          child: CustomTextFormField(
            controller: _adsPhoneNumber,
            contentPadding: _width! / 25, //15
            hasHorizontalMargin: false,
            maxLines: 1,
            enableBorder: false,
            enabled: true,
            isPassword: false,
            readOnly: true,
            hintSize: _height! / 67.66666666666667, //12
            labelSize: _height! / 67.66666666666667, //12
            inputData: TextInputType.phone,
          ),
        ),
        SizedBox(
          height: _height! / 32.48, //25
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width! / 27.06666666666667,
          ),
        ),
        SizedBox(
          height: _height! / 32.48, //25
        ),
      ],
    );
  }
}
