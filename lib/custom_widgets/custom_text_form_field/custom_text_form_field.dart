// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final bool? hasHorizontalMargin;
  final bool? enabled;
  final String? initialValue;
  final String? hintTxt;
  final TextInputType? inputData;
  final bool? isPassword;
  final FormFieldValidator<String>? validationFunc;
  final ValueChanged<String>? onChangedFunc;
  final bool? suffixIconIsImage;
  final Widget? prefix;
  final Widget? suffixIcon;
  final String? suffixIconImagePath;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final bool? prefixIconIsImage;
  final String? prefixIconImagePath;
  final String? labelText;
  final bool? expands;
  final bool? enableBorder;
  final bool? readOnly;
  double? contentPadding;
  double? hintSize;
  double? labelSize;
  double horizontalMargin;
  Color containerUnselectedColor;
  Color labelColor;
  Color textColor;
  double topPadding;

  final TextEditingController? controller;
  CustomTextFormField({
    this.hintTxt,
    this.inputData,
    this.hasHorizontalMargin: true,
    this.isPassword: false,
    this.validationFunc,
    this.onChangedFunc,
    this.enableBorder: true,
    this.initialValue,
    this.expands = false,
    this.suffixIcon,
    this.maxLength,
    this.enabled: true,
    this.maxLines,
    this.prefixIconIsImage: false,
    this.suffixIconIsImage: false,
    this.prefixIcon,
    this.labelText,
    this.readOnly,
    this.controller,
    this.suffixIconImagePath,
    this.prefixIconImagePath,
    this.prefix,
    this.contentPadding = 0,
    this.hintSize = 0,
    this.labelSize = 0,
    this.horizontalMargin = 0,
    this.containerUnselectedColor = const Color(0xffF9F9F9),
    this.labelColor = const Color(0xffF9F9F9),
    this.textColor = const Color(0xffF9F9F9),
    this.topPadding = 0,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obsecureText = true;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusNode.dispose();

    super.dispose();
  }

  Widget _buildTextFormField() {
    return TextFormField(
      readOnly: widget.readOnly!,
      expands: widget.expands!,
      controller: widget.controller,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      focusNode: _focusNode,
      maxLength: widget.maxLength,
      initialValue: widget.initialValue,
      style: TextStyle(
          color: _focusNode.hasFocus
              ? blackColor
              : widget.textColor == Color(0xffF9F9F9)
                  ? Colors.black
                  : widget.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          filled: true,
          fillColor: widget.enableBorder! ? Colors.white : Colors.transparent,
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: _focusNode.hasFocus
                  ? mainAppColor
                  : widget.labelColor == Color(0xffF9F9F9)
                      ? hintColor
                      : widget.labelColor,
              fontSize: widget.labelSize == 0 ? 14 : widget.labelSize,
              fontWeight: FontWeight.w400),
          border: widget.enableBorder!
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: _focusNode.hasFocus ? mainAppColor : hintColor),
                )
              : InputBorder.none,
          focusColor: mainAppColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal:
                  widget.contentPadding == 0 ? 5 : widget.contentPadding!,
              vertical: 5),
          suffixIcon: !widget.suffixIconIsImage!
              ? widget.suffixIcon
              : _focusNode.hasFocus
                  ? Image.asset(
                      widget.suffixIconImagePath!,
                      color: mainAppColor,
                      height: 25,
                      width: 25,
                    )
                  : Image.asset(
                      widget.suffixIconImagePath!,
                      color: Colors.grey,
                      height: 25,
                      width: 25,
                    ),
          prefix: widget.prefix,
          prefixIcon: !widget.prefixIconIsImage!
              ? widget.prefixIcon
              : _focusNode.hasFocus
                  ? Image.asset(
                      widget.prefixIconImagePath!,
                      color: mainAppColor,
                      height: 25,
                      width: 25,
                    )
                  : Image.asset(
                      widget.prefixIconImagePath!,
                      color: hintColor,
                      height: 25,
                      width: 25,
                    ),
          hintText: widget.hintTxt,
          errorStyle: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(
              color: _focusNode.hasFocus ? mainAppColor : hintColor,
              fontSize: widget.hintSize == 0 ? 14 : widget.hintSize,
              fontWeight: FontWeight.w400),
          suffix: widget.isPassword!
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obsecureText = !_obsecureText;
                    });
                  },
                  child: Icon(
                    _obsecureText ? Icons.remove_red_eye : Icons.visibility_off,
                    color: _focusNode.hasFocus ? mainAppColor : hintColor,
                    size: 20,
                  ),
                )
              : SizedBox(
                  height: 10,
                )),
      keyboardType: widget.inputData,
      obscureText: widget.isPassword! ? _obsecureText : false,
      validator: widget.validationFunc,
      onChanged: widget.onChangedFunc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          padding: EdgeInsets.only(
              top: widget.topPadding == 0 ? 0 : widget.topPadding),
          margin: EdgeInsets.symmetric(
              horizontal: widget.hasHorizontalMargin!
                  ? widget.horizontalMargin == 0
                      ? constraints.maxWidth * 0.03
                      : widget.horizontalMargin
                  : 0),
          decoration: BoxDecoration(
              color: _focusNode.hasFocus
                  ? whiteColor
                  : widget.containerUnselectedColor == Color(0xffF9F9F9)
                      ? Color(0xffF9F9F9)
                      : widget.containerUnselectedColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                  color: _focusNode.hasFocus ? mainAppColor : containerColor)),
          child: _buildTextFormField());
    });
  }
}
