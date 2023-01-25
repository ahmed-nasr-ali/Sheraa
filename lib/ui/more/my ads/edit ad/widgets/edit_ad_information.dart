// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/locale/app_localizations.dart';

import 'package:sheraa/ui/more/my%20ads/new/domin/entity/ad_entity.dart';
import 'package:sheraa/utils/app_colors.dart';

class EditAdInformation extends StatefulWidget {
  AdEntity adInfromations;
  EditAdInformation({
    Key? key,
    required this.adInfromations,
  }) : super(key: key);

  @override
  State<EditAdInformation> createState() => _EditAdInformationState();
}

class _EditAdInformationState extends State<EditAdInformation> {
  TextEditingController _adsName = TextEditingController();

  TextEditingController _adsDescribtion = TextEditingController();

  TextEditingController _adsPrice = TextEditingController();

  TextEditingController _adsPhoneNumber = TextEditingController();

  double? _width;

  double? _height;

  @override
  void initState() {
    super.initState();
    _adsName.text = widget.adInfromations.name ?? "";
    _adsDescribtion.text = widget.adInfromations.description ?? "";
    _adsPrice.text = widget.adInfromations.price ?? "";
    _adsPhoneNumber.text = widget.adInfromations.user!.phone ?? "";
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
            hintTxt: widget.adInfromations.name,
            readOnly: false,
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
            readOnly: false,
            hintTxt: widget.adInfromations.description,
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
                  readOnly: false,
                  hintTxt: widget.adInfromations.price,
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
            readOnly: false,
            hintTxt: widget.adInfromations.user!.phone,
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
