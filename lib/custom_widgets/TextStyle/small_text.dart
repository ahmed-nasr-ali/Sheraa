// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/providers/theme_provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double? textHight;
  double? size;
  TextAlign align;
  FontWeight fontWeight;
  int? typeOfFontWieght;
  int? maxLine;
  SmallText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF959595),
    this.textHight = 0,
    this.size = 0,
    this.align = TextAlign.center,
    this.maxLine = 1,
    this.fontWeight = FontWeight.normal,
    this.typeOfFontWieght = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: align,
      maxLines: maxLine == 1 ? 1 : maxLine,
      style: TextStyle(
        height: textHight == 0 ? 0 : textHight,
        color: color == Color(0xFF959595)
            ? themeProvider.isDarkMode
                ? textGrayColor
                : textGrayColor
            : color,
        fontSize: size == 0
            ? MediaQuery.of(context).size.height / 62.46153846153846
            : size, //13
        fontWeight: typeOfFontWieght == 0 ? fontWeight : FontWeight.bold,
        fontFamily: 'RB',
      ),
    );
  }
}
