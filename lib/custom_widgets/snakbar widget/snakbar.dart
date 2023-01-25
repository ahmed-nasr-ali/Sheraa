import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/utils/app_colors.dart';

void snakBarWidget({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SmallText(
        text: content,
        size: 12,
        typeOfFontWieght: 1,
        color: whiteColor,
      ),
      backgroundColor: mainAppColor,
    ),
  );
}
