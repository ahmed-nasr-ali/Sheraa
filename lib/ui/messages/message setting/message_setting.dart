// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/custom_item/custom_item.dart';
import 'package:sheraa/locale/app_localizations.dart';

class MessageSetting extends StatefulWidget {
  const MessageSetting({Key? key}) : super(key: key);

  @override
  State<MessageSetting> createState() => _MessageSettingState();
}

class _MessageSettingState extends State<MessageSetting> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(child: Container()),
        Container(
          height: _height / 162.4, //5
          width: _width / 9.375, //40
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_height / 162.4 // 5
                ),
            color: Color(0xFFEFEFEF),
          ),
        ),
        SizedBox(
          height: _height / 81.2, //10
        ),
        Container(
          width: _width,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_height / 32.48), //25
                topRight: Radius.circular(_height / 32.48), //25
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: _height / 40.6, //17
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _width / 26.78571428571429),
                  child: CustomItem(
                    imgUrl: "assets/images/verify.png",
                    hasLeadingWidget: false,
                    hasTrailingWidget: false,
                    hasLeadingImage: true,
                    title:
                        AppLocalizations.of(context)!.translate("Delete Chats"),
                    hasTrailingImage: false,
                    tapFunction: () {},
                    rightPadding: MediaQuery.of(context).size.width /
                        53.57142857142857, //7
                    leftPadding: MediaQuery.of(context).size.width /
                        53.57142857142857, //7

                    topPadding: 0,
                    bottomPadding: _height / 50.75,
                  ),
                ),
                Divider(
                  height: 0,
                  color: Color(0xFFEBEBEB),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _width / 26.78571428571429 //14
                      ),
                  child: CustomItem(
                    imgUrl: "assets/images/verify.png",
                    hasLeadingWidget: false,
                    hasTrailingWidget: false,
                    hasLeadingImage: true,
                    title: AppLocalizations.of(context)!
                        .translate("Mark all as read"),
                    hasTrailingImage: false,
                    tapFunction: () {},
                    rightPadding: MediaQuery.of(context).size.width /
                        53.57142857142857, //7
                    leftPadding: MediaQuery.of(context).size.width /
                        53.57142857142857, //7

                    topPadding: _height / 62.46153846153846, //12
                    bottomPadding: _height / 50.75,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
