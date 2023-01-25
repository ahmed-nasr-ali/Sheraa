// ignore_for_file: must_be_immutable, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/providers/follow%20methods/follow_methods.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';

class FollowUserBody extends StatefulWidget {
  User userInformation;
  String pageName;
  bool isMyPage;
  FollowUserBody({
    Key? key,
    required this.userInformation,
    required this.pageName,
    required this.isMyPage,
  }) : super(key: key);

  @override
  State<FollowUserBody> createState() => _FollowUserBodyState();
}

class _FollowUserBodyState extends State<FollowUserBody> {
  double? _height;

  double? _width;

  FollowMethodsProvider? followMethodsProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    followMethodsProvider =
        Provider.of<FollowMethodsProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _height! / 64.96, //12.5
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width! / 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: _height! / 32.48, //25
                    backgroundImage: NetworkImage(
                      widget.userInformation.avatar ??
                          'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                    ),
                  ),
                  SizedBox(
                    width: _width! / 37.5, //10
                  ),
                  Container(
                    width: _width! / 3.125,
                    child: SmallText(
                      align: TextAlign.start,
                      size: _height! / 54.66666666666667, //12
                      text: widget.userInformation.name ?? "لا يوجد اسم",

                      color: blackColor,
                      typeOfFontWieght: 1,
                    ),
                  ),
                ],
              ),
              UserData.getUserId() == widget.userInformation.id
                  ? Container()
                  : !widget.isMyPage
                      ? CustomButton(
                          enableVerticalMargin: false,
                          enableHorizontalMargin: false,
                          enableCircleBorder: true,
                          width: UserData.getUSerLang() == "ar"
                              ? _width! / 3.75
                              : _width! / 4.166666666666667, //80
                          height: _height! / 27.06666666666667, //35
                          btnLbl: followMethodsProvider!.UserromoveformFollowinglist
                                  .contains(widget.userInformation.id ?? 0)
                              ? AppLocalizations.of(context)!
                                  .translate("follow")
                              : followMethodsProvider!.UserAddToFollowingList
                                      .contains(widget.userInformation.id ?? 0)
                                  ? AppLocalizations.of(context)!
                                      .translate("followed")
                                  : widget.userInformation.followed == true
                                      ? AppLocalizations.of(context)!
                                          .translate("followed")
                                      : AppLocalizations.of(context)!
                                          .translate("follow"),
                          onPressedFunction: () async {
                            bool x = await Provider.of<FollowMethodsProvider>(
                              context,
                              listen: false,
                            ).followingUser(
                                context, widget.userInformation.id.toString());

                            if (x) {
                              if (widget.userInformation.followed == true) {
                                setState(() {
                                  followMethodsProvider!
                                      .removeUserFromFollowingList(
                                    widget.userInformation.id ?? 0,
                                  );
                                });
                              } else {
                                setState(() {
                                  followMethodsProvider!.adUserToFollowingList(
                                    widget.userInformation.id ?? 0,
                                  );
                                });
                              }
                            }
                          },
                          btnColor: followMethodsProvider!.UserromoveformFollowinglist
                                  .contains(widget.userInformation.id ?? 0)
                              ? whiteColor
                              : followMethodsProvider!.UserAddToFollowingList
                                      .contains(widget.userInformation.id ?? 0)
                                  ? mainAppColor
                                  : widget.userInformation.followed == true
                                      ? mainAppColor
                                      : whiteColor,
                          btnStyle: TextStyle(
                            color: followMethodsProvider!
                                    .UserromoveformFollowinglist
                                    .contains(widget.userInformation.id ?? 0)
                                ? mainAppColor
                                : followMethodsProvider!.UserAddToFollowingList
                                        .contains(
                                            widget.userInformation.id ?? 0)
                                    ? whiteColor
                                    : widget.userInformation.followed == true
                                        ? whiteColor
                                        : mainAppColor,
                            fontSize: UserData.getUSerLang() == "ar"
                                ? _height! / 67.66666666666667
                                : _height! / 67.66666666666667,
                          ),
                          borderColor: mainAppColor)
                      : widget.pageName == "Following page"
                          ? CustomButton(
                              enableVerticalMargin: false,
                              enableHorizontalMargin: false,
                              enableCircleBorder: true,
                              width: UserData.getUSerLang() == "ar"
                                  ? _width! / 3.75
                                  : _width! / 4.166666666666667, //80
                              height: _height! / 27.06666666666667, //35
                              btnLbl: followMethodsProvider!.UserromoveformFollowinglist.contains(widget.userInformation.id ?? 0)
                                  ? AppLocalizations.of(context)!.translate("follow")
                                  : AppLocalizations.of(context)!.translate("followed"),
                              onPressedFunction: () async {
                                bool x =
                                    await Provider.of<FollowMethodsProvider>(
                                  context,
                                  listen: false,
                                ).followingUser(
                                  context,
                                  widget.userInformation.id.toString(),
                                );
                                if (x) {
                                  setState(() {
                                    followMethodsProvider!
                                        .removeUserFromFollowingList(
                                      widget.userInformation.id ?? 0,
                                    );
                                  });
                                }
                              },
                              btnColor: followMethodsProvider!.UserromoveformFollowinglist.contains(widget.userInformation.id ?? 0) ? whiteColor : mainAppColor,
                              btnStyle: TextStyle(
                                color: followMethodsProvider!
                                        .UserromoveformFollowinglist
                                        .contains(
                                            widget.userInformation.id ?? 0)
                                    ? mainAppColor
                                    : whiteColor,
                                fontSize: UserData.getUSerLang() == "ar"
                                    ? _height! / 67.66666666666667
                                    : _height! / 67.66666666666667,
                              ),
                              borderColor: mainAppColor)
                          : CustomButton(
                              enableVerticalMargin: false,
                              enableHorizontalMargin: false,
                              enableCircleBorder: true,
                              width: UserData.getUSerLang() == "ar" ? _width! / 3.75 : _width! / 4.166666666666667, //80
                              height: _height! / 27.06666666666667, //35
                              btnLbl: followMethodsProvider!.UserromoveformFollowinglist.contains(widget.userInformation.id ?? 0)
                                  ? AppLocalizations.of(context)!.translate("follow")
                                  : followMethodsProvider!.UserAddToFollowingList.contains(widget.userInformation.id ?? 0)
                                      ? AppLocalizations.of(context)!.translate("followed")
                                      : widget.userInformation.followed == true
                                          ? AppLocalizations.of(context)!.translate("followed")
                                          : AppLocalizations.of(context)!.translate("follow"),
                              onPressedFunction: () async {
                                bool x =
                                    await Provider.of<FollowMethodsProvider>(
                                  context,
                                  listen: false,
                                ).followingUser(context,
                                        widget.userInformation.id.toString());

                                if (x) {
                                  if (widget.userInformation.followed == true) {
                                    setState(() {
                                      followMethodsProvider!
                                          .removeUserFromFollowingList(
                                        widget.userInformation.id ?? 0,
                                      );
                                    });
                                  } else {
                                    setState(() {
                                      followMethodsProvider!
                                          .adUserToFollowingList(
                                        widget.userInformation.id ?? 0,
                                      );
                                    });
                                  }
                                }
                              },
                              btnColor: followMethodsProvider!.UserromoveformFollowinglist.contains(widget.userInformation.id ?? 0)
                                  ? whiteColor
                                  : followMethodsProvider!.UserAddToFollowingList.contains(widget.userInformation.id ?? 0)
                                      ? mainAppColor
                                      : widget.userInformation.followed == true
                                          ? mainAppColor
                                          : whiteColor,
                              btnStyle: TextStyle(
                                color: followMethodsProvider!
                                        .UserromoveformFollowinglist
                                        .contains(
                                            widget.userInformation.id ?? 0)
                                    ? mainAppColor
                                    : followMethodsProvider!
                                            .UserAddToFollowingList
                                            .contains(
                                                widget.userInformation.id ?? 0)
                                        ? whiteColor
                                        : widget.userInformation.followed ==
                                                true
                                            ? whiteColor
                                            : mainAppColor,
                                fontSize: UserData.getUSerLang() == "ar"
                                    ? _height! / 67.66666666666667
                                    : _height! / 67.66666666666667,
                              ),
                              borderColor: mainAppColor),
            ],
          ),
        ),
        SizedBox(
          height: _height! / 64.96, //12.5
        ),
      ],
    );
  }
}
