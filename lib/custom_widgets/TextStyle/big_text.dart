import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/providers/theme_provider.dart';

import '../../../../utils/app_colors.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  TextOverflow? overflow;
  int? typeOfFontWieght;
  TextAlign align;
  FontWeight fontWeight;

  BigText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF000000),
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
    this.typeOfFontWieght = 0,
    this.align = TextAlign.center,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      textAlign: align,
      // ignore: prefer_const_constructors
      style: TextStyle(
        color: color == const Color(0xFF000000)
            ? (themeProvider.isDarkMode ? whiteColor : blackColor)
            : color,
        fontSize:
            size == 0 ? MediaQuery.of(context).size.height / 32.167 : size, //24
        fontWeight: typeOfFontWieght == 0 ? fontWeight : FontWeight.bold,
        fontFamily: 'RB',
      ),
    );
  }
}
