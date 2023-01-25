// ignore_for_file: unused_field, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/utils/app_colors.dart';

class SaveAdUserProfile extends StatefulWidget {
  UserEntity userDetails;
  String userImageUrl;
  String userLocaledType;
  String userCreatedAt;
  String userName;
  SaveAdUserProfile({
    Key? key,
    required this.userDetails,
    required this.userImageUrl,
    required this.userLocaledType,
    required this.userCreatedAt,
    required this.userName,
  }) : super(key: key);

  @override
  State<SaveAdUserProfile> createState() => _SaveAdUserProfileState();
}

class _SaveAdUserProfileState extends State<SaveAdUserProfile> {
  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: _height! / 58, //14
        ),
        Row(
          children: [
            SizedBox(
              width: _width! / 16.30434782608696, //23
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: _height! / 32.48, //25
                  backgroundImage: NetworkImage(
                    widget.userDetails.avatar ??
                        "https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png",
                  ),
                ),
                SizedBox(
                  height: _height! / 162.4, //5
                ),
                Image.asset("assets/images/rating.png"),
                SizedBox(
                  height: _height! / 116, //7
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: _width! / 7.5, //45
                        child: SmallText(
                          align: TextAlign.end,
                          maxLine: 1,
                          text: widget.userDetails.localedType ??
                              AppLocalizations.of(context)!.translate("Member"),

                          size: _height! / 81.2, //10
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        width: _width! / 75,
                      ),
                      Image.asset("assets/images/medal_star.png"),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: _width! / 26.78571428571429, //14
                  left: _width! / 26.78571428571429, //14
                  bottom: _height! / 40.6, //20
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              // color: mainAppColor,
                              width: _width! / 4.411764705882353, //85
                              child: SmallText(
                                align: TextAlign.start,
                                text: widget.userDetails.name ?? "",
                                color: blackColor,
                                typeOfFontWieght: 1,
                                size: _height! / 67.66666666666667, //12
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _height! / 203, //4
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: AppLocalizations.of(context)!
                                  .translate("Member since"),
                              size: _height! / 81.2, //10
                              color: textGrayColor,
                            ),
                            SizedBox(
                              width: _width! / 75, //5
                            ),
                            SmallText(
                              text:
                                  (widget.userDetails.createdAt)!.contains(" ")
                                      ? widget.userCreatedAt.split(" ")[0]
                                      : widget.userCreatedAt,
                              size: _height! / 81.2, //10
                              color: blackColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _height! / 203, //4
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: AppLocalizations.of(context)!
                                  .translate("Membership No"),
                              size: _height! / 81.2, //10
                              color: textGrayColor,
                            ),
                            SizedBox(
                              width: _width! / 75, //5
                            ),
                            SmallText(
                              text: (widget.userDetails.id).toString(),
                              size: _height! / 81.2, //10
                              color: blackColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: _height! / 40.6, //20
        ),
        Divider(
          height: 0,
          color: secondryMainColor,
          thickness: _height! / 162.4,
        ),
      ],
    );
  }
}
