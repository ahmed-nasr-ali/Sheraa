import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/dialogs/log_out_dialog.dart';
import 'package:sheraa/providers/401_auth_error.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/ui/more/account%20upgrade/account%20upgrade%20screen/account_upgrade_secreen.dart';
import 'package:sheraa/ui/more/ad%20pormotion/ad%20pormotion%20screen/ad_pormotion_screen.dart';
import 'package:sheraa/ui/more/ad%20requests/ad%20requests%20screen/ad_requests_screen.dart';
import 'package:sheraa/ui/more/balance/balance%20screen/balance_screen.dart';
import 'package:sheraa/ui/more/favorite%20ads/favorite_ads_screen.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/pages/my%20ads%20screen/my_ads_screen.dart';
import 'package:sheraa/ui/more/my%20ads/new/presentation/providers/active_ads_provider.dart';
import 'package:sheraa/ui/more/my%20movement/my%20movement%20screen/my_movement_screen.dart';
import 'package:sheraa/ui/more/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:sheraa/ui/more/regester%20and%20log%20in/regester/sign%20up/sign_up.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/pages/1%20-current%20user%20information%20screen/current_user_information_screen.dart';
import 'package:sheraa/ui/more/widgets/more_item.dart';
import 'package:sheraa/utils/app_colors.dart';

import 'balance/terms and conditions screen/terms_and_conditions_screen.dart';
import 'earn points/earn points screen/earn_points_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  AuthProvider? _authProvider;
  String userType = '';
  @override
  void initState() {
    super.initState();
    print(UserData.getUserApiToken());

    print("user Id is :  ${UserData.getUserId()}");

    print("user name is : ${UserData.getUserName()}");

    UserData.setFirebaseUserToken('');

    UserData.setUserphoneNumberForRegester('');

    UserData.setUserphoneNumberWithoutCode("");
  }

  double _height = 0, _width = 0;
  bool _isclicked = false;
  bool initialRun = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (initialRun) {
      _authProvider = Provider.of<AuthProvider>(
        context,
      );
      if (_authProvider!.currentUser != null) {
        userType = _authProvider!.currentUser!.localedType!;
      } else {
        print("No user");
      }

      initialRun = false;
    }
  }

  Widget _buildLoginContent() {
    return Container(
      child: Column(
        children: [
          CustomButton(
              btnLbl:
                  AppLocalizations.of(context)!.translate('login_or_singup'),
              onPressedFunction: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SignUPScreen(),
                      );
                    });
              },
              btnColor: whiteColor,
              enableHorizontalMargin: true,
              btnStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: mainAppColor),
              borderColor: mainAppColor),
          Container(
            height: _height * 0.04,
            margin: EdgeInsets.symmetric(horizontal: _width * 0.04),
            decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.translate('login_register_des'),
              textAlign: TextAlign.center,
              style: TextStyle(color: textGrayColor, fontSize: 14),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 8,
            color: accentColor,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: whiteColor,
      child: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            leading: Image.asset('assets/images/user.png'),
            title: Text(
              _authProvider!.currentUser != null
                  ? AppLocalizations.of(context)!.translate('hello') +
                      " "
                          "${_authProvider!.currentUser!.name}"
                  : AppLocalizations.of(context)!.translate('hello'),
              style: TextStyle(color: blackColor, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              userType.isEmpty
                  ? AppLocalizations.of(context)!.translate('ad_destination')
                  : userType == "customer"
                      ? AppLocalizations.of(context)!.translate('member')
                      : userType == "seller"
                          ? AppLocalizations.of(context)!
                              .translate('certified_seller')
                          : '',
              style: TextStyle(
                  color: secondGrayColor,
                  fontWeight: FontWeight.w200,
                  fontSize: 14),
            ),
            trailing: Image.asset('assets/images/arrow_simple.png'),
            onTap: () {
              if (!unAuthUser(context, isHome: true)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CurrentUserInformations()
                        //  UserProfileScreen()
                        ));
              }
            },
          ),
          SizedBox(
            height: 5,
          ),
          _authProvider!.currentUser != null &&
                  _authProvider!.currentUser!.type == "seller"
              ? Container(
                  height: _height * 0.055,
                  margin: EdgeInsets.symmetric(
                    horizontal: _width * 0.04,
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xff3BBEEF).withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!
                        .translate('user_duration_package'),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: mainAppColor, fontSize: 11),
                  ),
                )
              : Container(),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 8,
            color: accentColor,
          ),
          _authProvider!.currentUser == null
              ? _buildLoginContent()
              : Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: _width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!unAuthUser(context, isHome: true)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BalanceScreen(),
                            ),
                          );
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/wallet.png',
                            alignment: Alignment.center,
                          ),
                          Container(
                            width: _width * 0.3,
                            child: Text(
                              AppLocalizations.of(context)!.translate('wallet'),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          if (!unAuthUser(context, isHome: true)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EarnPointScreen()));
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/star.png'),
                            Container(
                              width: _width * 0.3,
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('earned_points'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                            )
                          ],
                        )),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          if (!unAuthUser(context, isHome: true)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MYMovementScreen()));
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/mouse.png'),
                            Container(
                              width: _width * 0.3,
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('my_movements'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13)),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 8,
                color: accentColor,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: _width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!unAuthUser(context, isHome: true)) {
                          Provider.of<MyActiveAdsProvider>(context,
                                  listen: false)
                              .setAllDateToDefault();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyAdsScreen()));
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/subtitle.png',
                          ),
                          Container(
                            width: _width * 0.3,
                            child: Text(
                                AppLocalizations.of(context)!.translate(
                                  'my_ads',
                                ),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12)),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          if (!unAuthUser(context, isHome: true)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavoriteAdsScreen()));
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/lovely.png'),
                            Container(
                              width: _width * 0.3,
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('myfavorite_ads'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                            )
                          ],
                        )),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          if (!unAuthUser(context, isHome: true)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdRequestsScreen()));
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/search-status.png'),
                            Container(
                              width: _width * 0.3,
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('ad_requests'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 8,
                color: accentColor,
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: _width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!unAuthUser(context, isHome: true)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AccountUpgradeScreen()));
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/ranking.png'),
                          Container(
                            width: _width * 0.3,
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('account_upgrade'),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12)),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          if (!unAuthUser(context, isHome: true)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdPormotionScreen()));
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/crown.png'),
                            Container(
                              width: _width * 0.3,
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('ad_pormotion'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                            )
                          ],
                        )),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          if (!unAuthUser(context, isHome: true)) {}
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/page.png'),
                            Container(
                              width: _width * 0.3,
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('create_your_page'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              userType == "customer"
                  ? Divider(
                      thickness: 8,
                      color: accentColor,
                    )
                  : Container(),
              userType == "customer"
                  ? MoreItem(
                      imgUrl: 'assets/images/ticket-discount.png',
                      title: AppLocalizations.of(context)!
                          .translate('coupon_stats'),
                      hastrailingImage: false,
                      hastrailingTilte: false,
                      route: '/AccountTypes',
                    )
                  : Container(),
              Divider(
                thickness: 8,
                color: accentColor,
              ),
              MoreItem(
                imgUrl: 'assets/images/people.png',
                title: AppLocalizations.of(context)!.translate('account_type'),
                hastrailingImage: false,
                hastrailingTilte: false,
                route: '/AccountTypes',
              ),
              Divider(
                color: accentColor,
                thickness: 2,
              ),
            ],
          ),
          MoreItem(
            imgUrl: 'assets/images/star.png',
            title: AppLocalizations.of(context)!.translate("points_system"),
            hastrailingImage: false,
            hastrailingTilte: false,
            route: '/PointsEarnedSystem',
          ),
          Divider(
            thickness: 2,
            color: accentColor,
          ),
          MoreItem(
            route: '/choose_countrt_in_more',
            imgUrl: 'assets/images/global.png',
            title: AppLocalizations.of(context)!.translate('country'),
            hastrailingImage: false,
            trailingImageUrl: 'assets/images/saudi-arabia.png',
            hasTrailingWidget: true,
            trailingWidget: UserData.getCountryImageUrl() == ""
                ? Container(
                    width: MediaQuery.of(context).size.width / 18.75, //20
                    height: MediaQuery.of(context).size.height / 40.6, //20
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/saudi-arabia.png"),
                          fit: BoxFit.cover),
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width / 18.75, //20
                    height: MediaQuery.of(context).size.height / 40.6, //20
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(UserData.getCountryImageUrl()!),
                          fit: BoxFit.cover),
                    ),
                  ),
            hastrailingTilte: false,
          ),
          Divider(
            thickness: 3,
            color: accentColor,
            indent: 15.0,
            endIndent: 10,
          ),
          MoreItem(
            // route: '/choose_city_in_more',
            imgUrl: 'assets/images/global.png',
            title: AppLocalizations.of(context)!.translate("_country"),
            hastrailingImage: false,
            hastrailingTilte: true,
            trailingTitle: 'الرياض',
          ),
          Divider(
            thickness: 3,
            color: accentColor,
            indent: 15.0,
            endIndent: 10,
          ),
          MoreItem(
            imgUrl: 'assets/images/moon.png',
            title: AppLocalizations.of(context)!.translate("night_mode"),
            hastrailingImage: false,
            hastrailingTilte: false,
            hasSwitch: true,
          ),
          Divider(
            thickness: 3,
            color: accentColor,
            indent: 15.0,
            endIndent: 10,
          ),
          MoreItem(
            isAuthCheck: true,
            imgUrl: 'assets/images/calling.png',
            title: AppLocalizations.of(context)!.translate("contact_us"),
            hastrailingImage: false,
            hastrailingTilte: false,
          ),
          Divider(
            thickness: 3,
            color: accentColor,
            indent: 15.0,
            endIndent: 10,
          ),
          MoreItem(
            isAuthCheck: true,
            route: '/Join_our_team_screen',
            imgUrl: 'assets/images/user-add.png',
            title: AppLocalizations.of(context)!.translate("join_our_team"),
            hastrailingImage: false,
            hastrailingTilte: false,
          ),
          Container(
            // height: _height * 0.04,
            // margin: EdgeInsets.symmetric(horizontal: _width * 0.04),
            decoration: BoxDecoration(
              color: accentColor,
              //borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _authProvider!.currentUser == null
                    ? Container()
                    : Container(
                        color: whiteColor,
                        child: CustomButton(
                            btnLbl: AppLocalizations.of(context)!
                                .translate('logout'),
                            onPressedFunction: () {},
                            btnColor: whiteColor,
                            enableHorizontalMargin: true,
                            btnStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mainAppColor),
                            borderColor: mainAppColor),
                      ),
                _authProvider!.currentUser == null
                    ? Container()
                    : Container(
                        color: whiteColor,
                        child: CustomButton(
                            btnLbl: AppLocalizations.of(context)!
                                .translate('logout'),
                            onPressedFunction: () async {
                              showDialog(
                                  context: context,
                                  builder: (builder) => LogoutDialog(
                                        alertMessage:
                                            AppLocalizations.of(context)!
                                                .translate("want_to_logout"),
                                        onPressedConfirm: () {
                                          _authProvider!.logoutUser(context);
                                        },
                                      ));
                            },
                            btnColor: whiteColor,
                            enableHorizontalMargin: true,
                            btnStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mainAppColor),
                            borderColor: mainAppColor),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TermsAndConditionsScreen()));
                      },
                      child: Text(AppLocalizations.of(context)!
                          .translate('rules_and_terms')),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyPolicyScreen()));
                      },
                      child: Text(AppLocalizations.of(context)!
                          .translate('privacy_and_policy')),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.translate('app_version') +
                      " " +
                      "3.0.1",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textGrayColor, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    _width = MediaQuery.of(context).size.width;

    if (_authProvider!.currentUser != null) {
      print("user type:${_authProvider!.currentUser!}");
    }
    return Scaffold(
      // backgroundColor: Color(0xffEFEFEF),
      backgroundColor: _isclicked ? Colors.black.withOpacity(0.2) : whiteColor,
      body: _buildBody(),
    );
  }
}
