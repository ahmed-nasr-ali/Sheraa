import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sheraa/utils/app_colors.dart';

class CustomSelector extends StatelessWidget {
  final Widget? title;
  final Widget? icon;
  final bool enableSuffixIcon;
  final bool hasHorizontalMargin;

  const CustomSelector({
    this.title,
    this.icon,
    this.enableSuffixIcon: true,
    this.hasHorizontalMargin: true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(
            horizontal: hasHorizontalMargin ? constraints.maxWidth * 0.03 : 0),
        height: 55,
        decoration: BoxDecoration(
          // border: Border.all(width: 1.0, color: hintColor),
          color: cardColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          children: <Widget>[
            Container(margin: EdgeInsets.symmetric(horizontal: 5), child: icon),
            // Consumer<AuthProvider>(builder: (context, authProvider, child) {
            //   return Container(
            //       margin: EdgeInsets.only(
            //           top: 5,
            //           left: authProvider.currentLang == 'en'
            //               ? constraints.maxWidth * 0.025
            //               : 0,
            //           right: authProvider.currentLang == 'ar'
            //               ? constraints.maxWidth * 0.025
            //               : 0),
            //       child: Container(
            //           width: constraints.maxWidth * 0.5, child: title));
            // }),
            Spacer(),
            enableSuffixIcon
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Image.asset(
                      'assets/images/downin.png',
                    ))
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Image.asset(
                      'assets/images/date.png',
                    ))
          ],
        ),
      );
    });
  }
}
