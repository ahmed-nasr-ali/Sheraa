// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/specific%20ad/domine/entity/replies_entity.dart';
import 'package:sheraa/utils/app_colors.dart';

class ReplyCommentWidget extends StatelessWidget {
  RepliesEntity repliesObject;

  ReplyCommentWidget({
    Key? key,
    required this.repliesObject,
  }) : super(key: key);
  double? _height;

  double? _width;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        right: UserData.getUSerLang() == "ar"
            ? (_width! / 28.84615384615385) + (2 * _width! / 25)
            : _width! / 18.75,
        left: UserData.getUSerLang() == "ar"
            ? _width! / 18.75
            : (_width! / 28.84615384615385) + (2 * _width! / 25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: _width! / 23.4375, //16
              ),
              CircleAvatar(
                radius: _width! / 21.42857142857143, //17.5
                backgroundImage: NetworkImage(repliesObject.userAvatar ?? ""),
              ),
              SizedBox(
                width: _width! / 53.57142857142857, //7
              ),
              Column(
                children: [
                  Container(
                    width: _width! / 1.875, //62
                    child: SmallText(
                      align: TextAlign.start,
                      text: repliesObject.userName ?? "", color: blackColor,
                      typeOfFontWieght: 1,
                      size: _height! / 67.66666666666667, //12
                    ),
                  ),
                  Container(
                    width: _width! / 1.875,
                    child: SmallText(
                      align: TextAlign.start,
                      text: repliesObject.createdAt ?? "",
                      size: _height! / 81.2,
                      color: textGrayColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              right: UserData.getUSerLang() == "ar"
                  ? (_width! / 23.4375) +
                      (2 * _width! / 21.42857142857143) +
                      (_width! / 53.57142857142857)
                  : _width! / 18.75,
              left: UserData.getUSerLang() == "ar"
                  ? _width! / 18.75
                  : (_width! / 23.4375) +
                      (2 * _width! / 21.42857142857143) +
                      (_width! / 53.57142857142857),
            ),
            child: SmallText(
              align: TextAlign.start,
              maxLine: 3,
              text: repliesObject.replay ?? "",
              color: blackColor,
              typeOfFontWieght: 0,
              size: _height! / 67.66666666666667, //12
            ),
          ),
          SizedBox(
            height: _height! / 101.5,
          )
        ],
      ),
    );
  }
}
