// ignore_for_file: unused_local_variable, unused_field, unnecessary_statements, non_constant_identifier_names, unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/follow%20methods/follow_methods.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/specific%20ad/presentation/pages/ad%20user%20profile/widgets/folllow_user_body.dart';
import 'package:sheraa/utils/app_colors.dart';

class FollowingUserScreen extends StatefulWidget {
  bool isMyPage;
  String? userID;
  String pageName;
  FollowingUserScreen(
      {Key? key, required this.isMyPage, this.userID, required this.pageName})
      : super(key: key);

  @override
  State<FollowingUserScreen> createState() => _FollowingUserScreenState();
}

class _FollowingUserScreenState extends State<FollowingUserScreen> {
  final TextEditingController searchController = TextEditingController();

  late FocusNode _searchFocusNode;

  bool _isLoading = true;

  bool _isSearchLoading = false;

  FollowMethodsProvider? _getFollowingUsersProvider;

  methodGetData() async {
    bool xo = await Provider.of<FollowMethodsProvider>(context, listen: false)
        .getFollowingUserList(
      context,
      widget.isMyPage ? UserData.getUserId().toString() : widget.userID ?? "0",
      widget.pageName == "Following page" ? true : false,
    );

    if (!xo) {
      setState(() {
        _isLoading = false;
        print(_getFollowingUsersProvider!.followingUsers.length);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getFollowingUsersProvider =
        Provider.of<FollowMethodsProvider>(context, listen: false);

    methodGetData();
    print("isloading called");
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
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
            size: _height / 50.75, //16
            typeOfFontWieght: 1,
            text: widget.pageName == "Following page"
                ? AppLocalizations.of(context)!.translate("following")
                : AppLocalizations.of(context)!.translate("follower"),
          ),
        ),
        body: _isLoading
            ? SpinKitFadingCircle(color: mainAppColor)
            : GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Divider(
                      height: 0,
                    ),
                    SizedBox(
                      height: _height / 54.13333333333333, //15
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width / 25 //15
                          ),
                      child: searchingBar(),
                    ),
                    SizedBox(
                      height: _height / 162.4, //5
                    ),
                    _isSearchLoading
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: mainAppColor,
                              ),
                            ),
                          )
                        : Expanded(child: buildList(_width, _height)),
                  ],
                ),
              ),
      ),
    ));
  }

  Widget buildList(double _width, double _height) {
    return ListView.separated(
        itemCount: searchController.text.isEmpty
            ? _getFollowingUsersProvider!.followingUsers.length
            : _getFollowingUsersProvider!.searchingFollowingUser.length,
        separatorBuilder: (context, index) {
          return Divider(
            height: 0,
            indent: _width / 20.83333333333333, //18
            endIndent: _width / 20.83333333333333, //18
          );
        },
        itemBuilder: (context, index) {
          final userDetails = searchController.text.isEmpty
              ? _getFollowingUsersProvider!.followingUsers[index]
              : _getFollowingUsersProvider!.searchingFollowingUser[index];
          return FollowUserBody(
            isMyPage: widget.isMyPage,
            userInformation: userDetails,
            pageName: widget.pageName,
          );
        });
  }

  Widget searchingBar() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height / 81.2), //15
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 37.5, //10
          ),
          Expanded(
            child: TextField(
              focusNode: _searchFocusNode,
              textAlign: TextAlign.start,
              controller: searchController,
              cursorColor: blackColor,
              style: TextStyle(color: blackColor),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 37.5,
                ),
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: UserData.getUSerLang() == "ar"
                    ? "ابحث عن المستخدم"
                    : "searching for user",
                hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 64.33, //12
                  fontWeight: FontWeight.normal,
                  color: textGrayColor,
                ),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    searchController.clear();
                  });
                } else if (value.isNotEmpty) {
                  setState(() {
                    _getFollowingUsersProvider!.getSearchingFollowingUserList(
                      context,
                      widget.isMyPage
                          ? UserData.getUserId().toString()
                          : widget.userID ?? "0",
                      value.trim(),
                      widget.pageName == "Following page" ? true : false,
                    );
                  });
                }
              },
              onTap: () {},
            ),
          ),
          Image.asset(
            "assets/images/search.png",
            color: textGrayColor,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
