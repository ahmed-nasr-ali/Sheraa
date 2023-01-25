// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';
import '../../../utils/app_colors.dart';

class SearchBar extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  Widget? suffixwidget;
  Widget? prefixwidget;

  SearchBar({
    Key? key,
    required this.hint,
    this.controller,
    this.suffixwidget,
    this.prefixwidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 36, //10
          right: MediaQuery.of(context).size.width / 36, //10
          top: MediaQuery.of(context).size.height / 77.2, //10
          bottom: MediaQuery.of(context).size.height / 77.2, //10
        ),
        decoration: BoxDecoration(
          color: themeProvider.isDarkMode ? Colors.grey[850] : accentColor,
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.height / 77.2), //10
        ),
        child: TextField(
          textAlign: TextAlign.start,
          controller: controller,
          cursorColor: themeProvider.isDarkMode ? whiteColor : textGrayColor,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 64.33, //12
              fontWeight: FontWeight.normal,
              color: themeProvider.isDarkMode ? whiteColor : textGrayColor,
            ),
            suffixIcon: suffixwidget,
            suffixIconColor:
                themeProvider.isDarkMode ? whiteColor : Colors.yellow,
            prefixIcon: prefixwidget,
            // disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      );
    });
  }
}
