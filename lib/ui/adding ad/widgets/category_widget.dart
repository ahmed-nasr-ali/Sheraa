// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class CategoryWidget extends StatefulWidget {
  String pageName;
  String categoryName;
  int categoryId;

  CategoryWidget({
    Key? key,
    required this.pageName,
    required this.categoryName,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: _height! / 62.46153846153846, //13
        ),
        Row(
          children: [
            SizedBox(
              width: _width! / 21.4375, //16
            ),
            Image.asset("assets/images/car.png"), //todo image from Api
            SizedBox(
              width: _width! / 37.5, //10
            ),
            SmallText(
                text: widget.categoryName,
                size: _height! / 58, //14
                color: blackColor,
                typeOfFontWieght: widget.pageName == "main category"
                    ? UserData.getMainCategoryId() == widget.categoryId
                        ? 1
                        : 0
                    : widget.pageName == "sub category"
                        ? UserData.getSubCategoryId() == widget.categoryId
                            ? 1
                            : 0
                        : widget.pageName == "choose city"
                            ? UserData.getAddingAddCountryId() ==
                                    widget.categoryId
                                ? 1
                                : 0
                            : UserData.getAddingAdAreaId() == widget.categoryId
                                ? 1
                                : 0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.pageName == "main category"
                      ? UserData.getMainCategoryId() == widget.categoryId
                          ? Image.asset(
                              "assets/images/checkbox.png",
                              color: mainAppColor,
                            )
                          : Image.asset("assets/images/check.png")
                      : widget.pageName == "sub category"
                          ? UserData.getSubCategoryId() == widget.categoryId
                              ? Image.asset(
                                  "assets/images/checkbox.png",
                                  color: mainAppColor,
                                )
                              : Image.asset("assets/images/check.png")
                          : widget.pageName == "choose city"
                              ? UserData.getAddingAddCountryId() ==
                                      widget.categoryId
                                  ? Image.asset(
                                      "assets/images/checkbox.png",
                                      color: mainAppColor,
                                    )
                                  : Image.asset("assets/images/check.png")
                              : UserData.getAddingAdAreaId() ==
                                      widget.categoryId
                                  ? Image.asset(
                                      "assets/images/checkbox.png",
                                      color: mainAppColor,
                                    )
                                  : Image.asset("assets/images/check.png")
                ],
              ),
            ),
            SizedBox(
              width: _width! / 18.75, //20
            )
          ],
        ),
        SizedBox(
          height: _height! / 62.46153846153846, //13
        ),
      ],
    );
  }
}
