// ignore_for_file: unused_local_variable, must_be_immutable, unused_field, body_might_complete_normally_nullable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class ReportBottomSheet extends StatefulWidget {
  String titleText;
  String subtitleText;
  String pageName;

  ReportBottomSheet({
    Key? key,
    required this.subtitleText,
    required this.titleText,
    required this.pageName,
  }) : super(key: key);

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  final _formkey = GlobalKey<FormState>();

  double? _height;

  double? _width;

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(child: Container()),
        Container(
          height: _height! / 162.4, //5
          width: _width! / 9.375, //40
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_height! / 162.4 // 5
                ),
            color: Color(0xFFEFEFEF),
          ),
        ),
        SizedBox(
          height: _height! / 81.2, //10
        ),
        Container(
          width: _width!,
          child: Container(
            padding: EdgeInsets.only(
              left: _width! / 18.75, //20
              right: _width! / 18.75, //20
              top: _height! / 40.6, //20
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_height! / 32.48), //25
                topRight: Radius.circular(_height! / 32.48), //25
              ),
            ),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: _height! / 29, //28
                  ),
                  SmallText(
                    text: widget.titleText,
                    color: blackColor,
                    size: _height! / 58, //14
                    typeOfFontWieght: 1,
                  ),
                  SmallText(
                    text: widget.subtitleText,
                    color: textGrayColor,
                    size: _height! / 58, //14
                    typeOfFontWieght: 0,
                  ),
                  SizedBox(
                    height: _height! / 81.2, //10
                  ),
                  CustomTextFormField(
                    controller: _controller,
                    contentPadding: _width! / 23.4375, //15
                    hasHorizontalMargin: false,
                    horizontalMargin: _width! / 23.4375, //16
                    enableBorder: false,
                    enabled: true,
                    labelText:
                        AppLocalizations.of(context)!.translate("write_her"),
                    labelSize: _height! / 67.66666666666667, //12,
                    isPassword: false,
                    readOnly: false,
                    suffixIconIsImage: false,
                    suffixIconImagePath: "assets/images/send.png",
                    validationFunc: (v) {
                      if (v!.isEmpty) {
                        return AppLocalizations.of(context)!
                            .translate("field is empty");
                      }
                    },
                  ),
                  SizedBox(
                    height: _height! / 40.6,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _width! / 8.333333333333333 //45
                        ),
                    child: Row(
                      children: [
                        CustomButton(
                            enableVerticalMargin: false,
                            enableHorizontalMargin: false,
                            width: _width! / 3.260869565217391, //115
                            height: _height! / 18.04444444444444, //35
                            btnLbl:
                                AppLocalizations.of(context)!.translate("ok"),
                            onPressedFunction: () async {
                              if (_formkey.currentState!.validate()) {
                                if (widget.pageName == "comment_reprot") {
                                  Navigator.pop(context, _controller.text);
                                } else if (widget.pageName ==
                                    "not comment_reprot") {
                                  Navigator.pop(context, _controller.text);
                                }
                              }
                            },
                            btnColor: whiteColor,
                            btnStyle:
                                TextStyle(color: blackColor, fontSize: 14),
                            borderColor: mainAppColor),
                        SizedBox(
                          width: _width! / 53.57142857142857, //7
                        ),
                        CustomButton(
                            enableVerticalMargin: false,
                            enableHorizontalMargin: false,
                            width: _width! / 3.260869565217391, //115
                            height: _height! / 18.04444444444444, //35
                            btnLbl: AppLocalizations.of(context)!
                                .translate("cancel"),
                            onPressedFunction: () {
                              Navigator.pop(context);
                            },
                            btnColor: mainAppColor,
                            btnStyle:
                                TextStyle(color: whiteColor, fontSize: 14),
                            borderColor: mainAppColor),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height! / 36.90909090909091, //22
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
