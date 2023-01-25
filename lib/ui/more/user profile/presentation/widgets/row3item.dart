// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Row3Item extends StatelessWidget {
  double aboveHeight;
  double fristWidthSpacing;
  double secondWidthSpacing;
  double lastWidthSpacing;
  double blowHeight;

  final Widget myFristWidget;
  final Widget mySecondWidget;
  final Widget myLastWidget;

  Row3Item({
    Key? key,
    required this.aboveHeight,
    required this.fristWidthSpacing,
    required this.myFristWidget,
    required this.secondWidthSpacing,
    required this.mySecondWidget,
    required this.myLastWidget,
    required this.lastWidthSpacing,
    required this.blowHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: aboveHeight,
        ),
        Row(
          children: [
            SizedBox(
              width: fristWidthSpacing,
            ),
            myFristWidget,
            SizedBox(
              width: secondWidthSpacing,
            ),
            mySecondWidget,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  myLastWidget,
                  SizedBox(
                    width: lastWidthSpacing,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: blowHeight,
        )
      ],
    );
  }
}
