// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/custom_item/custom_item.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/follow%20methods/follow_methods.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/pages/my%20ads%20screen/my_ads_Screen.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/controller/get_current_user_data_controller.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/pages/account%20verification%20screen/account_verification_screen.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/pages/change%20language%20screen/ChangeLanguage_screen.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/pages/change%20password%20screen/change_password_screen.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/pages/current%20user%20personal%20screen/current_user_personal_profile_screen.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/pages/following_users_screen/follower_users_screen.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/pages/rateing%20screen/rateing_screen.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/pages/setting%20notifications%20screen/setting_notifications_screen.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/widgets/rate_and_follower.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/widgets/user_information.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/ad%20user%20profile/following%20users%20screen/following_users_screen.dart';

import 'package:sheraa/utils/app_colors.dart';

import '../views screeen/views_Screeen.dart';

class CurrentUserInformations extends StatefulWidget {
  const CurrentUserInformations({Key? key}) : super(key: key);

  @override
  State<CurrentUserInformations> createState() =>
      _CurrentUserInformationsState();
}

class _CurrentUserInformationsState extends State<CurrentUserInformations> {
  double? _height;

  double? _width;

  bool initialRun = true;

  UserEntity? _userEntity;

  fetchCurrentuserData(BuildContext context) async {
    _userEntity =
        await GetCurrentUserDataController.fetchCurrentUserData(context);

    initialRun = false;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    fetchCurrentuserData(context);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset("assets/images/arrow_simple_chock.png")),
            title: SmallText(
                color: blackColor,
                size: _height! / 50.75, //16
                typeOfFontWieght: 1,
                text: AppLocalizations.of(context)!.translate("My Info")),
          ),
          body: initialRun
              ? Center(
                  child: SpinKitFadingCircle(color: mainAppColor),
                )
              : ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: _height! / 162.4, //5
                        ),
                        Divider(
                          height: 0,
                          color: containerColor,
                        ),
                        UserINformation(
                          userDetails: _userEntity!,
                          showViewsNo: true,
                          userState: false,
                          centerResponseSpeed: true,
                          bottomSizboxHeight: _height! / 35.30434782608696,
                          dividerThickness: _height! / 162.4,
                          topSizebosHeight: _height! / 54.13333333333333,
                          onTap: () {},
                          splashEffect: false,
                          onViewTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewsScreeen()));
                          },
                        ),
                        RateAndFollowes(
                            fristTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RateingScreen()));
                            },
                            fristText: "rateing",
                            fristNo: _userEntity!.reviewsCount ?? 0,
                            secondTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyAdsScreen()));
                            },
                            secondText: "_ads",
                            secondNo: _userEntity!.adsCount ?? 0,
                            thirdTap: () {
                              Provider.of<FollowMethodsProvider>(context,
                                      listen: false)
                                  .followingUsers
                                  .clear();

                              Provider.of<FollowMethodsProvider>(context,
                                      listen: false)
                                  .searchingFollowingUser
                                  .clear();

                              Provider.of<FollowMethodsProvider>(context,
                                      listen: false)
                                  .UserromoveformFollowinglist
                                  .clear();

                              Provider.of<FollowMethodsProvider>(context,
                                      listen: false)
                                  .UserAddToFollowingList
                                  .clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FollowingUserScreen(
                                            pageName: "Following page",
                                            isMyPage: true,
                                          )));
                            },
                            thirdText: "following",
                            thirdNo: _userEntity!.followingCount ?? 0,
                            fourthTap: () {
                              // Provider.of<FollowMethodsProvider>(context,
                              //         listen: false)
                              //     .followingUsers
                              //     .clear();

                              // Provider.of<FollowMethodsProvider>(context,
                              //         listen: false)
                              //     .searchingFollowingUser
                              //     .clear();

                              // Provider.of<FollowMethodsProvider>(context,
                              //         listen: false)
                              //     .UserromoveformFollowinglist
                              //     .clear();

                              // Provider.of<FollowMethodsProvider>(context,
                              //         listen: false)
                              //     .UserAddToFollowingList
                              //     .clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FolloweUsersScreen()
                                      // FollowingUserScreen(
                                      //       pageName: "not follow page",
                                      //       isMyPage: true,
                                      //     )
                                      ));
                            },
                            fourthText: "follower",
                            fourthNo: _userEntity!.followersCount ?? 0),
                        CustomItem(
                          paddingBetweenwidgets: UserData.getUSerLang() == "ar"
                              ? _width! / 37.5
                              : _width! / 31.25,
                          tapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CurrentUserPersonalProfileScreen(
                                          userDetails: _userEntity!,
                                        )));
                          },
                          hasLeadingImage: true,
                          imgUrl: "assets/images/usersmall.png",
                          title: AppLocalizations.of(context)!
                              .translate("Profile personly"),
                          hasTrailingImage: false,
                          trailingImageUrl: "assets/images/mada.png",
                          hasTrailingWidget: true,
                          trailingWidget: Icon(
                            UserData.getUSerLang() == "ar"
                                ? Icons.arrow_forward_ios
                                : Icons.arrow_back_ios,
                            size: _height! / 81.2,
                            color: textGrayColor,
                          ),
                        ),
                        Divider(
                          height: 0,
                          color: containerColor,
                          endIndent: _width! / 23.4375, //16
                          indent: _width! / 23.4375, //16
                        ),
                        CustomItem(
                          tapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChangePassword()));
                          },
                          hasLeadingImage: true,
                          imgUrl: "assets/images/lock.png",
                          title: AppLocalizations.of(context)!
                              .translate("Change password"),
                          hasTrailingImage: false,
                          trailingImageUrl: "assets/images/mada.png",
                          hasTrailingWidget: true,
                          trailingWidget: Icon(
                            UserData.getUSerLang() == "ar"
                                ? Icons.arrow_forward_ios
                                : Icons.arrow_back_ios,
                            size: _height! / 81.2,
                            color: textGrayColor,
                          ),
                        ),
                        Divider(
                          height: 0,
                          color: containerColor,
                          endIndent: _width! / 23.4375, //16
                          indent: _width! / 23.4375, //16
                        ),
                        CustomItem(
                          tapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AccountVerification()));
                          },
                          hasLeadingImage: true,
                          imgUrl: "assets/images/shield-tick.png",
                          title: AppLocalizations.of(context)!
                              .translate("Account Verification"),
                          hasTrailingImage: false,
                          trailingImageUrl: "assets/images/mada.png",
                          hasTrailingWidget: true,
                          trailingWidget: Icon(
                            UserData.getUSerLang() == "ar"
                                ? Icons.arrow_forward_ios
                                : Icons.arrow_back_ios,
                            size: _height! / 81.2,
                            color: textGrayColor,
                          ),
                        ),
                        Divider(
                          height: 0,
                          color: containerColor,
                          endIndent: _width! / 23.4375, //16
                          indent: _width! / 23.4375, //16
                        ),
                        CustomItem(
                          tapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SettingNotifications()));
                          },
                          hasLeadingImage: true,
                          imgUrl: "assets/images/lamp.png",
                          title: AppLocalizations.of(context)!
                              .translate("Notifications"),
                          hasTrailingImage: false,
                          trailingImageUrl: "assets/images/mada.png",
                          hasTrailingWidget: true,
                          trailingWidget: Icon(
                            UserData.getUSerLang() == "ar"
                                ? Icons.arrow_forward_ios
                                : Icons.arrow_back_ios,
                            size: _height! / 81.2,
                            color: textGrayColor,
                          ),
                        ),
                        Divider(
                          height: 0,
                          color: containerColor,
                          endIndent: _width! / 23.4375, //16
                          indent: _width! / 23.4375, //16
                        ),
                        CustomItem(
                          tapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeLanguageScreen()));
                          },
                          hasLeadingImage: true,
                          imgUrl: "assets/images/flagtwo.png",
                          title: AppLocalizations.of(context)!
                              .translate("language"),
                          hasTrailingImage: false,
                          trailingImageUrl: "assets/images/mada.png",
                          hasTrailingWidget: true,
                          trailingWidget: Icon(
                            UserData.getUSerLang() == "ar"
                                ? Icons.arrow_forward_ios
                                : Icons.arrow_back_ios,
                            size: _height! / 81.2,
                            color: textGrayColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
