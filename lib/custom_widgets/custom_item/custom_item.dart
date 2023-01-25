// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  double? leftPadding;
  double? rightPadding;
  double? topPadding;
  double? bottomPadding;
  double? paddingBetweenwidgets;
  double? bottomPaddingForContainer;
  final bool? hasLeadingImage;
  final bool? hasLeadingWidget;
  final Widget? leadingWidget;
  final String? imgUrl;
  final String? title;
  final bool? setColor;
  final bool? hasTrailingImage;
  final bool? hasTrailingWidget;
  final String? trailingImageUrl;
  final Widget? trailingWidget;
  final Function? tapFunction;
  CustomItem({
    Key? key,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
    this.bottomPaddingForContainer = 0,
    this.imgUrl,
    this.title,
    this.setColor,
    this.hasTrailingImage,
    this.hasTrailingWidget = false,
    this.trailingImageUrl,
    this.trailingWidget,
    this.tapFunction,
    this.hasLeadingImage,
    this.hasLeadingWidget = false,
    this.leadingWidget,
    this.paddingBetweenwidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom:
              bottomPaddingForContainer == 0 ? 0 : bottomPaddingForContainer!),
      child: InkWell(
        onTap: () {
          tapFunction!();
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding != null
                ? topPadding!
                : MediaQuery.of(context).size.height / 58, //14
            bottom: bottomPadding != null
                ? bottomPadding!
                : MediaQuery.of(context).size.height / 67.66666666666667, //12
            right: rightPadding != null
                ? rightPadding!
                : MediaQuery.of(context).size.width / 23.4375, //16,
            left: leftPadding != null
                ? leftPadding!
                : MediaQuery.of(context).size.width / 23.4375, //16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  hasLeadingImage!
                      ? Container(
                          child: Image.asset(
                            imgUrl!,
                          ),
                        )
                      : hasLeadingWidget!
                          ? Container(
                              child: leadingWidget,
                            )
                          : Container(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: paddingBetweenwidgets != null
                            ? paddingBetweenwidgets!
                            : MediaQuery.of(context).size.width / 37.5),
                    child: Text(
                      title!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height /
                            67.66666666666667, //12
                      ),
                    ),
                  )
                ],
              ),
              hasTrailingImage!
                  ? Container(
                      child: Image.asset(
                        trailingImageUrl!,
                        // color: mainAppColor,
                      ),
                    )
                  : hasTrailingWidget!
                      ? Container(
                          child: trailingWidget,
                        )
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
