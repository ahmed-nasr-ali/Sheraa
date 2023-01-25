// ignore_for_file: unused_local_variable, must_be_immutable, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/deep%20link/firebase_dynamic_link.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/ad.dart';
import 'package:sheraa/providers/follow%20methods/follow_methods.dart';
import 'package:sheraa/providers/user%20profile%20data/user_profile_data.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/pages/my%20ads%20screen/my_ads_screen.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/pages/rateing%20screen/rateing_screen.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/widgets/rate_and_follower.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/widgets/rate_details.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/widgets/user_information.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/ad%20user%20profile/following%20users%20screen/following_users_screen.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/ad%20user%20profile/user%20ads%20list/ad_user_ads_list.dart';

import 'package:sheraa/ui/specific%20ad/widgets/communication%20part/communication_part.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:sheraa/utils/error.dart';

import '../report ad user profile screen/report_abuse_screen.dart';

class AdUserProfile extends StatefulWidget {
  UserEntity? userDetails;
  bool isDeepLink;
  String deepLink_ad_Id;
  bool isHiddenContact;
  AdUserProfile({
    Key? key,
    this.userDetails,
    this.isDeepLink = false,
    this.deepLink_ad_Id = "",
    this.isHiddenContact = false,
  }) : super(key: key);

  @override
  State<AdUserProfile> createState() => _AdUserProfileState();
}

class _AdUserProfileState extends State<AdUserProfile> {
  double? _height;

  double? _width;

  Future<User>? _userDetails;

  bool initialRun = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.isDeepLink) {
      if (initialRun) {
        _userDetails = Provider.of<UserProfileProvider>(context, listen: false)
            .getUserDataById(
          context,
          widget.deepLink_ad_Id.split("=")[1],
        );
        print(widget.deepLink_ad_Id.split("=")[1]);
        initialRun = false;
      }
    }
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
            actions: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportAdUserProfileScreen(),
                    ),
                  );
                },
                child: Container(
                  width: _width! / 18.75, //20
                  height: _height! / 40.6, //20
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/report_black.png"))),
                ),
              ),
              SizedBox(
                width: _width! / 25, //15
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  String _generateLink =
                      await CreateFirebaseDynamicLink.createDynamicLink(
                    widget.userDetails!.id ?? 0,
                    false,
                    isUserHiddenContact: widget.isHiddenContact,
                  );
                  print(_generateLink);
                  print(widget.userDetails!.id);

                  await Share.share(_generateLink);
                },
                child: Container(
                  width: _width! / 25, //15
                  height: _height! / 54.13333333333333, //15
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/blutooth.png"))),
                ),
              ),
              SizedBox(
                width: _width! / 18.75, //20
              )
            ],
            title: SmallText(
                color: blackColor,
                size: _height! / 50.75, //16
                typeOfFontWieght: 1,
                text: AppLocalizations.of(context)!
                    .translate("Account Information")),
          ),
          body: widget.isDeepLink
              ? buildBodyOfUserOpenedByDeepLink()
              : ListView(
                  children: [
                    Column(
                      children: [
                        Divider(
                          height: 0,
                        ),
                        UserINformation(
                          userDetails: widget.userDetails!,
                          showViewsNo: false,
                          userState: true,
                          centerResponseSpeed: true,
                          donotActiveFollow: true,
                          bottomSizboxHeight: _height! / 35.30434782608696,
                          dividerThickness: _height! / 162.4,
                          topSizebosHeight: _height! / 54.13333333333333,
                          splashEffect: false,
                          onTap: () {},
                        ),

                        widget.isHiddenContact
                            ? Container()
                            : CommunicationPart(
                                pageName: "notMyAd",
                                userphoneNUmber:
                                    widget.userDetails!.phone ?? "",
                                isHiddenContact: false,
                              ),

                        // buildFollowersPart(_height, _width),
                        RateAndFollowes(
                          fristTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RateingScreen()));
                          },
                          fristText: "rateing",
                          fristNo: widget.userDetails!.reviewsCount ?? 0,
                          secondTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => widget.userDetails!.id ==
                                        UserData.getUserId()
                                    ? MyAdsScreen()
                                    : AdUserAdsList(
                                        userId: widget.userDetails!.id ?? 0,
                                        userName:
                                            widget.userDetails!.name ?? ""),
                              ),
                            );
                          },
                          secondText: "_ads",
                          secondNo: widget.userDetails!.adsCount ?? 0,
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
                                          isMyPage: false,
                                          userID:
                                              widget.userDetails!.id.toString(),
                                        )));
                          },
                          thirdText: "following",
                          thirdNo: widget.userDetails!.followingCount ?? 0,
                          fourthTap: () {
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
                                          pageName: "not Following page",
                                          isMyPage: false,
                                          userID:
                                              widget.userDetails!.id.toString(),
                                        )));
                          },
                          fourthText: "follower",
                          fourthNo: widget.userDetails!.followersCount ?? 0,
                        ),
                        RateDetails(
                          rateNumber: 0,
                          starNumber: 0,
                        ),
                        SizedBox(
                          height: _height! / 81.2, //10
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _width! / 20.83333333333333),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(
                                size: _height! / 58,
                                text: AppLocalizations.of(context)!
                                    .translate("comments"),
                                typeOfFontWieght: 1,
                                color: blackColor,
                              ),
                              SmallText(
                                size: _height! / 67.66666666666667, //12
                                text:
                                    "0 ${AppLocalizations.of(context)!.translate("comment")}",
                                color: textGrayColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildBodyOfUserOpenedByDeepLink() {
    return FutureBuilder<User>(
        future: _userDetails,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: SpinKitFadingCircle(color: mainAppColor),
              );

            case ConnectionState.active:
              return Text("");

            case ConnectionState.waiting:
              return Center(
                child: SpinKitFadingCircle(color: mainAppColor),
              );

            case ConnectionState.done:
              if (snapshot.hasError) {
                return Error(
                  errorMessage:
                      AppLocalizations.of(context)!.translate('error'),
                  onRetryPressed: () {},
                );
              } else {
                return ListView(
                  children: [
                    Divider(
                      height: 0,
                    ),
                    // UserINformation(
                    //   userDetails: snapshot.data!,
                    //   showViewsNo: false,
                    //   userState: true,
                    //   centerResponseSpeed: true,
                    //   donotActiveFollow: true,
                    //   userImgaeUrl: snapshot.data!.avatar ??
                    //       "https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png",
                    //   userLocaledType: snapshot.data!.localedType ?? "عميل",
                    //   userCreatedAt: snapshot.data!.createdAt ?? "",
                    //   userName: snapshot.data!.name ?? "لا يوجد اسم",
                    //   bottomSizboxHeight: _height! / 35.30434782608696,
                    //   dividerThickness: _height! / 162.4,
                    //   topSizebosHeight: _height! / 54.13333333333333,
                    //   splashEffect: false,
                    //   onTap: () {},
                    // ),
                    widget.isHiddenContact
                        ? Container()
                        : CommunicationPart(
                            pageName: "notMyAd",
                            userphoneNUmber: snapshot.data!.phone ?? "",
                            isHiddenContact: false,
                          ),
                    RateAndFollowes(
                      fristTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RateingScreen()));
                      },
                      fristText: "rateing",
                      fristNo: snapshot.data!.reviewsCount ?? 9,
                      secondTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                snapshot.data!.id == UserData.getUserId()
                                    ? MyAdsScreen()
                                    : AdUserAdsList(
                                        userId: snapshot.data!.id ?? 0,
                                        userName: snapshot.data!.name ??
                                            "لا يوجد اسم",
                                      ),
                          ),
                        );
                      },
                      secondText: "_ads",
                      secondNo: snapshot.data!.adsCount ?? 9,
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
                                      isMyPage: false,
                                      userID: snapshot.data!.id.toString(),
                                    )));
                      },
                      thirdText: "following",
                      thirdNo: snapshot.data!.followingCount ?? 9,
                      fourthTap: () {
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
                                      pageName: "not Following page",
                                      isMyPage: false,
                                      userID: snapshot.data!.id.toString(),
                                    )));
                      },
                      fourthText: "follower",
                      fourthNo: snapshot.data!.followersCount ?? 9,
                    ),
                    RateDetails(
                      rateNumber: 0,
                      starNumber: 0,
                    ),
                    SizedBox(
                      height: _height! / 81.2, //10
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _width! / 20.83333333333333),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            size: _height! / 58,
                            text: AppLocalizations.of(context)!
                                .translate("comments"),
                            typeOfFontWieght: 1,
                            color: blackColor,
                          ),
                          SmallText(
                            size: _height! / 67.66666666666667, //12
                            text:
                                "0 ${AppLocalizations.of(context)!.translate("comment")}",
                            color: textGrayColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
          }
        });
  }
}
