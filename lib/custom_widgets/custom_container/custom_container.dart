// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final bool hasHorizontalMargin;
  final bool hasVerticalverticalMargin;
  final Color? selectedColor;
  double horizontalMargin;
  double verticalMargin;
  double borderRaduis;
  double padding;

  CustomContainer({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.hasHorizontalMargin = true,
    this.hasVerticalverticalMargin = true,
    this.selectedColor,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
    this.borderRaduis = 0,
    this.padding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(
          padding == 0 ? 8.0 : padding,
        ),
        margin: EdgeInsets.symmetric(
            horizontal: hasHorizontalMargin
                ? horizontalMargin == 0
                    ? constraints.maxWidth * 0.08
                    : horizontalMargin
                : 0,
            vertical: hasVerticalverticalMargin
                ? verticalMargin == 0
                    ? constraints.maxWidth * 0.01
                    : verticalMargin
                : 0),
        child: child,
        decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRaduis == 0 ? 18 : borderRaduis,
              ),
            ),
            border: Border.all(color: selectedColor!)),
      );
    });
  }
}
