// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/providers/follow%20methods/follow_methods.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/account%20upgrade/account%20upgrade%20screen/account_upgrade_secreen.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/utils/app_colors.dart';

class UserINformation extends StatefulWidget {
  UserEntity userDetails;

  bool showViewsNo;
  bool userState;
  bool centerResponseSpeed;
  bool donotActiveFollow;

  double topSizebosHeight;
  double bottomSizboxHeight;
  double dividerThickness;
  bool splashEffect;
  final Function onTap;
  final Function? onViewTap;

  UserINformation({
    Key? key,
    required this.userState,
    required this.centerResponseSpeed,
    required this.showViewsNo,
    this.donotActiveFollow = false,
    required this.userDetails,
    required this.topSizebosHeight,
    required this.bottomSizboxHeight,
    required this.dividerThickness,
    required this.splashEffect,
    required this.onTap,
    this.onViewTap,
  }) : super(key: key);

  @override
  State<UserINformation> createState() => _UserINformationState();
}

class _UserINformationState extends State<UserINformation> {
  bool _isFollowed = false;

  @override
  void initState() {
    super.initState();
    _isFollowed = widget.userDetails.followed ?? false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<FollowMethodsProvider>(context, listen: false)
        .followedUser
        .forEach((element) {
      if (element["user_id"] == widget.userDetails.id) {
        setState(() {
          _isFollowed = element["type"];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return InkWell(
      splashColor: widget.splashEffect ? null : Colors.transparent,
      highlightColor: widget.splashEffect ? null : Colors.transparent,
      onTap: () {
        widget.onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.topSizebosHeight,
          ),
          Row(
            children: [
              SizedBox(
                width: _width / 16.30434782608696, //23
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: _height / 32.48, //25
                    backgroundImage:
                        NetworkImage(widget.userDetails.avatar ?? ""),
                  ),
                  SizedBox(
                    height: _height / 162.4, //5
                  ),
                  Image.asset("assets/images/ratingempty.png"),
                  SizedBox(
                    height: _height / 116, //7
                  ),
                  Container(
                    // width: _width / 6.048387096774194, //62
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: _width / 7.5, //45
                          child: SmallText(
                            align: TextAlign.end,
                            maxLine: 1,
                            text: widget.userDetails.localedType ?? "",
                            //  ??
                            //     AppLocalizations.of(context)!
                            //         .translate("Member"),
                            size: _height / 81.2, //10
                            color: blackColor,
                          ),
                        ),
                        SizedBox(
                          width: _width / 75,
                        ),
                        Image.asset("assets/images/medal_star.png"),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _width / 26.78571428571429, //14
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
                              width: _width / 4.411764705882353, //85
                              child: SmallText(
                                align: TextAlign.start,
                                text: widget.userDetails.name ?? "",
                                color: blackColor,
                                typeOfFontWieght: 1,
                                size: _height / 67.66666666666667, //12
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _height / 203, //4
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: AppLocalizations.of(context)!
                                  .translate("Documented"),
                              size: _height / 81.2,
                              color: textGrayColor,
                            ),
                            SizedBox(
                              width: _width / 53.57142857142857, //7
                            ),
                            Image.asset("assets/images/message.png"),
                            SizedBox(
                              width: _width / 93.75, //4
                            ),
                            Image.asset("assets/images/gmail.png"),
                          ],
                        ),
                        SizedBox(
                          height: _height / 203, //4
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: AppLocalizations.of(context)!
                                  .translate("Member since"),
                              size: _height / 81.2, //10
                              color: textGrayColor,
                            ),
                            SizedBox(
                              width: _width / 75, //5
                            ),
                            SmallText(
                              text: widget.userDetails.createdAt!.contains(" ")
                                  ? widget.userDetails.createdAt!.split(" ")[0]
                                  : widget.userDetails.createdAt ?? "",
                              size: _height / 81.2, //10
                              color: blackColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _height / 203, //4
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: AppLocalizations.of(context)!
                                  .translate("Membership No"),
                              size: _height / 81.2, //10
                              color: textGrayColor,
                            ),
                            SizedBox(
                              width: _width / 75, //5
                            ),
                            SmallText(
                              text: (widget.userDetails.id).toString(),
                              size: _height / 81.2, //10
                              color: blackColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    widget.userState
                        ? Padding(
                            padding: EdgeInsets.only(bottom: _height / 16.24),
                            child: SmallText(
                              text: AppLocalizations.of(context)!
                                  .translate("online"),

                              color: blackColor,
                              size: _height / 62.46153846153846, //13
                            ),
                          )
                        : Container(),
                    widget.showViewsNo
                        ? Padding(
                            padding: EdgeInsets.only(bottom: _height / 40.6),
                            child: InkWell(
                              onTap: () {
                                widget.onViewTap!();
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    color: mainAppColor,
                                  ),
                                  SmallText(
                                    text: "0",
                                    size: _height / 50.75,
                                    color: blackColor,
                                    typeOfFontWieght: 1,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : UserData.getUserId() == widget.userDetails.id
                            ? Container()
                            : Padding(
                                padding:
                                    EdgeInsets.only(bottom: _height / 16.24),
                                child: CustomButton(
                                    enableVerticalMargin: false,
                                    enableHorizontalMargin: false,
                                    enableCircleBorder: true,
                                    width: widget.userState
                                        ? (_isFollowed
                                            ? UserData.getUSerLang() == "ar"
                                                ? _width / 3.75
                                                : _width / 4.166666666666667
                                            : _width / 4.6875)
                                        : UserData.getUSerLang() == "ar"
                                            ? _width / 3.605769230769231
                                            : _width / 4.076086956521739, //92
                                    height: _height / 27.06666666666667, //35
                                    btnLbl: widget.userState
                                        ? (_isFollowed
                                            ? AppLocalizations.of(context)!
                                                .translate("followed")
                                            : AppLocalizations.of(context)!
                                                .translate("follow"))
                                        : AppLocalizations.of(context)!
                                            .translate("account_upgrade"),
                                    onPressedFunction: () async {
                                      if (!unAuthUser(context)) {
                                        if (widget.userState) {
                                          // if (widget.donotActiveFollow) {
                                          //   print("can not do follow method");
                                          // } else {
                                          bool x = await Provider.of<
                                              FollowMethodsProvider>(
                                            context,
                                            listen: false,
                                          ).followingUser(
                                            context,
                                            widget.userDetails.id.toString(),
                                          );

                                          if (x) {
                                            ///(عشان احدث ال Ui)
                                            setState(() {
                                              _isFollowed = !_isFollowed;
                                              Provider.of<FollowMethodsProvider>(
                                                      context,
                                                      listen: false)
                                                  .addfollowUser(
                                                {
                                                  "user_id":
                                                      widget.userDetails.id,
                                                  "type": _isFollowed,
                                                },
                                                widget.userDetails.id ?? 0,
                                              );
                                            });
                                            // }
                                          }
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      AccountUpgradeScreen()));
                                        }
                                      }
                                    },
                                    btnColor:
                                        _isFollowed ? mainAppColor : whiteColor,
                                    btnStyle: TextStyle(
                                        color: _isFollowed
                                            ? whiteColor
                                            : mainAppColor,
                                        fontSize: UserData.getUSerLang() == "ar"
                                            ? _height / 67.66666666666667
                                            : widget.userState
                                                ? _height / 67.66666666666667
                                                : _height / 116),
                                    borderColor: mainAppColor),
                              ),
                  ],
                ),
              ))
            ],
          ),
          SizedBox(
            height: widget.centerResponseSpeed
                ? _height / 81.2 //10
                : _height / 162.4, //5
          ),
          Row(
            mainAxisAlignment: widget.centerResponseSpeed
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              SizedBox(
                width:
                    widget.centerResponseSpeed ? 0 : _width / 3.571428571428571,
              ),
              Image.asset("assets/images/flash.png"),
              SmallText(
                text: AppLocalizations.of(context)!
                    .translate("Reply speed within 6 minutes"),
                size: _height / 67.66666666666667, //12
                color: blackColor,
              ),
            ],
          ),
          SizedBox(
            height: widget.bottomSizboxHeight, //20
          ),
          Divider(
            height: 0,
            color: secondryMainColor,
            thickness: widget.dividerThickness,
          ),
        ],
      ),
    );
  }
}
